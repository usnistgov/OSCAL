---
title: "Profile Model XML Format Metaschema Reference"
heading: OSCAL Profile Model XML Metaschema Reference
description: A reference for the XML element and attribute definitions for the OSCAL Profile model derived from this model's metaschema.
weight: 80
sidenav:
  title: XML Metaschema Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
---

The following is a reference of XML element and attribute definitions derived from this model's metaschema.

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml">
   <p><span class="usa-tag">OSCAL model</span> OSCAL Profile Model</p>
   <p><span class="usa-tag">Version</span> 1.0.0-rc2</p>
   <p><span class="usa-tag">Short name</span> oscal-profile</p>
   <p><span class="usa-tag">XML namespace</span> <code>http://csrc.nist.gov/ns/oscal/1.0</code></p>
   <div class="remarks">
      <p class="p">A profile designates a selection and configuration of controls from one or more catalogs,
         along with a series of operations over them. The topmost element in the OSCAL profile
         XML schema is <code>profile</code>.</p>
   </div>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/profile" class="toc1 head">Assembly
         <code>profile</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Profile</p>
      <p class="description">Each OSCAL profile is defined by a Profile element</p>
      <p class="root-name"><span class="lbl">root-name</span>profile</p>
      <div class="remarks">
         <p class="p">An OSCAL document that describes a tailoring of controls from one or more catalogs,
            with possible modification of multiple controls. It provides mechanisms by which controls
            may be selected (<code>import</code>), merged or (re)structured (<code>merge</code>), and amended (<code>modify</code>). OSCAL profiles may select subsets of controls, set parameter values for them in
            application, and even adjust the representation of controls as given in and by a catalog.
            They may also serve as sources for further modification in and by other profiles,
            that import them.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/profile/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-profile/profile/metadata">Assembly (reference) <code>metadata</code></li>
         <li id="/assembly/oscal-profile/profile/import">Assembly (reference) <code>import</code> - grouped as <code>imports</code></li>
         <li id="/assembly/oscal-profile/profile/merge">Assembly (reference) <code>merge</code></li>
         <li id="/assembly/oscal-profile/profile/modify">Assembly (reference) <code>modify</code></li>
         <li id="/assembly/oscal-profile/profile/back-matter">Assembly (reference) <code>back-matter</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/profile"
                 _metaschema-json-id="/assembly/oscal-profile/profile"
                 scope="global"
                 name="profile"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:profile"
                 _using-root-name="profile"&gt;
   &lt;formal-name&gt;Profile&lt;/formal-name&gt;
   &lt;description&gt;Each OSCAL profile is defined by a Profile element&lt;/description&gt;
   &lt;root-name&gt;profile&lt;/root-name&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-profile/profile/uuid"
                _metaschema-json-id="/assembly/oscal-profile/profile/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Catalog Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A globally unique identifier for this profile instance. This UUID should be changed when this document is revised.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;assembly _step="metadata"
                _key="metadata"
                _metaschema-xml-id="/assembly/oscal-profile/profile/metadata"
                _metaschema-json-id="/assembly/oscal-profile/profile/metadata"
                max-occurs="1"
                min-occurs="1"
                ref="metadata"
                _key-ref="oscal-metadata:metadata"
                _using-name="metadata"
                _in-xml-name="metadata"
                _in-json-name="metadata"/&gt;
      &lt;assembly _step="import"
                _key="imports"
                _group-name="imports"
                _metaschema-xml-id="/assembly/oscal-profile/profile/import"
                _metaschema-json-id="/assembly/oscal-profile/profile/imports"
                max-occurs="unbounded"
                min-occurs="1"
                ref="import"
                _key-ref="oscal-profile:import"
                _using-name="import"
                _in-xml-name="import"
                _in-json-name="imports"&gt;
         &lt;group-as name="imports" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="merge"
                _key="merge"
                _metaschema-xml-id="/assembly/oscal-profile/profile/merge"
                _metaschema-json-id="/assembly/oscal-profile/profile/merge"
                max-occurs="1"
                min-occurs="0"
                ref="merge"
                _key-ref="oscal-profile:merge"
                _using-name="merge"
                _in-xml-name="merge"
                _in-json-name="merge"/&gt;
      &lt;assembly _step="modify"
                _key="modify"
                _metaschema-xml-id="/assembly/oscal-profile/profile/modify"
                _metaschema-json-id="/assembly/oscal-profile/profile/modify"
                max-occurs="1"
                min-occurs="0"
                ref="modify"
                _key-ref="oscal-profile:modify"
                _using-name="modify"
                _in-xml-name="modify"
                _in-json-name="modify"/&gt;
      &lt;assembly _step="back-matter"
                _key="back-matter"
                _metaschema-xml-id="/assembly/oscal-profile/profile/back-matter"
                _metaschema-json-id="/assembly/oscal-profile/profile/back-matter"
                max-occurs="1"
                min-occurs="0"
                ref="back-matter"
                _key-ref="oscal-metadata:back-matter"
                _using-name="back-matter"
                _in-xml-name="back-matter"
                _in-json-name="back-matter"/&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;An OSCAL document that describes a tailoring of controls from one or more catalogs, with possible modification of multiple controls. It provides mechanisms by which controls may be selected (&lt;code&gt;import&lt;/code&gt;), merged or (re)structured (&lt;code&gt;merge&lt;/code&gt;), and amended (&lt;code&gt;modify&lt;/code&gt;). OSCAL profiles may select subsets of controls, set parameter values for them in application, and even adjust the representation of controls as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/import" class="toc1 head">Assembly
         <code>import</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Import resource</p>
      <p class="description">The <code>import</code> designates a catalog, profile, or other resource to be included (referenced and potentially
         modified) by this profile. The import also identifies which controls to select using
         the <code>include-all</code>, <code>include-controls</code>, and <code>exclude-controls</code> directives.</p>
      <div class="remarks">
         <p class="p">A profile must be based on an existing OSCAL catalog or another OSCAL profile. An
            <code>import</code> indicates such a source whose controls are to be included (referenced and modified)
            in a profile. This source will either be a catalog whose controls are given (<q>by value</q>), or a profile with its own control imports.</p>
         <p class="p">The contents of the <code>import</code> element indicate which controls from the source will be included. Controls from the
            source catalog or profile may be either selected, using the <code>include-all</code> or <code>include-controls</code> directives, or de-selected (using an <code>exclude-controls</code> directive).</p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         <div class="import">
            <p class="element-label"><span class="lbl">import</span></p>
            
            <div class="include-all">
               <p class="element-label"><span class="lbl">include-all</span></p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/import/href">Flag (defined inline) <code>href</code></li>
         <li id="/assembly/oscal-profile/import/include-all">Assembly (reference) <code>include-all</code></li>
         <li id="/assembly/oscal-profile/import/include-controls">Assembly (reference) <code>select-control-by-id</code> - using name <code>include-controls</code> - grouped as <code>include-controls</code></li>
         <li id="/assembly/oscal-profile/import/exclude-controls">Assembly (reference) <code>select-control-by-id</code> - using name <code>exclude-controls</code> - grouped as <code>exclude-controls</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/import"
                 _metaschema-json-id="/assembly/oscal-profile/import"
                 scope="global"
                 name="import"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:import"&gt;
   &lt;formal-name&gt;Import resource&lt;/formal-name&gt;
   &lt;description&gt;The &lt;code&gt;import&lt;/code&gt; designates a catalog, profile, or other resource to be included (referenced and potentially modified) by this profile. The import also identifies which controls to select using the &lt;code&gt;include-all&lt;/code&gt;, &lt;code&gt;include-controls&lt;/code&gt;, and &lt;code&gt;exclude-controls&lt;/code&gt; directives.&lt;/description&gt;
   &lt;define-flag _step="href"
                _key="href"
                _metaschema-xml-id="/assembly/oscal-profile/import/href"
                _metaschema-json-id="/assembly/oscal-profile/import/href"
                required="yes"
                as-type="uri-reference"
                name="href"
                _using-name="href"
                _in-xml-name="href"
                _in-json-name="href"&gt;
      &lt;formal-name&gt;Catalog or Profile Reference&lt;/formal-name&gt;
      &lt;description&gt;A resolvable URL reference to the base catalog or profile that this profile is tailoring.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The value of the &lt;code&gt;href&lt;/code&gt; can be an internet resource, or a local reference using a fragment e.g. #fragment that points to a &lt;code&gt;back-matter&lt;/code&gt;
            &lt;code&gt;resource&lt;/code&gt; in the same document.&lt;/p&gt;
         &lt;p&gt;If a local reference using a fragment is used, this will be indicated by a fragment "#" followed by an identifier which references an identified &lt;code&gt;resource&lt;/code&gt; in the document's &lt;code&gt;back-matter&lt;/code&gt; or another object that is within the scope of the containing OSCAL document.&lt;/p&gt;
         &lt;p&gt;If an internet resource is used, the &lt;code&gt;href&lt;/code&gt; value will be an absolute or relative URL pointing to the location of the referenced resource. A relative URL will be resolved relative to the location of the document containing the link.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;choice&gt;
         &lt;assembly _step="include-all"
                   _key="include-all"
                   _metaschema-xml-id="/assembly/oscal-profile/import/include-all"
                   _metaschema-json-id="/assembly/oscal-profile/import/include-all"
                   max-occurs="1"
                   min-occurs="1"
                   ref="include-all"
                   _key-ref="oscal-profile:include-all"
                   _using-name="include-all"
                   _in-xml-name="include-all"
                   _in-json-name="include-all"&gt;
            &lt;remarks&gt;
               &lt;p&gt;Identifies that all controls are to be included from the imported catalog or profile.&lt;/p&gt;
            &lt;/remarks&gt;
         &lt;/assembly&gt;
         &lt;assembly _step="include-controls"
                   _key="include-controls"
                   _group-name="include-controls"
                   _metaschema-xml-id="/assembly/oscal-profile/import/include-controls"
                   _metaschema-json-id="/assembly/oscal-profile/import/include-controls"
                   max-occurs="unbounded"
                   min-occurs="1"
                   ref="select-control-by-id"
                   _key-ref="oscal-profile:select-control-by-id"
                   _using-name="include-controls"
                   _in-xml-name="include-controls"
                   _in-json-name="include-controls"&gt;
            &lt;use-name&gt;include-controls&lt;/use-name&gt;
            &lt;group-as name="include-controls" in-json="ARRAY"/&gt;
            &lt;remarks&gt;
               &lt;p&gt;Identifies a subset of controls to import from the referenced catalog or profile by control identifier or match pattern.&lt;/p&gt;
            &lt;/remarks&gt;
         &lt;/assembly&gt;
      &lt;/choice&gt;
      &lt;assembly _step="exclude-controls"
                _key="exclude-controls"
                _group-name="exclude-controls"
                _metaschema-xml-id="/assembly/oscal-profile/import/exclude-controls"
                _metaschema-json-id="/assembly/oscal-profile/import/exclude-controls"
                max-occurs="unbounded"
                min-occurs="0"
                ref="select-control-by-id"
                _key-ref="oscal-profile:select-control-by-id"
                _using-name="exclude-controls"
                _in-xml-name="exclude-controls"
                _in-json-name="exclude-controls"&gt;
         &lt;use-name&gt;exclude-controls&lt;/use-name&gt;
         &lt;group-as name="exclude-controls" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Identifies which controls to exclude, or eliminate, from the set of included controls by control identifier or match pattern.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;A profile must be based on an existing OSCAL catalog or another OSCAL profile. An &lt;code&gt;import&lt;/code&gt; indicates such a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given (&lt;q&gt;by value&lt;/q&gt;), or a profile with its own control imports.&lt;/p&gt;
      &lt;p&gt;The contents of the &lt;code&gt;import&lt;/code&gt; element indicate which controls from the source will be included. Controls from the source catalog or profile may be either selected, using the &lt;code&gt;include-all&lt;/code&gt; or &lt;code&gt;include-controls&lt;/code&gt; directives, or de-selected (using an &lt;code&gt;exclude-controls&lt;/code&gt; directive).&lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;import xmlns="http://csrc.nist.gov/ns/oscal/1.0" href="catalog.xml"&gt;
         &lt;include-all/&gt;
      &lt;/import&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/merge" class="toc1 head">Assembly
         <code>merge</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Merge controls</p>
      <p class="description">A Merge element merges controls in resolution.</p>
      <div class="remarks">
         <p class="p">The contents of the <code>merge</code> element may be used to <q>reorder</q> or <q>restructure</q> controls by indicating an order and/or structure in resolution.</p>
         <p class="p">Implicitly, a <code>merge</code> element is also a filter: controls that are included in a profile, but not included
            (implicitly or explicitly) in the scope of a <code>merge</code> element, will not be merged into (will be dropped) in the resulting resolution.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/merge/combine">Assembly (reference) <code>combine</code></li>
         <li id="/assembly/oscal-profile/merge/as-is">Field (reference) <code>as-is</code></li>
         <li id="/assembly/oscal-profile/merge/custom">Assembly (reference) <code>custom</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/merge"
                 _metaschema-json-id="/assembly/oscal-profile/merge"
                 scope="global"
                 name="merge"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:merge"&gt;
   &lt;formal-name&gt;Merge controls&lt;/formal-name&gt;
   &lt;description&gt;A Merge element merges controls in resolution.&lt;/description&gt;
   &lt;model&gt;
      &lt;assembly _step="combine"
                _key="combine"
                _metaschema-xml-id="/assembly/oscal-profile/merge/combine"
                _metaschema-json-id="/assembly/oscal-profile/merge/combine"
                max-occurs="1"
                min-occurs="0"
                ref="combine"
                _key-ref="oscal-profile:combine"
                _using-name="combine"
                _in-xml-name="combine"
                _in-json-name="combine"/&gt;
      &lt;choice&gt;
         &lt;field _step="as-is"
                _key="as-is"
                _metaschema-xml-id="/assembly/oscal-profile/merge/as-is"
                _metaschema-json-id="/assembly/oscal-profile/merge/as-is"
                max-occurs="1"
                min-occurs="0"
                ref="as-is"
                _key-ref="oscal-profile:as-is"
                _using-name="as-is"
                _in-xml-name="as-is"
                _in-json-name="as-is"/&gt;
         &lt;assembly _step="custom"
                   _key="custom"
                   _metaschema-xml-id="/assembly/oscal-profile/merge/custom"
                   _metaschema-json-id="/assembly/oscal-profile/merge/custom"
                   max-occurs="1"
                   min-occurs="0"
                   ref="custom"
                   _key-ref="oscal-profile:custom"
                   _using-name="custom"
                   _in-xml-name="custom"
                   _in-json-name="custom"/&gt;
      &lt;/choice&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;The contents of the &lt;code&gt;merge&lt;/code&gt; element may be used to &lt;q&gt;reorder&lt;/q&gt; or &lt;q&gt;restructure&lt;/q&gt; controls by indicating an order and/or structure in resolution.&lt;/p&gt;
      &lt;p&gt;Implicitly, a &lt;code&gt;merge&lt;/code&gt; element is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a &lt;code&gt;merge&lt;/code&gt; element, will not be merged into (will be dropped) in the resulting resolution.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/combine" class="toc1 head">Assembly
         <code>combine</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Combination rule</p>
      <p class="description">A Combine element defines whether and how to combine multiple (competing) versions
         of the same control</p>
      <div class="remarks">
         <p class="p">Whenever combining controls from multiple (import) pathways, an issue arises of what
            to do with clashing invocations (multiple competing versions of a control). </p>
         <p class="p">This setting permits a profile designer to apply a rule for the resolution of such
            cases. In a well-designed profile, such collisions would ordinarily be avoided, but
            this setting can be useful for defining what to do when it occurs.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/combine/method">Flag (reference) <code>method</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/combine"
                 _metaschema-json-id="/assembly/oscal-profile/combine"
                 scope="global"
                 name="combine"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:combine"&gt;
   &lt;formal-name&gt;Combination rule&lt;/formal-name&gt;
   &lt;description&gt;A Combine element defines whether and how to combine multiple (competing) versions of the same control&lt;/description&gt;
   &lt;flag _step="method"
         _key="method"
         _metaschema-xml-id="/assembly/oscal-profile/combine/method"
         _metaschema-json-id="/assembly/oscal-profile/combine/method"
         as-type="string"
         required="no"
         ref="method"
         _key-ref="oscal-profile:method"
         _using-name="method"
         _in-xml-name="method"
         _in-json-name="method"/&gt;
   &lt;remarks&gt;
      &lt;p&gt;Whenever combining controls from multiple (import) pathways, an issue arises of what to do with clashing invocations (multiple competing versions of a control). &lt;/p&gt;
      &lt;p&gt;This setting permits a profile designer to apply a rule for the resolution of such cases. In a well-designed profile, such collisions would ordinarily be avoided, but this setting can be useful for defining what to do when it occurs.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-profile/as-is" class="toc1 head">Field <code>as-is</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">As is</p>
      <p class="description">An As-is element indicates that the controls should be structured in resolution as
         they are structured in their source catalogs. It does not contain any elements or
         attributes.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-profile/as-is"
              _metaschema-json-id="/field/oscal-profile/as-is"
              collapsible="no"
              as-type="boolean"
              scope="global"
              name="as-is"
              module="oscal-profile"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
              _key-name="oscal-profile:as-is"&gt;
   &lt;formal-name&gt;As is&lt;/formal-name&gt;
   &lt;description&gt;An As-is element indicates that the controls should be structured in resolution as they are structured in their source catalogs. It does not contain any elements or attributes.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-profile/method" class="toc1 head">Flag <code>method</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Combination method</p>
      <p class="description">How clashing controls should be handled</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Use the first definition - the first control with a given ID is used; subsequent ones
               are discarded</p>
            
            <p class="enum"><span class="lbl">enum</span>Merge - controls with the same ID are combined</p>
            
            <p class="enum"><span class="lbl">enum</span>Keep - controls with the same ID are kept, retaining the clash</p>
            </div>
         </div>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-profile/method"
             _metaschema-json-id="/flag/oscal-profile/method"
             as-type="string"
             scope="global"
             name="method"
             module="oscal-profile"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
             _key-name="oscal-profile:method"&gt;
   &lt;formal-name&gt;Combination method&lt;/formal-name&gt;
   &lt;description&gt;How clashing controls should be handled&lt;/description&gt;
   &lt;constraint&gt;
      &lt;allowed-values&gt;
         &lt;enum value="use-first"&gt;Use the first definition - the first control with a given ID is used; subsequent ones are discarded&lt;/enum&gt;
         &lt;enum value="merge"&gt;Merge - controls with the same ID are combined&lt;/enum&gt;
         &lt;enum value="keep"&gt;Keep - controls with the same ID are kept, retaining the clash&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/custom" class="toc1 head">Assembly
         <code>custom</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Custom grouping</p>
      <p class="description">A Custom element frames a structure for embedding represented controls in resolution.</p>
      <div class="remarks">
         <p class="p">The <code>custom</code> element represents a custom arrangement or organization of controls in the resolution
            of a catalog.</p>
         <p class="p">While the <code>as-is</code> element provides for a restitution of a control set's organization (in one or more
            source catalogs), this element permits the definition of an entirely different structure.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/custom/group">Assembly (reference) <code>group</code> - grouped as <code>groups</code></li>
         <li id="/assembly/oscal-profile/custom/insert-controls">Assembly (reference) <code>insert-controls</code> - grouped as <code>insert-controls</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/custom"
                 _metaschema-json-id="/assembly/oscal-profile/custom"
                 scope="global"
                 name="custom"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:custom"&gt;
   &lt;formal-name&gt;Custom grouping&lt;/formal-name&gt;
   &lt;description&gt;A Custom element frames a structure for embedding represented controls in resolution.&lt;/description&gt;
   &lt;model&gt;
      &lt;assembly _step="group"
                _key="groups"
                _group-name="groups"
                _metaschema-xml-id="/assembly/oscal-profile/custom/group"
                _metaschema-json-id="/assembly/oscal-profile/custom/groups"
                max-occurs="unbounded"
                min-occurs="0"
                ref="group"
                _key-ref="oscal-profile:group"
                _using-name="group"
                _in-xml-name="group"
                _in-json-name="groups"&gt;
         &lt;group-as name="groups" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="insert-controls"
                _key="insert-controls"
                _group-name="insert-controls"
                _metaschema-xml-id="/assembly/oscal-profile/custom/insert-controls"
                _metaschema-json-id="/assembly/oscal-profile/custom/insert-controls"
                max-occurs="unbounded"
                min-occurs="0"
                ref="insert-controls"
                _key-ref="oscal-profile:insert-controls"
                _using-name="insert-controls"
                _in-xml-name="insert-controls"
                _in-json-name="insert-controls"&gt;
         &lt;group-as name="insert-controls" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;The &lt;code&gt;custom&lt;/code&gt; element represents a custom arrangement or organization of controls in the resolution of a catalog.&lt;/p&gt;
      &lt;p&gt;While the &lt;code&gt;as-is&lt;/code&gt; element provides for a restitution of a control set's organization (in one or more source catalogs), this element permits the definition of an entirely different structure.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/group" class="toc1 head">Assembly
         <code>group</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Control group</p>
      <p class="description">A group of (selected) controls or of groups of controls</p>
      <div class="remarks">
         <p class="p">This construct mirrors the same construct that exists in an OSCAL catalog.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/group/id">Flag (defined inline) <code>id</code></li>
         <li id="/assembly/oscal-profile/group/class">Flag (defined inline) <code>class</code></li>
         <li id="/assembly/oscal-profile/group/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-profile/group/param">Assembly (reference) <code>parameter</code> - grouped as <code>params</code></li>
         <li id="/assembly/oscal-profile/group/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-profile/group/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-profile/group/part">Assembly (reference) <code>part</code> - grouped as <code>parts</code></li>
         <li id="/assembly/oscal-profile/group/group">Assembly (reference) <code>group</code> - grouped as <code>groups</code></li>
         <li id="/assembly/oscal-profile/group/insert-controls">Assembly (reference) <code>insert-controls</code> - grouped as <code>insert-controls</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/group"
                 _metaschema-json-id="/assembly/oscal-profile/group"
                 scope="global"
                 name="group"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:group"&gt;
   &lt;formal-name&gt;Control group&lt;/formal-name&gt;
   &lt;description&gt;A group of (selected) controls or of groups of controls&lt;/description&gt;
   &lt;define-flag _step="id"
                _key="id"
                _metaschema-xml-id="/assembly/oscal-profile/group/id"
                _metaschema-json-id="/assembly/oscal-profile/group/id"
                required="no"
                as-type="NCName"
                name="id"
                _using-name="id"
                _in-xml-name="id"
                _in-json-name="id"&gt;
      &lt;formal-name&gt;Group Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier for a specific group instance that can be used to reference the group within this and in other OSCAL documents. This identifier's uniqueness is document scoped and is intended to be consistent for the same group across minor revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="class"
                _key="class"
                _metaschema-xml-id="/assembly/oscal-profile/group/class"
                _metaschema-json-id="/assembly/oscal-profile/group/class"
                required="no"
                as-type="NCName"
                name="class"
                _using-name="class"
                _in-xml-name="class"
                _in-json-name="class"&gt;
      &lt;formal-name&gt;Group Class&lt;/formal-name&gt;
      &lt;description&gt;A textual label that provides a sub-type or characterization of the group.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can be used in validation rules to express extra constraints over named items of a specific &lt;code&gt;class&lt;/code&gt; value.&lt;/p&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can also be used in an OSCAL profile as a means to target an alteration to control content.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-profile/group/title"
                    _metaschema-json-id="/assembly/oscal-profile/group/title"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Group Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the group, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="param"
                _key="params"
                _group-name="params"
                _metaschema-xml-id="/assembly/oscal-profile/group/param"
                _metaschema-json-id="/assembly/oscal-profile/group/params"
                max-occurs="unbounded"
                min-occurs="0"
                ref="parameter"
                _key-ref="oscal-catalog-common:parameter"
                _using-name="param"
                _in-xml-name="param"
                _in-json-name="params"&gt;
         &lt;group-as name="params" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-profile/group/prop"
                _metaschema-json-id="/assembly/oscal-profile/group/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-profile/group/link"
                _metaschema-json-id="/assembly/oscal-profile/group/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="part"
                _key="parts"
                _group-name="parts"
                _metaschema-xml-id="/assembly/oscal-profile/group/part"
                _metaschema-json-id="/assembly/oscal-profile/group/parts"
                max-occurs="unbounded"
                min-occurs="0"
                ref="part"
                _key-ref="oscal-catalog-common:part"
                _using-name="part"
                _in-xml-name="part"
                _in-json-name="parts"&gt;
         &lt;group-as name="parts" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;choice&gt;
         &lt;assembly _step="group"
                   _key="groups"
                   _group-name="groups"
                   _metaschema-xml-id="/assembly/oscal-profile/group/group"
                   _metaschema-json-id="/assembly/oscal-profile/group/groups"
                   max-occurs="unbounded"
                   min-occurs="0"
                   ref="group"
                   _key-ref="oscal-profile:group"
                   _using-name="group"
                   _in-xml-name="group"
                   _in-json-name="groups"&gt;
            &lt;group-as name="groups" in-json="ARRAY"/&gt;
         &lt;/assembly&gt;
         &lt;assembly _step="insert-controls"
                   _key="insert-controls"
                   _group-name="insert-controls"
                   _metaschema-xml-id="/assembly/oscal-profile/group/insert-controls"
                   _metaschema-json-id="/assembly/oscal-profile/group/insert-controls"
                   max-occurs="unbounded"
                   min-occurs="0"
                   ref="insert-controls"
                   _key-ref="oscal-profile:insert-controls"
                   _using-name="insert-controls"
                   _in-xml-name="insert-controls"
                   _in-json-name="insert-controls"&gt;
            &lt;group-as name="insert-controls" in-json="ARRAY"/&gt;
         &lt;/assembly&gt;
      &lt;/choice&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;This construct mirrors the same construct that exists in an OSCAL catalog.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/modify" class="toc1 head">Assembly
         <code>modify</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Modify controls</p>
      <p class="description">Set parameters or amend controls in resolution</p>
      <ul class="model">
         <li id="/assembly/oscal-profile/modify/set-parameter">Assembly (defined inline) <code>set-parameter</code> - grouped as <code>set-parameters</code></li>
         <li id="/assembly/oscal-profile/modify/alter">Assembly (reference) <code>alter</code> - grouped as <code>alters</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/modify"
                 _metaschema-json-id="/assembly/oscal-profile/modify"
                 scope="global"
                 name="modify"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:modify"&gt;
   &lt;formal-name&gt;Modify controls&lt;/formal-name&gt;
   &lt;description&gt;Set parameters or amend controls in resolution&lt;/description&gt;
   &lt;model&gt;
      &lt;define-assembly _step="set-parameter"
                       _key="set-parameters"
                       _group-name="set-parameters"
                       _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter"
                       _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="set-parameter"
                       _using-name="set-parameter"
                       _in-xml-name="set-parameter"
                       _in-json-name="set-parameters"&gt;
         &lt;formal-name&gt;Parameter Setting&lt;/formal-name&gt;
         &lt;description&gt;A parameter setting, to be propagated to points of insertion&lt;/description&gt;
         &lt;group-as name="set-parameters" in-json="ARRAY"/&gt;
         &lt;define-flag _step="param-id"
                      _key="param-id"
                      _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/param-id"
                      _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/param-id"
                      required="yes"
                      as-type="NCName"
                      name="param-id"
                      _using-name="param-id"
                      _in-xml-name="param-id"
                      _in-json-name="param-id"&gt;
            &lt;formal-name&gt;Parameter ID&lt;/formal-name&gt;
            &lt;description&gt;Indicates the value of the 'id' flag on a target parameter; i.e. which parameter to set&lt;/description&gt;
         &lt;/define-flag&gt;
         &lt;define-flag _step="class"
                      _key="class"
                      _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/class"
                      _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/class"
                      required="no"
                      as-type="NCName"
                      name="class"
                      _using-name="class"
                      _in-xml-name="class"
                      _in-json-name="class"&gt;
            &lt;formal-name&gt;Parameter Class&lt;/formal-name&gt;
            &lt;description&gt;A textual label that provides a characterization of the parameter.&lt;/description&gt;
            &lt;remarks&gt;
               &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can be used in validation rules to express extra constraints over named items of a specific &lt;code&gt;class&lt;/code&gt; value.&lt;/p&gt;
            &lt;/remarks&gt;
         &lt;/define-flag&gt;
         &lt;flag _step="depends-on"
               _key="depends-on"
               _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/depends-on"
               _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/depends-on"
               as-type="NCName"
               required="no"
               ref="depends-on"
               _key-ref="oscal-catalog-common:depends-on"
               _using-name="depends-on"
               _in-xml-name="depends-on"
               _in-json-name="depends-on"/&gt;
         &lt;model&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/prop"
                      _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="link"
                      _key="links"
                      _group-name="links"
                      _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/link"
                      _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/links"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="link"
                      _key-ref="oscal-metadata:link"
                      _using-name="link"
                      _in-xml-name="link"
                      _in-json-name="links"&gt;
               &lt;group-as name="links" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;define-field _step="label"
                          _key="label"
                          _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/label"
                          _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/label"
                          max-occurs="1"
                          min-occurs="0"
                          collapsible="no"
                          as-type="markup-line"
                          name="label"
                          _using-name="label"
                          _in-xml-name="label"
                          _in-json-name="label"&gt;
               &lt;formal-name&gt;Parameter Label&lt;/formal-name&gt;
               &lt;description&gt;A short, placeholder name for the parameter, which can be used as a substitute for a &lt;code&gt;value&lt;/code&gt; if no value is assigned.&lt;/description&gt;
               &lt;remarks&gt;
                  &lt;p&gt;The label value should be suitable for inline display in a rendered catalog.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/define-field&gt;
            &lt;define-field _step="usage"
                          _key="usage"
                          _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/usage"
                          _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/usage"
                          max-occurs="1"
                          min-occurs="0"
                          in-xml="WITH_WRAPPER"
                          collapsible="no"
                          as-type="markup-multiline"
                          name="usage"
                          _using-name="usage"
                          _in-xml-name="usage"
                          _in-json-name="usage"&gt;
               &lt;formal-name&gt;Parameter Usage Description&lt;/formal-name&gt;
               &lt;description&gt;Describes the purpose and use of a parameter&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;assembly _step="constraint"
                      _key="constraints"
                      _group-name="constraints"
                      _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/constraint"
                      _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/constraints"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="parameter-constraint"
                      _key-ref="oscal-catalog-common:parameter-constraint"
                      _using-name="constraint"
                      _in-xml-name="constraint"
                      _in-json-name="constraints"&gt;
               &lt;use-name&gt;constraint&lt;/use-name&gt;
               &lt;group-as name="constraints" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="guideline"
                      _key="guidelines"
                      _group-name="guidelines"
                      _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/guideline"
                      _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/guidelines"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="parameter-guideline"
                      _key-ref="oscal-catalog-common:parameter-guideline"
                      _using-name="guideline"
                      _in-xml-name="guideline"
                      _in-json-name="guidelines"&gt;
               &lt;use-name&gt;guideline&lt;/use-name&gt;
               &lt;group-as name="guidelines" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;choice&gt;
               &lt;field _step="value"
                      _key="values"
                      _group-name="values"
                      _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/value"
                      _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/values"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="parameter-value"
                      _key-ref="oscal-catalog-common:parameter-value"
                      _using-name="value"
                      _in-xml-name="value"
                      _in-json-name="values"&gt;
                  &lt;use-name&gt;value&lt;/use-name&gt;
                  &lt;group-as name="values" in-json="ARRAY"/&gt;
                  &lt;remarks&gt;
                     &lt;p&gt;Used to (re)define a parameter value.&lt;/p&gt;
                  &lt;/remarks&gt;
               &lt;/field&gt;
               &lt;assembly _step="select"
                         _key="select"
                         _metaschema-xml-id="/assembly/oscal-profile/modify/set-parameter/select"
                         _metaschema-json-id="/assembly/oscal-profile/modify/set-parameters/select"
                         max-occurs="1"
                         min-occurs="0"
                         ref="parameter-selection"
                         _key-ref="oscal-catalog-common:parameter-selection"
                         _using-name="select"
                         _in-xml-name="select"
                         _in-json-name="select"&gt;
                  &lt;use-name&gt;select&lt;/use-name&gt;
               &lt;/assembly&gt;
            &lt;/choice&gt;
         &lt;/model&gt;
         &lt;constraint&gt;
            &lt;is-unique name="unique-profile-modify-set-parameter" target="set-parameter"&gt;
               &lt;key-field target="@param-id"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;Since multiple &lt;code&gt;set-parameter&lt;/code&gt; entries can be provided, each parameter must be set only once.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/is-unique&gt;
         &lt;/constraint&gt;
      &lt;/define-assembly&gt;
      &lt;assembly _step="alter"
                _key="alters"
                _group-name="alters"
                _metaschema-xml-id="/assembly/oscal-profile/modify/alter"
                _metaschema-json-id="/assembly/oscal-profile/modify/alters"
                max-occurs="unbounded"
                min-occurs="0"
                ref="alter"
                _key-ref="oscal-profile:alter"
                _using-name="alter"
                _in-xml-name="alter"
                _in-json-name="alters"&gt;
         &lt;group-as name="alters" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/insert-controls" class="toc1 head">Assembly
         <code>insert-controls</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Select controls</p>
      <p class="description">Specifies which controls to use in the containing context.</p>
      <div class="remarks">
         <p class="p">To be schema-valid, this element must contain either (but not both) a single <code>include-all</code> directive, or a sequence of <code>include-controls</code> directives.</p>
         <p class="p">If this directive is not provided, then no controls are to be inserted; i.e., all
            controls are included explicitly.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/insert-controls/order">Flag (defined inline) <code>order</code></li>
         <li id="/assembly/oscal-profile/insert-controls/include-all">Assembly (reference) <code>include-all</code></li>
         <li id="/assembly/oscal-profile/insert-controls/include-controls">Assembly (reference) <code>select-control-by-id</code> - using name <code>include-controls</code> - grouped as <code>include-controls</code></li>
         <li id="/assembly/oscal-profile/insert-controls/exclude-controls">Assembly (reference) <code>select-control-by-id</code> - using name <code>exclude-controls</code> - grouped as <code>exclude-controls</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/insert-controls"
                 _metaschema-json-id="/assembly/oscal-profile/insert-controls"
                 scope="global"
                 name="insert-controls"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:insert-controls"&gt;
   &lt;formal-name&gt;Select controls&lt;/formal-name&gt;
   &lt;description&gt;Specifies which controls to use in the containing context.&lt;/description&gt;
   &lt;define-flag _step="order"
                _key="order"
                _metaschema-xml-id="/assembly/oscal-profile/insert-controls/order"
                _metaschema-json-id="/assembly/oscal-profile/insert-controls/order"
                required="no"
                as-type="NCName"
                name="order"
                _using-name="order"
                _in-xml-name="order"
                _in-json-name="order"&gt;
      &lt;formal-name&gt;Order&lt;/formal-name&gt;
      &lt;description&gt;A designation of how a selection of controls in a profile is to be ordered.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values&gt;
            &lt;enum value="keep"/&gt;
            &lt;enum value="ascending"/&gt;
            &lt;enum value="descending"/&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;choice&gt;
         &lt;assembly _step="include-all"
                   _key="include-all"
                   _metaschema-xml-id="/assembly/oscal-profile/insert-controls/include-all"
                   _metaschema-json-id="/assembly/oscal-profile/insert-controls/include-all"
                   max-occurs="1"
                   min-occurs="1"
                   ref="include-all"
                   _key-ref="oscal-profile:include-all"
                   _using-name="include-all"
                   _in-xml-name="include-all"
                   _in-json-name="include-all"/&gt;
         &lt;assembly _step="include-controls"
                   _key="include-controls"
                   _group-name="include-controls"
                   _metaschema-xml-id="/assembly/oscal-profile/insert-controls/include-controls"
                   _metaschema-json-id="/assembly/oscal-profile/insert-controls/include-controls"
                   max-occurs="unbounded"
                   min-occurs="1"
                   ref="select-control-by-id"
                   _key-ref="oscal-profile:select-control-by-id"
                   _using-name="include-controls"
                   _in-xml-name="include-controls"
                   _in-json-name="include-controls"&gt;
            &lt;use-name&gt;include-controls&lt;/use-name&gt;
            &lt;group-as name="include-controls" in-json="ARRAY"/&gt;
         &lt;/assembly&gt;
      &lt;/choice&gt;
      &lt;assembly _step="exclude-controls"
                _key="exclude-controls"
                _group-name="exclude-controls"
                _metaschema-xml-id="/assembly/oscal-profile/insert-controls/exclude-controls"
                _metaschema-json-id="/assembly/oscal-profile/insert-controls/exclude-controls"
                max-occurs="unbounded"
                min-occurs="0"
                ref="select-control-by-id"
                _key-ref="oscal-profile:select-control-by-id"
                _using-name="exclude-controls"
                _in-xml-name="exclude-controls"
                _in-json-name="exclude-controls"&gt;
         &lt;use-name&gt;exclude-controls&lt;/use-name&gt;
         &lt;group-as name="exclude-controls" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Identifies which controls to exclude, or eliminate, from the set of matching includes.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;To be schema-valid, this element must contain either (but not both) a single &lt;code&gt;include-all&lt;/code&gt; directive, or a sequence of &lt;code&gt;include-controls&lt;/code&gt; directives.&lt;/p&gt;
      &lt;p&gt;If this directive is not provided, then no controls are to be inserted; i.e., all controls are included explicitly.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/include-all" class="toc1 head">Assembly
         <code>include-all</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Insert All</p>
      <p class="description">Insert all controls from the imported catalog or profile resources identified in the
         <code>import</code> directive.</p>
      <div class="remarks">
         <p class="p">This element provides an alternative to calling controls individually from a catalog.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/include-all"
                 _metaschema-json-id="/assembly/oscal-profile/include-all"
                 scope="global"
                 name="include-all"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:include-all"&gt;
   &lt;formal-name&gt;Insert All&lt;/formal-name&gt;
   &lt;description&gt;Insert all controls from the imported catalog or profile resources identified in the &lt;code&gt;import&lt;/code&gt; directive.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;This element provides an alternative to calling controls individually from a catalog.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/select-control-by-id" class="toc1 head">Assembly
         <code>select-control-by-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Call</p>
      <p class="description">Call a control by its ID</p>
      <div class="remarks">
         <p class="p">If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
            this is how control enhancements are represented (as controls within controls), this
            provides a way to include controls with all their dependent controls (enhancements)
            without having to call them individually.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/select-control-by-id/with-child-controls">Flag (reference) <code>with-child-controls</code></li>
         <li id="/assembly/oscal-profile/select-control-by-id/with-id">Field (defined inline) <code>with-id</code> - grouped as <code>with-ids</code></li>
         <li id="/assembly/oscal-profile/select-control-by-id/matching">Assembly (defined inline) <code>matching</code> - grouped as <code>matching</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/select-control-by-id"
                 _metaschema-json-id="/assembly/oscal-profile/select-control-by-id"
                 scope="local"
                 name="select-control-by-id"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:select-control-by-id"&gt;
   &lt;formal-name&gt;Call&lt;/formal-name&gt;
   &lt;description&gt;Call a control by its ID&lt;/description&gt;
   &lt;flag _step="with-child-controls"
         _key="with-child-controls"
         _metaschema-xml-id="/assembly/oscal-profile/select-control-by-id/with-child-controls"
         _metaschema-json-id="/assembly/oscal-profile/select-control-by-id/with-child-controls"
         as-type="NCName"
         required="no"
         ref="with-child-controls"
         _key-ref="oscal-profile:with-child-controls"
         _using-name="with-child-controls"
         _in-xml-name="with-child-controls"
         _in-json-name="with-child-controls"/&gt;
   &lt;model&gt;
      &lt;define-field _step="with-id"
                    _key="with-ids"
                    _group-name="with-ids"
                    _metaschema-xml-id="/assembly/oscal-profile/select-control-by-id/with-id"
                    _metaschema-json-id="/assembly/oscal-profile/select-control-by-id/with-ids"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="NCName"
                    name="with-id"
                    _using-name="with-id"
                    _in-xml-name="with-id"
                    _in-json-name="with-ids"&gt;
         &lt;formal-name&gt;Match Controls by Identifier&lt;/formal-name&gt;
         &lt;description/&gt;
         &lt;group-as name="with-ids" in-json="ARRAY"/&gt;
      &lt;/define-field&gt;
      &lt;define-assembly _step="matching"
                       _key="matching"
                       _group-name="matching"
                       _metaschema-xml-id="/assembly/oscal-profile/select-control-by-id/matching"
                       _metaschema-json-id="/assembly/oscal-profile/select-control-by-id/matching"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="matching"
                       _using-name="matching"
                       _in-xml-name="matching"
                       _in-json-name="matching"&gt;
         &lt;formal-name&gt;Match Controls by Pattern&lt;/formal-name&gt;
         &lt;description&gt;Select controls by (regular expression) match on ID&lt;/description&gt;
         &lt;group-as name="matching" in-json="ARRAY"/&gt;
         &lt;flag _step="pattern"
               _key="pattern"
               _metaschema-xml-id="/assembly/oscal-profile/select-control-by-id/matching/pattern"
               _metaschema-json-id="/assembly/oscal-profile/select-control-by-id/matching/pattern"
               as-type="string"
               required="no"
               ref="pattern"
               _key-ref="oscal-profile:pattern"
               _using-name="pattern"
               _in-xml-name="pattern"
               _in-json-name="pattern"/&gt;
      &lt;/define-assembly&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;If &lt;code&gt;with-child-controls&lt;/code&gt; is &lt;q&gt;yes&lt;/q&gt; on the call to a control, no sibling &lt;code&gt;call&lt;/code&gt;elements need to be used to call any controls appearing within it. Since generally, this is how control enhancements are represented (as controls within controls), this provides a way to include controls with all their dependent controls (enhancements) without having to call them individually.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/alter" class="toc1 head">Assembly
         <code>alter</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Alteration</p>
      <p class="description">An Alter element specifies changes to be made to an included control when a profile
         is resolved.</p>
      <div class="remarks">
         <p class="p">Use <code>@control-id</code> to indicate the scope of alteration.</p>
         <p class="p">It is an error for two <code>alter</code> elements to apply to the same control. In practice, multiple alterations can be applied
            (together), but it creates confusion.</p>
         <p class="p">At present, no provision is made for altering many controls at once (for example,
            to systematically remove properties or add global properties); extending this element
            to match multiple control IDs could provide for this.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/alter/control-id">Flag (reference) <code>control-id</code></li>
         <li id="/assembly/oscal-profile/alter/remove">Assembly (reference) <code>remove</code> - grouped as <code>removes</code></li>
         <li id="/assembly/oscal-profile/alter/add">Assembly (reference) <code>add</code> - grouped as <code>adds</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/alter"
                 _metaschema-json-id="/assembly/oscal-profile/alter"
                 scope="global"
                 name="alter"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:alter"&gt;
   &lt;formal-name&gt;Alteration&lt;/formal-name&gt;
   &lt;description&gt;An Alter element specifies changes to be made to an included control when a profile is resolved.&lt;/description&gt;
   &lt;flag _step="control-id"
         _key="control-id"
         _metaschema-xml-id="/assembly/oscal-profile/alter/control-id"
         _metaschema-json-id="/assembly/oscal-profile/alter/control-id"
         as-type="NCName"
         required="no"
         ref="control-id"
         _key-ref="oscal-catalog-common:control-id"
         _using-name="control-id"
         _in-xml-name="control-id"
         _in-json-name="control-id"/&gt;
   &lt;model&gt;
      &lt;assembly _step="remove"
                _key="removes"
                _group-name="removes"
                _metaschema-xml-id="/assembly/oscal-profile/alter/remove"
                _metaschema-json-id="/assembly/oscal-profile/alter/removes"
                max-occurs="unbounded"
                min-occurs="0"
                ref="remove"
                _key-ref="oscal-profile:remove"
                _using-name="remove"
                _in-xml-name="remove"
                _in-json-name="removes"&gt;
         &lt;group-as name="removes" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="add"
                _key="adds"
                _group-name="adds"
                _metaschema-xml-id="/assembly/oscal-profile/alter/add"
                _metaschema-json-id="/assembly/oscal-profile/alter/adds"
                max-occurs="unbounded"
                min-occurs="0"
                ref="add"
                _key-ref="oscal-profile:add"
                _using-name="add"
                _in-xml-name="add"
                _in-json-name="adds"&gt;
         &lt;group-as name="adds" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;Use &lt;code&gt;@control-id&lt;/code&gt; to indicate the scope of alteration.&lt;/p&gt;
      &lt;p&gt;It is an error for two &lt;code&gt;alter&lt;/code&gt; elements to apply to the same control. In practice, multiple alterations can be applied (together), but it creates confusion.&lt;/p&gt;
      &lt;p&gt;At present, no provision is made for altering many controls at once (for example, to systematically remove properties or add global properties); extending this element to match multiple control IDs could provide for this.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/remove" class="toc1 head">Assembly
         <code>remove</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Removal</p>
      <p class="description">Specifies objects to be removed from a control based on specific aspects of the object
         that must all match.</p>
      <div class="remarks">
         <p class="p">Use <code>name-ref</code>, <code>class-ref</code>, <code>id-ref</code> or <code>generic-identifier</code> to indicate class tokens or ID reference, or the formal name, of the component to
            be removed or erased from a control, when a catalog is resolved. The control affected
            is indicated by the pointer on the removal's parent (containing) <code>alter</code> element.</p>
         <p class="p">To change an element, use <code>remove</code> to remove the element, then <code>add</code> to add it back again with changes.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/remove/by-name">Flag (defined inline) <code>by-name</code></li>
         <li id="/assembly/oscal-profile/remove/by-class">Flag (defined inline) <code>by-class</code></li>
         <li id="/assembly/oscal-profile/remove/by-id">Flag (defined inline) <code>by-id</code></li>
         <li id="/assembly/oscal-profile/remove/by-item-name">Flag (defined inline) <code>by-item-name</code></li>
         <li id="/assembly/oscal-profile/remove/by-ns">Flag (defined inline) <code>by-ns</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/remove"
                 _metaschema-json-id="/assembly/oscal-profile/remove"
                 scope="global"
                 name="remove"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:remove"&gt;
   &lt;formal-name&gt;Removal&lt;/formal-name&gt;
   &lt;description&gt;Specifies objects to be removed from a control based on specific aspects of the object that must all match.&lt;/description&gt;
   &lt;define-flag _step="by-name"
                _key="by-name"
                _metaschema-xml-id="/assembly/oscal-profile/remove/by-name"
                _metaschema-json-id="/assembly/oscal-profile/remove/by-name"
                required="no"
                as-type="NCName"
                name="by-name"
                _using-name="by-name"
                _in-xml-name="by-name"
                _in-json-name="by-name"&gt;
      &lt;formal-name&gt;Reference by (assigned) name&lt;/formal-name&gt;
      &lt;description&gt;Identify items to remove by matching their assigned name&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="by-class"
                _key="by-class"
                _metaschema-xml-id="/assembly/oscal-profile/remove/by-class"
                _metaschema-json-id="/assembly/oscal-profile/remove/by-class"
                required="no"
                as-type="NCName"
                name="by-class"
                _using-name="by-class"
                _in-xml-name="by-class"
                _in-json-name="by-class"&gt;
      &lt;formal-name&gt;Reference by class&lt;/formal-name&gt;
      &lt;description&gt;Identify items to remove by matching their &lt;code&gt;class&lt;/code&gt;.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="by-id"
                _key="by-id"
                _metaschema-xml-id="/assembly/oscal-profile/remove/by-id"
                _metaschema-json-id="/assembly/oscal-profile/remove/by-id"
                required="no"
                as-type="NCName"
                name="by-id"
                _using-name="by-id"
                _in-xml-name="by-id"
                _in-json-name="by-id"&gt;
      &lt;formal-name&gt;Reference by ID&lt;/formal-name&gt;
      &lt;description&gt;Identify items to remove indicated by their &lt;code&gt;id&lt;/code&gt;.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="by-item-name"
                _key="by-item-name"
                _metaschema-xml-id="/assembly/oscal-profile/remove/by-item-name"
                _metaschema-json-id="/assembly/oscal-profile/remove/by-item-name"
                required="no"
                as-type="NCName"
                name="by-item-name"
                _using-name="by-item-name"
                _in-xml-name="by-item-name"
                _in-json-name="by-item-name"&gt;
      &lt;formal-name&gt;Item Name Reference&lt;/formal-name&gt;
      &lt;description&gt;Identify items to remove by the name of the item's information element name, e.g. &lt;code&gt;title&lt;/code&gt; or &lt;code&gt;prop&lt;/code&gt;
      &lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="by-ns"
                _key="by-ns"
                _metaschema-xml-id="/assembly/oscal-profile/remove/by-ns"
                _metaschema-json-id="/assembly/oscal-profile/remove/by-ns"
                required="no"
                as-type="NCName"
                name="by-ns"
                _using-name="by-ns"
                _in-xml-name="by-ns"
                _in-json-name="by-ns"&gt;
      &lt;formal-name&gt;Item Namespace Reference&lt;/formal-name&gt;
      &lt;description&gt;Identify items to remove by the item's &lt;code&gt;ns&lt;/code&gt;, which is the namespace associated with a &lt;code&gt;part&lt;/code&gt;, or &lt;code&gt;prop&lt;/code&gt;.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;remarks&gt;
      &lt;p&gt;Use &lt;code&gt;name-ref&lt;/code&gt;, &lt;code&gt;class-ref&lt;/code&gt;, &lt;code&gt;id-ref&lt;/code&gt; or &lt;code&gt;generic-identifier&lt;/code&gt; to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control, when a catalog is resolved. The control affected is indicated by the pointer on the removal's parent (containing) &lt;code&gt;alter&lt;/code&gt; element.&lt;/p&gt;
      &lt;p&gt;To change an element, use &lt;code&gt;remove&lt;/code&gt; to remove the element, then &lt;code&gt;add&lt;/code&gt; to add it back again with changes.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-profile/add" class="toc1 head">Assembly
         <code>add</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Addition</p>
      <p class="description">Specifies contents to be added into controls, in resolution</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A human-readable label for the parent context.</p>
            
            <p class="enum"><span class="lbl">enum</span>An alternative identifier, whose value is easily sortable among other such values
               in the document.</p>
            
            </div>
         </div>
      <div class="remarks">
         <p class="p">When no <code>id-ref</code> is given, the addition is inserted into the control targeted by the alteration at
            the start or end as indicated by <code>position</code>. Only <code>position</code> values of "starting" or "ending" are permitted when there is no <code>id-ref</code>.</p>
         <p class="p"><code>id-ref</code>, when given, should indicate, by its ID, an element inside the control to serve as
            the anchor point for the addition. In this case, <code>position</code> value may be any of the permitted values.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-profile/add/position">Flag (defined inline) <code>position</code></li>
         <li id="/assembly/oscal-profile/add/by-id">Flag (defined inline) <code>by-id</code></li>
         <li id="/assembly/oscal-profile/add/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-profile/add/param">Assembly (reference) <code>parameter</code> - grouped as <code>params</code></li>
         <li id="/assembly/oscal-profile/add/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-profile/add/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-profile/add/part">Assembly (reference) <code>part</code> - grouped as <code>parts</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-profile/add"
                 _metaschema-json-id="/assembly/oscal-profile/add"
                 scope="global"
                 name="add"
                 module="oscal-profile"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
                 _key-name="oscal-profile:add"&gt;
   &lt;formal-name&gt;Addition&lt;/formal-name&gt;
   &lt;description&gt;Specifies contents to be added into controls, in resolution&lt;/description&gt;
   &lt;define-flag _step="position"
                _key="position"
                _metaschema-xml-id="/assembly/oscal-profile/add/position"
                _metaschema-json-id="/assembly/oscal-profile/add/position"
                required="no"
                as-type="NCName"
                name="position"
                _using-name="position"
                _in-xml-name="position"
                _in-json-name="position"&gt;
      &lt;formal-name&gt;Position&lt;/formal-name&gt;
      &lt;description&gt;Where to add the new content with respect to the targeted element (beside it or inside it)&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values&gt;
            &lt;enum value="before"&gt;Preceding the id-ref target&lt;/enum&gt;
            &lt;enum value="after"&gt;Following the id-ref target&lt;/enum&gt;
            &lt;enum value="starting"&gt;Inside the control or id-ref target, at the start&lt;/enum&gt;
            &lt;enum value="ending"&gt;Inside the control or id-ref target, at the end&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="by-id"
                _key="by-id"
                _metaschema-xml-id="/assembly/oscal-profile/add/by-id"
                _metaschema-json-id="/assembly/oscal-profile/add/by-id"
                required="no"
                as-type="NCName"
                name="by-id"
                _using-name="by-id"
                _in-xml-name="by-id"
                _in-json-name="by-id"&gt;
      &lt;formal-name&gt;Reference by ID&lt;/formal-name&gt;
      &lt;description&gt;Target location of the addition.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-profile/add/title"
                    _metaschema-json-id="/assembly/oscal-profile/add/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Title Change&lt;/formal-name&gt;
         &lt;description&gt;A name given to the control, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="param"
                _key="params"
                _group-name="params"
                _metaschema-xml-id="/assembly/oscal-profile/add/param"
                _metaschema-json-id="/assembly/oscal-profile/add/params"
                max-occurs="unbounded"
                min-occurs="0"
                ref="parameter"
                _key-ref="oscal-catalog-common:parameter"
                _using-name="param"
                _in-xml-name="param"
                _in-json-name="params"&gt;
         &lt;group-as name="params" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-profile/add/prop"
                _metaschema-json-id="/assembly/oscal-profile/add/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-profile/add/link"
                _metaschema-json-id="/assembly/oscal-profile/add/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="part"
                _key="parts"
                _group-name="parts"
                _metaschema-xml-id="/assembly/oscal-profile/add/part"
                _metaschema-json-id="/assembly/oscal-profile/add/parts"
                max-occurs="unbounded"
                min-occurs="0"
                ref="part"
                _key-ref="oscal-catalog-common:part"
                _using-name="part"
                _in-xml-name="part"
                _in-json-name="parts"&gt;
         &lt;group-as name="parts" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="label"&gt;A human-readable label for the parent context.&lt;/enum&gt;
         &lt;enum value="sort-id"&gt;An alternative identifier, whose value is easily sortable among other such values in the document.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;When no &lt;code&gt;id-ref&lt;/code&gt; is given, the addition is inserted into the control targeted by the alteration at the start or end as indicated by &lt;code&gt;position&lt;/code&gt;. Only &lt;code&gt;position&lt;/code&gt; values of "starting" or "ending" are permitted when there is no &lt;code&gt;id-ref&lt;/code&gt;.&lt;/p&gt;
      &lt;p&gt;
         &lt;code&gt;id-ref&lt;/code&gt;, when given, should indicate, by its ID, an element inside the control to serve as the anchor point for the addition. In this case, &lt;code&gt;position&lt;/code&gt; value may be any of the permitted values.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-profile/with-child-controls" class="toc1 head">Flag <code>with-child-controls</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Include contained controls with control</p>
      <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Include child controls with an included control.</p>
            
            <p class="enum"><span class="lbl">enum</span>When importing a control, only include child controls that are also explicitly called.</p>
            </div>
         </div>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-profile/with-child-controls"
             _metaschema-json-id="/flag/oscal-profile/with-child-controls"
             as-type="NCName"
             scope="global"
             name="with-child-controls"
             module="oscal-profile"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
             _key-name="oscal-profile:with-child-controls"&gt;
   &lt;formal-name&gt;Include contained controls with control&lt;/formal-name&gt;
   &lt;description&gt;When a control is included, whether its child (dependent) controls are also included.&lt;/description&gt;
   &lt;constraint&gt;
      &lt;allowed-values&gt;
         &lt;enum value="yes"&gt;Include child controls with an included control.&lt;/enum&gt;
         &lt;enum value="no"&gt;When importing a control, only include child controls that are also explicitly called.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-profile/pattern" class="toc1 head">Flag <code>pattern</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Pattern</p>
      <p class="description">A <a href="https://en.wikipedia.org/wiki/Glob_(programming)">glob expression</a> matching the IDs of one or more controls to be selected.</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-profile/pattern"
             _metaschema-json-id="/flag/oscal-profile/pattern"
             as-type="string"
             scope="global"
             name="pattern"
             module="oscal-profile"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_profile_metaschema.xml"
             _key-name="oscal-profile:pattern"&gt;
   &lt;formal-name&gt;Pattern&lt;/formal-name&gt;
   &lt;description&gt;A &lt;a href="https://en.wikipedia.org/wiki/Glob_(programming)"&gt;glob expression&lt;/a&gt; matching the IDs of one or more controls to be selected.&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/metadata" class="toc1 head">Assembly
         <code>metadata</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Publication metadata</p>
      <p class="description">Provides information about the publication and availability of the containing document.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>responsible-party</code> associates multiple <code>party-uuid</code> entries with a single <code>role-id</code>, each role-id must be referenced only once.</p>
            </div>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Indicates the organization that created this content.</p>
            
            <p class="enum"><span class="lbl">enum</span>Indicates the organization for which this content was created.</p>
            
            <p class="enum"><span class="lbl">enum</span>Indicates the organization responsible for all content represented in the "document".</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The link identifies the authoritative location for this file. Defined by <a href="https://tools.ietf.org/html/rfc6596">RFC 6596</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>The link identifies an alternative location or format for this file. Defined by <a href="https://html.spec.whatwg.org/multipage/links.html#linkTypes">the HTML Living Standard</a></p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the latest version in the version history.
               Defined by <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the predecessor version in the version
               history. Defined by  <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the predecessor version in the version
               history. Defined by <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/metadata/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-metadata/metadata/published">Field (reference) <code>published</code></li>
         <li id="/assembly/oscal-metadata/metadata/last-modified">Field (reference) <code>last-modified</code></li>
         <li id="/assembly/oscal-metadata/metadata/version">Field (reference) <code>version</code></li>
         <li id="/assembly/oscal-metadata/metadata/oscal-version">Field (reference) <code>oscal-version</code></li>
         <li id="/assembly/oscal-metadata/metadata/revisions/revision">Assembly (reference) <code>revision</code> - grouped as <code>revisions</code></li>
         <li id="/assembly/oscal-metadata/metadata/document-id">Field (reference) <code>document-id</code> - grouped as <code>document-ids</code></li>
         <li id="/assembly/oscal-metadata/metadata/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/metadata/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/metadata/role">Assembly (reference) <code>role</code> - grouped as <code>roles</code></li>
         <li id="/assembly/oscal-metadata/metadata/location">Assembly (reference) <code>location</code> - grouped as <code>locations</code></li>
         <li id="/assembly/oscal-metadata/metadata/party">Assembly (reference) <code>party</code> - grouped as <code>parties</code></li>
         <li id="/assembly/oscal-metadata/metadata/responsible-party">Assembly (reference) <code>responsible-party</code> - grouped as <code>responsible-parties</code></li>
         <li id="/assembly/oscal-metadata/metadata/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/metadata"
                 _metaschema-json-id="/assembly/oscal-metadata/metadata"
                 scope="global"
                 name="metadata"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:metadata"&gt;
   &lt;formal-name&gt;Publication metadata&lt;/formal-name&gt;
   &lt;description&gt;Provides information about the publication and availability of the containing document.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-metadata/metadata/title"
                    _metaschema-json-id="/assembly/oscal-metadata/metadata/title"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Document Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the document, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;field _step="published"
             _key="published"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/published"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/published"
             max-occurs="1"
             min-occurs="0"
             ref="published"
             _key-ref="oscal-metadata:published"
             _using-name="published"
             _in-xml-name="published"
             _in-json-name="published"/&gt;
      &lt;field _step="last-modified"
             _key="last-modified"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/last-modified"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/last-modified"
             max-occurs="1"
             min-occurs="1"
             ref="last-modified"
             _key-ref="oscal-metadata:last-modified"
             _using-name="last-modified"
             _in-xml-name="last-modified"
             _in-json-name="last-modified"/&gt;
      &lt;field _step="version"
             _key="version"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/version"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/version"
             max-occurs="1"
             min-occurs="1"
             ref="version"
             _key-ref="oscal-metadata:version"
             _using-name="version"
             _in-xml-name="version"
             _in-json-name="version"/&gt;
      &lt;field _step="oscal-version"
             _key="oscal-version"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/oscal-version"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/oscal-version"
             max-occurs="1"
             min-occurs="1"
             ref="oscal-version"
             _key-ref="oscal-metadata:oscal-version"
             _using-name="oscal-version"
             _in-xml-name="oscal-version"
             _in-json-name="oscal-version"/&gt;
      &lt;assembly _step="revisions/revision"
                _key="revisions"
                _group-name="revisions"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/revisions/revision"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/revisions"
                max-occurs="unbounded"
                min-occurs="0"
                ref="revision"
                _key-ref="oscal-metadata:revision"
                _using-name="revision"
                _in-xml-name="revision"
                _in-json-name="revisions"&gt;
         &lt;group-as name="revisions" in-xml="GROUPED" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="document-id"
             _key="document-ids"
             _group-name="document-ids"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/document-id"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/document-ids"
             max-occurs="unbounded"
             min-occurs="0"
             ref="document-id"
             _key-ref="oscal-metadata:document-id"
             _using-name="document-id"
             _in-xml-name="document-id"
             _in-json-name="document-ids"&gt;
         &lt;group-as name="document-ids" in-json="ARRAY"/&gt;
      &lt;/field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/prop"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/link"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="role"
                _key="roles"
                _group-name="roles"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/role"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/roles"
                max-occurs="unbounded"
                min-occurs="0"
                ref="role"
                _key-ref="oscal-metadata:role"
                _using-name="role"
                _in-xml-name="role"
                _in-json-name="roles"&gt;
         &lt;group-as name="roles" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="location"
                _key="locations"
                _group-name="locations"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/location"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/locations"
                max-occurs="unbounded"
                min-occurs="0"
                ref="location"
                _key-ref="oscal-metadata:location"
                _using-name="location"
                _in-xml-name="location"
                _in-json-name="locations"&gt;
         &lt;group-as name="locations" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="party"
                _key="parties"
                _group-name="parties"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/party"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/parties"
                max-occurs="unbounded"
                min-occurs="0"
                ref="party"
                _key-ref="oscal-metadata:party"
                _using-name="party"
                _in-xml-name="party"
                _in-json-name="parties"&gt;
         &lt;group-as name="parties" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="responsible-party"
                _key="responsible-parties"
                _group-name="responsible-parties"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/responsible-party"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/responsible-parties"
                max-occurs="unbounded"
                min-occurs="0"
                ref="responsible-party"
                _key-ref="oscal-metadata:responsible-party"
                _using-name="responsible-party"
                _in-xml-name="responsible-party"
                _in-json-name="responsible-parties"&gt;
         &lt;group-as name="responsible-parties" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;index id="index-metadata-roles"
             name="index-metadata-role-ids"
             target="role"&gt;
         &lt;key-field target="@id"/&gt;
      &lt;/index&gt;
      &lt;is-unique id="unique-metadata-doc-id"
                 name="unique-metadata-doc-id"
                 target="document-id"&gt;
         &lt;key-field target="@scheme"/&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/is-unique&gt;
      &lt;is-unique id="unique-metadata-property"
                 name="unique-metadata-property"
                 target="prop"&gt;
         &lt;key-field target="@name"/&gt;
         &lt;key-field target="@ns"/&gt;
         &lt;key-field target="@class"/&gt;
         &lt;key-field target="@value"/&gt;
      &lt;/is-unique&gt;
      &lt;index id="index-metadata-property-id"
             name="index-metadata-property-id"
             target=".//prop"&gt;
         &lt;key-field target="@id"/&gt;
      &lt;/index&gt;
      &lt;is-unique id="unique-metadata-link" name="unique-metadata-link" target="link"&gt;
         &lt;key-field target="@href"/&gt;
         &lt;key-field target="@rel"/&gt;
         &lt;key-field target="@media-type"/&gt;
      &lt;/is-unique&gt;
      &lt;index id="index-metadata-role-id"
             name="index-metadata-role-id"
             target="role"&gt;
         &lt;key-field target="@id"/&gt;
      &lt;/index&gt;
      &lt;index id="index-metadata-location-uuid"
             name="index-metadata-location-uuid"
             target="location"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index id="index-metadata-party-uuid"
             name="index-metadata-party-uuid"
             target="party"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index id="index-metadata-party-organizations-uuid"
             name="index-metadata-party-organizations-uuid"
             target="party[@type='organization']"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;is-unique name="unique-metadata-responsible-party" target="responsible-party"&gt;
         &lt;key-field target="@role-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;responsible-party&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
      &lt;allowed-values id="allowed-metadata-responsibe-party-role-ids"
                      target="responsible-party/@role-id"
                      allow-other="yes"&gt;
         &lt;enum value="prepared-by"&gt;Indicates the organization that created this content.&lt;/enum&gt;
         &lt;enum value="prepared-for"&gt;Indicates the organization for which this content was created.&lt;/enum&gt;
         &lt;enum value="content-approver"&gt;Indicates the organization responsible for all content represented in the "document".&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="link/@rel" allow-other="yes"&gt;
         &lt;enum value="canonical"&gt;The link identifies the authoritative location for this file. Defined by &lt;a href="https://tools.ietf.org/html/rfc6596"&gt;RFC 6596&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="alternate"&gt;The link identifies an alternative location or format for this file. Defined by &lt;a href="https://html.spec.whatwg.org/multipage/links.html#linkTypes"&gt;the HTML Living Standard&lt;/a&gt;
         &lt;/enum&gt;
         &lt;enum value="latest-version"&gt;This link identifies a resource containing the latest version in the version history. Defined by &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="predecessor-version"&gt;This link identifies a resource containing the predecessor version in the version history. Defined by  &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="successor-version"&gt;This link identifies a resource containing the predecessor version in the version history. Defined by &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/revision" class="toc1 head">Assembly
         <code>revision</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Revision History Entry</p>
      <p class="description">An entry in a sequential list of revisions to the containing document in reverse chronological
         order (i.e., most recent previous revision first).</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="has-cardinality">
            <p class="element-label"><span class="lbl">has-cardinality</span></p>
         </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The link identifies the authoritative location for this file. Defined by <a href="https://tools.ietf.org/html/rfc6596">RFC 6596</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>The link identifies an alternative location or format for this file. Defined by <a href="https://html.spec.whatwg.org/multipage/links.html#linkTypes">the HTML Living Standard</a></p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the predecessor version in the version
               history. Defined by  <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the predecessor version in the version
               history. Defined by <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            </div>
         </div>
      <div class="remarks">
         <p class="p">While <code>published</code>, <code>last-modified</code>, <code>oscal-version</code>, and <code>version</code> are not required, values for these entries should be provided if the information
            is known. For a revision entry to be considered valid, at least one of the following
            items must be provided: <code>published</code>, <code>last-modified</code>, <code>version</code>, or a <code>link</code> with a <code>rel</code> of <q>source</q>.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/revision/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-metadata/revision/published">Field (reference) <code>published</code></li>
         <li id="/assembly/oscal-metadata/revision/last-modified">Field (reference) <code>last-modified</code></li>
         <li id="/assembly/oscal-metadata/revision/version">Field (reference) <code>version</code></li>
         <li id="/assembly/oscal-metadata/revision/oscal-version">Field (reference) <code>oscal-version</code></li>
         <li id="/assembly/oscal-metadata/revision/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/revision/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/revision/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/revision"
                 _metaschema-json-id="/assembly/oscal-metadata/revision"
                 scope="local"
                 name="revision"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:revision"&gt;
   &lt;formal-name&gt;Revision History Entry&lt;/formal-name&gt;
   &lt;description&gt;An entry in a sequential list of revisions to the containing document in reverse chronological order (i.e., most recent previous revision first).&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-metadata/revision/title"
                    _metaschema-json-id="/assembly/oscal-metadata/revision/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Document Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the document revision, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;field _step="published"
             _key="published"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/published"
             _metaschema-json-id="/assembly/oscal-metadata/revision/published"
             max-occurs="1"
             min-occurs="0"
             ref="published"
             _key-ref="oscal-metadata:published"
             _using-name="published"
             _in-xml-name="published"
             _in-json-name="published"/&gt;
      &lt;field _step="last-modified"
             _key="last-modified"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/last-modified"
             _metaschema-json-id="/assembly/oscal-metadata/revision/last-modified"
             max-occurs="1"
             min-occurs="0"
             ref="last-modified"
             _key-ref="oscal-metadata:last-modified"
             _using-name="last-modified"
             _in-xml-name="last-modified"
             _in-json-name="last-modified"/&gt;
      &lt;field _step="version"
             _key="version"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/version"
             _metaschema-json-id="/assembly/oscal-metadata/revision/version"
             max-occurs="1"
             min-occurs="0"
             ref="version"
             _key-ref="oscal-metadata:version"
             _using-name="version"
             _in-xml-name="version"
             _in-json-name="version"/&gt;
      &lt;field _step="oscal-version"
             _key="oscal-version"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/oscal-version"
             _metaschema-json-id="/assembly/oscal-metadata/revision/oscal-version"
             max-occurs="1"
             min-occurs="0"
             ref="oscal-version"
             _key-ref="oscal-metadata:oscal-version"
             _using-name="oscal-version"
             _in-xml-name="oscal-version"
             _in-json-name="oscal-version"/&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/revision/prop"
                _metaschema-json-id="/assembly/oscal-metadata/revision/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/revision/link"
                _metaschema-json-id="/assembly/oscal-metadata/revision/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/revision/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;has-cardinality target="published|last-modified|version|link[@rel='canonical']"
                       min-occurs="1"/&gt;
      &lt;allowed-values target="link/@rel" allow-other="yes"&gt;
         &lt;enum value="canonical"&gt;The link identifies the authoritative location for this file. Defined by &lt;a href="https://tools.ietf.org/html/rfc6596"&gt;RFC 6596&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="alternate"&gt;The link identifies an alternative location or format for this file. Defined by &lt;a href="https://html.spec.whatwg.org/multipage/links.html#linkTypes"&gt;the HTML Living Standard&lt;/a&gt;
         &lt;/enum&gt;
         &lt;enum value="predecessor-version"&gt;This link identifies a resource containing the predecessor version in the version history. Defined by  &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="successor-version"&gt;This link identifies a resource containing the predecessor version in the version history. Defined by &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;While &lt;code&gt;published&lt;/code&gt;, &lt;code&gt;last-modified&lt;/code&gt;, &lt;code&gt;oscal-version&lt;/code&gt;, and &lt;code&gt;version&lt;/code&gt; are not required, values for these entries should be provided if the information is known. For a revision entry to be considered valid, at least one of the following items must be provided: &lt;code&gt;published&lt;/code&gt;, &lt;code&gt;last-modified&lt;/code&gt;, &lt;code&gt;version&lt;/code&gt;, or a &lt;code&gt;link&lt;/code&gt; with a &lt;code&gt;rel&lt;/code&gt; of &lt;q&gt;source&lt;/q&gt;.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/location" class="toc1 head">Assembly
         <code>location</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Location</p>
      <p class="description">A location, with associated metadata that can be referenced.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Characterizes the kind of location.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A location that contains computing assets. A <code>class</code> can be used to indicate a subclass of data-center.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The location is a data-center used for normal operations.</p>
            
            <p class="enum"><span class="lbl">enum</span>The location is a data-center used for fail-over or backup operations.</p>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/location/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-metadata/location/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-metadata/location/address">Assembly (reference) <code>address</code></li>
         <li id="/assembly/oscal-metadata/location/email-address">Field (reference) <code>email-address</code> - grouped as <code>email-addresses</code></li>
         <li id="/assembly/oscal-metadata/location/telephone-number">Field (reference) <code>telephone-number</code> - grouped as <code>telephone-numbers</code></li>
         <li id="/assembly/oscal-metadata/location/url">Field (defined inline) <code>url</code> - grouped as <code>urls</code></li>
         <li id="/assembly/oscal-metadata/location/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/location/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/location/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/location"
                 _metaschema-json-id="/assembly/oscal-metadata/location"
                 scope="global"
                 name="location"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:location"&gt;
   &lt;formal-name&gt;Location&lt;/formal-name&gt;
   &lt;description&gt;A location, with associated metadata that can be referenced.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-metadata/location/uuid"
                _metaschema-json-id="/assembly/oscal-metadata/location/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Location Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier that can be used to reference this defined location elsewhere in an OSCAL document. A UUID should be consistently used for a given location across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-metadata/location/title"
                    _metaschema-json-id="/assembly/oscal-metadata/location/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Location Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the location, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="address"
                _key="address"
                _metaschema-xml-id="/assembly/oscal-metadata/location/address"
                _metaschema-json-id="/assembly/oscal-metadata/location/address"
                max-occurs="1"
                min-occurs="1"
                ref="address"
                _key-ref="oscal-metadata:address"
                _using-name="address"
                _in-xml-name="address"
                _in-json-name="address"&gt;
         &lt;remarks&gt;
            &lt;p&gt;Typically, the physical address of the location will be used here. If this information is sensitive, then a mailing address can be used instead.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/assembly&gt;
      &lt;field _step="email-address"
             _key="email-addresses"
             _group-name="email-addresses"
             _metaschema-xml-id="/assembly/oscal-metadata/location/email-address"
             _metaschema-json-id="/assembly/oscal-metadata/location/email-addresses"
             max-occurs="unbounded"
             min-occurs="0"
             ref="email-address"
             _key-ref="oscal-metadata:email-address"
             _using-name="email-address"
             _in-xml-name="email-address"
             _in-json-name="email-addresses"&gt;
         &lt;group-as name="email-addresses" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;This is a contact email associated with the location.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;field _step="telephone-number"
             _key="telephone-numbers"
             _group-name="telephone-numbers"
             _metaschema-xml-id="/assembly/oscal-metadata/location/telephone-number"
             _metaschema-json-id="/assembly/oscal-metadata/location/telephone-numbers"
             max-occurs="unbounded"
             min-occurs="0"
             ref="telephone-number"
             _key-ref="oscal-metadata:telephone-number"
             _using-name="telephone-number"
             _in-xml-name="telephone-number"
             _in-json-name="telephone-numbers"&gt;
         &lt;group-as name="telephone-numbers" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A phone number used to contact the location.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;define-field _step="url"
                    _key="urls"
                    _group-name="urls"
                    _metaschema-xml-id="/assembly/oscal-metadata/location/url"
                    _metaschema-json-id="/assembly/oscal-metadata/location/urls"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="uri"
                    name="url"
                    _using-name="url"
                    _in-xml-name="url"
                    _in-json-name="urls"&gt;
         &lt;formal-name&gt;Location URL&lt;/formal-name&gt;
         &lt;description&gt;The uniform resource locator (URL) for a web site or Internet presence associated with the location.&lt;/description&gt;
         &lt;group-as name="urls" in-json="ARRAY"/&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/location/prop"
                _metaschema-json-id="/assembly/oscal-metadata/location/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/location/link"
                _metaschema-json-id="/assembly/oscal-metadata/location/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/location/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/location/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="type"&gt;Characterizes the kind of location.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='type']/@value" allow-other="yes"&gt;
         &lt;enum value="data-center"&gt;A location that contains computing assets. A &lt;code&gt;class&lt;/code&gt; can be used to indicate a subclass of data-center.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='type' and @value='data-center']/@class"
                      allow-other="yes"&gt;
         &lt;enum value="primary"&gt;The location is a data-center used for normal operations.&lt;/enum&gt;
         &lt;enum value="alternate"&gt;The location is a data-center used for fail-over or backup operations.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-metadata/location-uuid" class="toc1 head">Flag <code>location-uuid</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Location Reference</p>
      <p class="description">References a <code>location</code> defined in <code>metadata</code>. </p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-metadata/location-uuid"
             _metaschema-json-id="/flag/oscal-metadata/location-uuid"
             as-type="uuid"
             scope="global"
             name="location-uuid"
             module="oscal-metadata"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:location-uuid"&gt;
   &lt;formal-name&gt;Location Reference&lt;/formal-name&gt;
   &lt;description&gt;References a &lt;code&gt;location&lt;/code&gt; defined in &lt;code&gt;metadata&lt;/code&gt;. &lt;/description&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-location-uuid" target="."&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/location-uuid" class="toc1 head">Field <code>location-uuid</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Location Reference</p>
      <p class="description">References a <code>location</code> defined in <code>metadata</code>. </p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/location-uuid"
              _metaschema-json-id="/field/oscal-metadata/location-uuid"
              collapsible="no"
              as-type="uuid"
              scope="global"
              name="location-uuid"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:location-uuid"&gt;
   &lt;formal-name&gt;Location Reference&lt;/formal-name&gt;
   &lt;description&gt;References a &lt;code&gt;location&lt;/code&gt; defined in &lt;code&gt;metadata&lt;/code&gt;. &lt;/description&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-location-uuid" target="."&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/party" class="toc1 head">Assembly
         <code>party</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Party (organization or person)</p>
      <p class="description">A responsible entity which is either a person or an organization.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A mail stop associated with the party.</p>
            
            <p class="enum"><span class="lbl">enum</span>The name or number of the party's office.</p>
            
            <p class="enum"><span class="lbl">enum</span>The formal job title of a person.</p>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/party/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-metadata/party/type">Flag (defined inline) <code>type</code></li>
         <li id="/assembly/oscal-metadata/party/name">Field (defined inline) <code>name</code></li>
         <li id="/assembly/oscal-metadata/party/short-name">Field (defined inline) <code>short-name</code></li>
         <li id="/assembly/oscal-metadata/party/external-id">Field (defined inline) <code>external-id</code> - grouped as <code>external-ids</code></li>
         <li id="/assembly/oscal-metadata/party/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/party/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/party/email-address">Field (reference) <code>email-address</code> - grouped as <code>email-addresses</code></li>
         <li id="/assembly/oscal-metadata/party/telephone-number">Field (reference) <code>telephone-number</code> - grouped as <code>telephone-numbers</code></li>
         <li id="/assembly/oscal-metadata/party/address">Assembly (reference) <code>address</code> - grouped as <code>addresses</code></li>
         <li id="/assembly/oscal-metadata/party/location-uuid">Field (reference) <code>location-uuid</code> - grouped as <code>location-uuids</code></li>
         <li id="/assembly/oscal-metadata/party/member-of-organization">Field (defined inline) <code>member-of-organization</code> - grouped as <code>member-of-organizations</code></li>
         <li id="/assembly/oscal-metadata/party/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/party"
                 _metaschema-json-id="/assembly/oscal-metadata/party"
                 scope="global"
                 name="party"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:party"&gt;
   &lt;formal-name&gt;Party (organization or person)&lt;/formal-name&gt;
   &lt;description&gt;A responsible entity which is either a person or an organization.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-metadata/party/uuid"
                _metaschema-json-id="/assembly/oscal-metadata/party/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Party Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier that can be used to reference this defined location elsewhere in an OSCAL document. A UUID should be consistently used for a given party across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="type"
                _key="type"
                _metaschema-xml-id="/assembly/oscal-metadata/party/type"
                _metaschema-json-id="/assembly/oscal-metadata/party/type"
                required="yes"
                as-type="string"
                name="type"
                _using-name="type"
                _in-xml-name="type"
                _in-json-name="type"&gt;
      &lt;formal-name&gt;Party Type&lt;/formal-name&gt;
      &lt;description&gt;A category describing the kind of party the object describes.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="no"&gt;
            &lt;enum value="person"&gt;An individual.&lt;/enum&gt;
            &lt;enum value="organization"&gt;A group of individuals formed for a specific purpose.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="name"
                    _key="name"
                    _metaschema-xml-id="/assembly/oscal-metadata/party/name"
                    _metaschema-json-id="/assembly/oscal-metadata/party/name"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="name"
                    _using-name="name"
                    _in-xml-name="name"
                    _in-json-name="name"&gt;
         &lt;formal-name&gt;Party Name&lt;/formal-name&gt;
         &lt;description&gt;The full name of the party. This is typically the legal name associated with the party.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="short-name"
                    _key="short-name"
                    _metaschema-xml-id="/assembly/oscal-metadata/party/short-name"
                    _metaschema-json-id="/assembly/oscal-metadata/party/short-name"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="short-name"
                    _using-name="short-name"
                    _in-xml-name="short-name"
                    _in-json-name="short-name"&gt;
         &lt;formal-name&gt;Party Short Name&lt;/formal-name&gt;
         &lt;description&gt;A short common name, abbreviation, or acronym for the party.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="external-id"
                    _key="external-ids"
                    _group-name="external-ids"
                    _metaschema-xml-id="/assembly/oscal-metadata/party/external-id"
                    _metaschema-json-id="/assembly/oscal-metadata/party/external-ids"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="external-id"
                    _using-name="external-id"
                    _in-xml-name="external-id"
                    _in-json-name="external-ids"&gt;
         &lt;formal-name&gt;Party External Identifier&lt;/formal-name&gt;
         &lt;description&gt;An identifier for a person or organization using a designated scheme. e.g. an Open Researcher and Contributor ID (ORCID)&lt;/description&gt;
         &lt;json-value-key&gt;id&lt;/json-value-key&gt;
         &lt;group-as name="external-ids" in-json="ARRAY"/&gt;
         &lt;define-flag _step="scheme"
                      _key="scheme"
                      _metaschema-xml-id="/assembly/oscal-metadata/party/external-id/scheme"
                      _metaschema-json-id="/assembly/oscal-metadata/party/external-ids/scheme"
                      required="yes"
                      as-type="uri"
                      name="scheme"
                      _using-name="scheme"
                      _in-xml-name="scheme"
                      _in-json-name="scheme"&gt;
            &lt;formal-name&gt;External Identifier Schema&lt;/formal-name&gt;
            &lt;description&gt;Indicates the type of external identifier.&lt;/description&gt;
            &lt;constraint&gt;
               &lt;allowed-values allow-other="yes"&gt;
                  &lt;enum value="https://orcid.org/"&gt;The identifier is Open Researcher and Contributor ID (ORCID).&lt;/enum&gt;
               &lt;/allowed-values&gt;
            &lt;/constraint&gt;
         &lt;/define-flag&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/party/prop"
                _metaschema-json-id="/assembly/oscal-metadata/party/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/party/link"
                _metaschema-json-id="/assembly/oscal-metadata/party/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="email-address"
             _key="email-addresses"
             _group-name="email-addresses"
             _metaschema-xml-id="/assembly/oscal-metadata/party/email-address"
             _metaschema-json-id="/assembly/oscal-metadata/party/email-addresses"
             max-occurs="unbounded"
             min-occurs="0"
             ref="email-address"
             _key-ref="oscal-metadata:email-address"
             _using-name="email-address"
             _in-xml-name="email-address"
             _in-json-name="email-addresses"&gt;
         &lt;group-as name="email-addresses" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;This is a contact email associated with the party.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;field _step="telephone-number"
             _key="telephone-numbers"
             _group-name="telephone-numbers"
             _metaschema-xml-id="/assembly/oscal-metadata/party/telephone-number"
             _metaschema-json-id="/assembly/oscal-metadata/party/telephone-numbers"
             max-occurs="unbounded"
             min-occurs="0"
             ref="telephone-number"
             _key-ref="oscal-metadata:telephone-number"
             _using-name="telephone-number"
             _in-xml-name="telephone-number"
             _in-json-name="telephone-numbers"&gt;
         &lt;group-as name="telephone-numbers" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A phone number used to contact the party.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;choice&gt;
         &lt;assembly _step="address"
                   _key="addresses"
                   _group-name="addresses"
                   _metaschema-xml-id="/assembly/oscal-metadata/party/address"
                   _metaschema-json-id="/assembly/oscal-metadata/party/addresses"
                   max-occurs="unbounded"
                   min-occurs="0"
                   ref="address"
                   _key-ref="oscal-metadata:address"
                   _using-name="address"
                   _in-xml-name="address"
                   _in-json-name="addresses"&gt;
            &lt;group-as name="addresses" in-json="ARRAY"/&gt;
         &lt;/assembly&gt;
         &lt;field _step="location-uuid"
                _key="location-uuids"
                _group-name="location-uuids"
                _metaschema-xml-id="/assembly/oscal-metadata/party/location-uuid"
                _metaschema-json-id="/assembly/oscal-metadata/party/location-uuids"
                as-type="uuid"
                max-occurs="unbounded"
                min-occurs="0"
                ref="location-uuid"
                _key-ref="oscal-metadata:location-uuid"
                _using-name="location-uuid"
                _in-xml-name="location-uuid"
                _in-json-name="location-uuids"&gt;
            &lt;group-as name="location-uuids" in-json="ARRAY"/&gt;
         &lt;/field&gt;
      &lt;/choice&gt;
      &lt;define-field _step="member-of-organization"
                    _key="member-of-organizations"
                    _group-name="member-of-organizations"
                    _metaschema-xml-id="/assembly/oscal-metadata/party/member-of-organization"
                    _metaschema-json-id="/assembly/oscal-metadata/party/member-of-organizations"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="uuid"
                    name="member-of-organization"
                    _using-name="member-of-organization"
                    _in-xml-name="member-of-organization"
                    _in-json-name="member-of-organizations"&gt;
         &lt;formal-name&gt;Organizational Affiliation&lt;/formal-name&gt;
         &lt;description&gt;Identifies that the party object is a member of the organization associated with the provided UUID.&lt;/description&gt;
         &lt;group-as name="member-of-organizations" in-json="ARRAY"/&gt;
         &lt;constraint&gt;
            &lt;index-has-key name="index-metadata-party-organizations-uuid" target="."&gt;
               &lt;key-field target="value()"/&gt;
            &lt;/index-has-key&gt;
         &lt;/constraint&gt;
         &lt;remarks&gt;
            &lt;p&gt;Parties of both the &lt;code&gt;person&lt;/code&gt; or &lt;code&gt;organization&lt;/code&gt; type can be associated with an organization using the &lt;code&gt;member-of-organization&lt;/code&gt;. &lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/define-field&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/party/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/party/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name"&gt;
         &lt;enum value="mail-stop"&gt;A mail stop associated with the party.&lt;/enum&gt;
         &lt;enum value="office"&gt;The name or number of the party's office.&lt;/enum&gt;
         &lt;enum value="job-title"&gt;The formal job title of a person.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/party-uuid" class="toc1 head">Field <code>party-uuid</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Party Reference</p>
      <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/party-uuid"
              _metaschema-json-id="/field/oscal-metadata/party-uuid"
              collapsible="no"
              as-type="uuid"
              scope="global"
              name="party-uuid"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:party-uuid"&gt;
   &lt;formal-name&gt;Party Reference&lt;/formal-name&gt;
   &lt;description&gt;References a &lt;code&gt;party&lt;/code&gt; defined in &lt;code&gt;metadata&lt;/code&gt;. &lt;/description&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-party-uuid" target="."&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/role" class="toc1 head">Assembly
         <code>role</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Role</p>
      <p class="description">Defines a function assumed or expected to be assumed by a party in a specific situation.</p>
      <div class="remarks">
         <p class="p">Permissible values to be determined closer to the application (e.g. by a receiving
            authority).</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/role/id">Flag (defined inline) <code>id</code></li>
         <li id="/assembly/oscal-metadata/role/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-metadata/role/short-name">Field (defined inline) <code>short-name</code></li>
         <li id="/assembly/oscal-metadata/role/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-metadata/role/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/role/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/role/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/role"
                 _metaschema-json-id="/assembly/oscal-metadata/role"
                 scope="global"
                 name="role"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:role"&gt;
   &lt;formal-name&gt;Role&lt;/formal-name&gt;
   &lt;description&gt;Defines a function assumed or expected to be assumed by a party in a specific situation.&lt;/description&gt;
   &lt;define-flag _step="id"
                _key="id"
                _metaschema-xml-id="/assembly/oscal-metadata/role/id"
                _metaschema-json-id="/assembly/oscal-metadata/role/id"
                required="yes"
                as-type="NCName"
                name="id"
                _using-name="id"
                _in-xml-name="id"
                _in-json-name="id"&gt;
      &lt;formal-name&gt;Role Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier for a specific role instance. This identifier's uniqueness is document scoped and is intended to be consistent for the same role across minor revisions of the document.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;OSCAL has defined a set of standardized roles for consistent use in OSCAL documents. This allows tools consuming OSCAL content to infer specific semantics when these roles are used. These roles are documented in the specific contexts of their use (e.g., responsible-party, responsible-role). When using such a role, it is necessary to define these roles in this list, which will then allow such a role to be referenced.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-metadata/role/title"
                    _metaschema-json-id="/assembly/oscal-metadata/role/title"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Role Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the role, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="short-name"
                    _key="short-name"
                    _metaschema-xml-id="/assembly/oscal-metadata/role/short-name"
                    _metaschema-json-id="/assembly/oscal-metadata/role/short-name"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="short-name"
                    _using-name="short-name"
                    _in-xml-name="short-name"
                    _in-json-name="short-name"&gt;
         &lt;formal-name&gt;Role Short Name&lt;/formal-name&gt;
         &lt;description&gt;A short common name, abbreviation, or acronym for the role.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-metadata/role/description"
                    _metaschema-json-id="/assembly/oscal-metadata/role/description"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Role Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the role's purpose and associated responsibilities.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/role/prop"
                _metaschema-json-id="/assembly/oscal-metadata/role/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/role/link"
                _metaschema-json-id="/assembly/oscal-metadata/role/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/role/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/role/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;Permissible values to be determined closer to the application (e.g. by a receiving authority).&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/role-id" class="toc1 head">Field <code>role-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Role Identifier Reference</p>
      <p class="description">A reference to the roles served by the user.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/role-id"
              _metaschema-json-id="/field/oscal-metadata/role-id"
              collapsible="no"
              as-type="NCName"
              scope="global"
              name="role-id"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:role-id"&gt;
   &lt;formal-name&gt;Role Identifier Reference&lt;/formal-name&gt;
   &lt;description&gt;A reference to the roles served by the user.&lt;/description&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-role-id" target="."&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/back-matter" class="toc1 head">Assembly
         <code>back-matter</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Back matter</p>
      <p class="description">A collection of resources, which may be included directly or by reference.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <div class="remarks">
         <p class="p">Provides a collection of identified <code>resource</code> objects that can be referenced by a <code>link</code> with a <code>rel</code> value of "reference" and an <code>href</code> value that is a fragment "#" followed by a reference to a reference identifier. Other
            specialized link "rel" values also use this pattern when indicated in that context
            of use.</p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         
         <p class="description">Use of link, citation, and resource</p>
         
         <div class="remarks">
            <p class="p">The following is a contrived example to show the use of link, citation, and resource.</p>
         </div>
         
         <div class="profile">
            <p class="element-label"><span class="lbl">profile</span></p>
            
            <div class="metadata">
               <p class="element-label"><span class="lbl">metadata</span></p>
               
               <p class="link"><span class="lbl">link</span>My citation</p>
               </div>
            
            <div class="back-matter">
               <p class="element-label"><span class="lbl">back-matter</span></p>
               
               <div class="resource">
                  <p class="element-label"><span class="lbl">resource</span></p>
                  
                  <div class="rlink">
                     <p class="element-label"><span class="lbl">rlink</span></p>
                  </div>
                  </div>
               </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/back-matter/resource">Assembly (defined inline) <code>resource</code> - grouped as <code>resources</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/back-matter"
                 _metaschema-json-id="/assembly/oscal-metadata/back-matter"
                 scope="global"
                 name="back-matter"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:back-matter"&gt;
   &lt;formal-name&gt;Back matter&lt;/formal-name&gt;
   &lt;description&gt;A collection of resources, which may be included directly or by reference.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-assembly _step="resource"
                       _key="resources"
                       _group-name="resources"
                       _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource"
                       _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="resource"
                       _using-name="resource"
                       _in-xml-name="resource"
                       _in-json-name="resources"&gt;
         &lt;formal-name&gt;Resource&lt;/formal-name&gt;
         &lt;description&gt;A resource associated with content in the containing document. A resource may be directly included in the document base64 encoded or may point to one or more equivalent internet resources.&lt;/description&gt;
         &lt;group-as name="resources" in-json="ARRAY"/&gt;
         &lt;define-flag _step="uuid"
                      _key="uuid"
                      _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/uuid"
                      _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/uuid"
                      required="yes"
                      as-type="uuid"
                      name="uuid"
                      _using-name="uuid"
                      _in-xml-name="uuid"
                      _in-json-name="uuid"&gt;
            &lt;formal-name&gt;Resource Universally Unique Identifier&lt;/formal-name&gt;
            &lt;description&gt;A globally unique identifier that can be used to reference this defined resource elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
         &lt;/define-flag&gt;
         &lt;model&gt;
            &lt;define-field _step="title"
                          _key="title"
                          _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/title"
                          _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/title"
                          max-occurs="1"
                          min-occurs="0"
                          collapsible="no"
                          as-type="markup-line"
                          name="title"
                          _using-name="title"
                          _in-xml-name="title"
                          _in-json-name="title"&gt;
               &lt;formal-name&gt;Resource Title&lt;/formal-name&gt;
               &lt;description&gt;A name given to the resource, which may be used by a tool for display and navigation.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;define-field _step="description"
                          _key="description"
                          _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/description"
                          _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/description"
                          max-occurs="1"
                          min-occurs="0"
                          in-xml="WITH_WRAPPER"
                          collapsible="no"
                          as-type="markup-multiline"
                          name="description"
                          _using-name="description"
                          _in-xml-name="description"
                          _in-json-name="description"&gt;
               &lt;formal-name&gt;Resource Description&lt;/formal-name&gt;
               &lt;description&gt;A short summary of the resource used to indicate the purpose of the resource.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/prop"
                      _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;field _step="document-id"
                   _key="document-ids"
                   _group-name="document-ids"
                   _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/document-id"
                   _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/document-ids"
                   max-occurs="unbounded"
                   min-occurs="0"
                   ref="document-id"
                   _key-ref="oscal-metadata:document-id"
                   _using-name="document-id"
                   _in-xml-name="document-id"
                   _in-json-name="document-ids"&gt;
               &lt;group-as name="document-ids" in-json="ARRAY"/&gt;
            &lt;/field&gt;
            &lt;define-assembly _step="citation"
                             _key="citation"
                             _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation"
                             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation"
                             max-occurs="1"
                             min-occurs="0"
                             name="citation"
                             _using-name="citation"
                             _in-xml-name="citation"
                             _in-json-name="citation"&gt;
               &lt;formal-name&gt;Citation&lt;/formal-name&gt;
               &lt;description&gt;A citation consisting of end note text and optional structured bibliographic data.&lt;/description&gt;
               &lt;model&gt;
                  &lt;define-field _step="text"
                                _key="text"
                                _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation/text"
                                _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation/text"
                                max-occurs="1"
                                min-occurs="1"
                                collapsible="no"
                                as-type="markup-line"
                                name="text"
                                _using-name="text"
                                _in-xml-name="text"
                                _in-json-name="text"&gt;
                     &lt;formal-name&gt;Citation Text&lt;/formal-name&gt;
                     &lt;description&gt;A line of citation text.&lt;/description&gt;
                  &lt;/define-field&gt;
                  &lt;assembly _step="prop"
                            _key="props"
                            _group-name="props"
                            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation/prop"
                            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation/props"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="property"
                            _key-ref="oscal-metadata:property"
                            _using-name="prop"
                            _in-xml-name="prop"
                            _in-json-name="props"&gt;
                     &lt;group-as name="props" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;define-assembly _step="biblio"
                                   _key="biblio"
                                   _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation/biblio"
                                   _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation/biblio"
                                   max-occurs="1"
                                   min-occurs="0"
                                   name="biblio"
                                   _using-name="biblio"
                                   _in-xml-name="biblio"
                                   _in-json-name="biblio"&gt;
                     &lt;formal-name&gt;Bibliographic Definition&lt;/formal-name&gt;
                     &lt;description&gt;A container for structured bibliographic information. The model of this information is undefined by OSCAL.&lt;/description&gt;
                     &lt;model&gt;
                        &lt;any/&gt;
                     &lt;/model&gt;
                  &lt;/define-assembly&gt;
               &lt;/model&gt;
               &lt;remarks&gt;
                  &lt;p&gt;The &lt;code&gt;text&lt;/code&gt; is used to define the endnote text, without any required bibliographic structure. If structured bibliographic data is needed, then the &lt;code&gt;biblio&lt;/code&gt; can be used for this purpose.&lt;/p&gt;
                  &lt;p&gt;A &lt;code&gt;biblio&lt;/code&gt; can be used to capture a structured bibliographical citation in an appropriate format.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/define-assembly&gt;
            &lt;define-assembly _step="rlink"
                             _key="rlinks"
                             _group-name="rlinks"
                             _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink"
                             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks"
                             max-occurs="unbounded"
                             min-occurs="0"
                             name="rlink"
                             _using-name="rlink"
                             _in-xml-name="rlink"
                             _in-json-name="rlinks"&gt;
               &lt;formal-name&gt;Resource link&lt;/formal-name&gt;
               &lt;description&gt;A pointer to an external resource with an optional hash for verification and change detection.&lt;/description&gt;
               &lt;group-as name="rlinks" in-json="ARRAY"/&gt;
               &lt;define-flag _step="href"
                            _key="href"
                            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/href"
                            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/href"
                            required="yes"
                            as-type="uri-reference"
                            name="href"
                            _using-name="href"
                            _in-xml-name="href"
                            _in-json-name="href"&gt;
                  &lt;formal-name&gt;Hypertext Reference&lt;/formal-name&gt;
                  &lt;description&gt;A resolvable URI reference to a resource.&lt;/description&gt;
               &lt;/define-flag&gt;
               &lt;flag _step="media-type"
                     _key="media-type"
                     _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/media-type"
                     _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/media-type"
                     as-type="string"
                     required="no"
                     ref="media-type"
                     _key-ref="oscal-metadata:media-type"
                     _using-name="media-type"
                     _in-xml-name="media-type"
                     _in-json-name="media-type"/&gt;
               &lt;model&gt;
                  &lt;field _step="hash"
                         _key="hashes"
                         _group-name="hashes"
                         _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/hash"
                         _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/hashes"
                         max-occurs="unbounded"
                         min-occurs="0"
                         ref="hash"
                         _key-ref="oscal-metadata:hash"
                         _using-name="hash"
                         _in-xml-name="hash"
                         _in-json-name="hashes"&gt;
                     &lt;group-as name="hashes" in-json="ARRAY"/&gt;
                     &lt;remarks&gt;
                        &lt;p&gt;When appearing as part of a &lt;code&gt;resource/rlink&lt;/code&gt;, the hash applies to the resource referenced by the &lt;code&gt;href&lt;/code&gt;. &lt;/p&gt;
                     &lt;/remarks&gt;
                  &lt;/field&gt;
               &lt;/model&gt;
               &lt;remarks&gt;
                  &lt;p&gt;This construct is different from &lt;code&gt;link&lt;/code&gt;, which makes no provision for a hash or formal title.&lt;/p&gt;
                  &lt;p&gt;Multiple &lt;code&gt;rlink&lt;/code&gt; can be included for a resource. In such a case, all provided &lt;code&gt;rlink&lt;/code&gt; items are intended to be equivalent in content, but may differ in structure. A &lt;code&gt;media-type&lt;/code&gt; is used to identify the format of a given rlink, and can be used to differentiate a items in a collection of rlinks. The &lt;code&gt;media-type&lt;/code&gt; also provides a hint to the OSCAL document consumer about the structure of the resource referenced by the &lt;code&gt;rlink&lt;/code&gt;. &lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/define-assembly&gt;
            &lt;define-field _step="base64"
                          _key="base64"
                          _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64"
                          _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64"
                          max-occurs="1"
                          min-occurs="0"
                          collapsible="no"
                          as-type="base64Binary"
                          name="base64"
                          _using-name="base64"
                          _in-xml-name="base64"
                          _in-json-name="base64"&gt;
               &lt;formal-name&gt;Base64&lt;/formal-name&gt;
               &lt;description&gt;The Base64 alphabet in RFC 2045 - aligned with XSD.&lt;/description&gt;
               &lt;json-value-key&gt;value&lt;/json-value-key&gt;
               &lt;define-flag _step="filename"
                            _key="filename"
                            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64/filename"
                            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64/filename"
                            required="no"
                            as-type="uri-reference"
                            name="filename"
                            _using-name="filename"
                            _in-xml-name="filename"
                            _in-json-name="filename"&gt;
                  &lt;formal-name&gt;File Name&lt;/formal-name&gt;
                  &lt;description&gt;Name of the file before it was encoded as Base64 to be embedded in a &lt;code&gt;resource&lt;/code&gt;. This is the name that will be assigned to the file when the file is decoded.&lt;/description&gt;
               &lt;/define-flag&gt;
               &lt;flag _step="media-type"
                     _key="media-type"
                     _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64/media-type"
                     _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64/media-type"
                     as-type="string"
                     required="no"
                     ref="media-type"
                     _key-ref="oscal-metadata:media-type"
                     _using-name="media-type"
                     _in-xml-name="media-type"
                     _in-json-name="media-type"/&gt;
            &lt;/define-field&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/remarks"
                   _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
         &lt;constraint&gt;
            &lt;allowed-values target="prop/@name"&gt;
               &lt;enum value="type"&gt;Identifies the type of resource represented.&lt;/enum&gt;
               &lt;enum value="version"&gt;For resources representing a published document, this represents the version number of that document.&lt;/enum&gt;
               &lt;enum value="published"&gt;For resources representing a published document, this represents the publication date of that document.&lt;/enum&gt;
            &lt;/allowed-values&gt;
            &lt;matches target="prop[(not(exists(@ns)) or @ns='http://csrc.nist.gov/ns/oscal') and @name='published']/@value"
                     datatype="dateTime"/&gt;
            &lt;allowed-values target="prop[@name='type']/@value" allow-other="yes"&gt;
               &lt;enum value="logo"&gt;Indicates the resource is an organization's logo.&lt;/enum&gt;
               &lt;enum value="image"&gt;Indicates the resource represents an image.&lt;/enum&gt;
               &lt;enum value="screen-shot"&gt;Indicates the resource represents an image of screen content. &lt;/enum&gt;
               &lt;enum value="law"&gt;Indicates the resource represents an applicable law.&lt;/enum&gt;
               &lt;enum value="regulation"&gt;Indicates the resource represents an applicable regulation.&lt;/enum&gt;
               &lt;enum value="standard"&gt;Indicates the resource represents an applicable standard.&lt;/enum&gt;
               &lt;enum value="external-guidance"&gt;Indicates the resource represents applicable guidance.&lt;/enum&gt;
               &lt;enum value="acronyms"&gt;Indicates the resource provides a list of relevant acronyms.&lt;/enum&gt;
               &lt;enum value="citation"&gt;Indicates the resource cites relevant information.&lt;/enum&gt;
               &lt;enum value="policy"&gt;Indicates the resource is a policy.&lt;/enum&gt;
               &lt;enum value="procedure"&gt;Indicates the resource is a procedure.&lt;/enum&gt;
               &lt;enum value="system-guide"&gt;Indicates the resource is guidance document related to the subject system of an SSP.&lt;/enum&gt;
               &lt;enum value="users-guide"&gt;Indicates the resource is guidance document a user's guide or administrator's guide.&lt;/enum&gt;
               &lt;enum value="administrators-guide"&gt;Indicates the resource is guidance document a administrator's guide.&lt;/enum&gt;
               &lt;enum value="rules-of-behavior"&gt;Indicates the resource represents rules of behavior content.&lt;/enum&gt;
               &lt;enum value="plan"&gt;Indicates the resource represents a plan.&lt;/enum&gt;
               &lt;enum value="artifact"&gt;Indicates the resource represents an artifact, such as may be reviewed by an assessor.&lt;/enum&gt;
               &lt;enum value="evidence"&gt;Indicates the resource represents evidence, such as to support an assessment findiing.&lt;/enum&gt;
               &lt;enum value="tool-output"&gt;Indicates the resource represents output from a tool.&lt;/enum&gt;
               &lt;enum value="raw-data"&gt;Indicates the resource represents machine data, which may require a tool or analysis for interpretation or presentation.&lt;/enum&gt;
               &lt;enum value="interview-notes"&gt;Indicates the resource represents notes from an interview, such as may be collected during an assessment.&lt;/enum&gt;
               &lt;enum value="questionnaire"&gt;Indicates the resource is a set of questions, possibly with responses.&lt;/enum&gt;
               &lt;enum value="report"&gt;Indicates the resource is a report.&lt;/enum&gt;
               &lt;enum value="agreement"&gt;Indicates the resource is a formal agreement between two or more parties.&lt;/enum&gt;
            &lt;/allowed-values&gt;
            &lt;has-cardinality target="rlink|base64" min-occurs="1"/&gt;
            &lt;is-unique name="unique-resource-rlink-href" target="rlink"&gt;
               &lt;key-field target="@href"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;Ensures that each rlink item references a unique resource.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/is-unique&gt;
            &lt;is-unique name="unique-resource-base64-filename" target="base64"&gt;
               &lt;key-field target="@filename"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;Ensures that all base64 resources have a unique &lt;code&gt;filename&lt;/code&gt;. &lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/is-unique&gt;
            &lt;require when="citation"&gt;
               &lt;has-cardinality target="title" min-occurs="1"&gt;
                  &lt;remarks&gt;
                     &lt;p&gt;A &lt;code&gt;title&lt;/code&gt; is required when a citation is provided.&lt;/p&gt;
                  &lt;/remarks&gt;
               &lt;/has-cardinality&gt;
            &lt;/require&gt;
         &lt;/constraint&gt;
         &lt;remarks&gt;
            &lt;p&gt;A resource can be used in two ways. 1) it may point to an specific retrievable network resource using a &lt;code&gt;rlink&lt;/code&gt;, or 2) it may be included as an attachment using a &lt;code&gt;base64&lt;/code&gt;. A resource may contain multiple &lt;code&gt;rlink&lt;/code&gt; and &lt;code&gt;base64&lt;/code&gt; entries that represent alternative download locations (rlink) and attachments (base64) for the same resource. Both rlink and base64 allow for a &lt;code&gt;media-type&lt;/code&gt; to be specified, which is used to distinguish between different representations of the same resource (e.g., Microsoft Word, PDF). When multiple &lt;code&gt;rlink&lt;/code&gt; and &lt;code&gt;base64&lt;/code&gt; items are included for a given resource, all items must contain equivalent information. This allows the document consumer to choose a preferred item to process based on a the selected item's &lt;code&gt;media-type&lt;/code&gt;. This is extremely important when the items represent OSCAL content that is represented in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed from any of the available formats indicated by the items.&lt;/p&gt;
            &lt;p&gt;When a resource includes a citation, then the &lt;code&gt;title&lt;/code&gt; and &lt;code&gt;citation&lt;/code&gt; properties must both be included.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/define-assembly&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;index name="index-back-matter-resource" target="resource"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;Provides a collection of identified &lt;code&gt;resource&lt;/code&gt; objects that can be referenced by a &lt;code&gt;link&lt;/code&gt; with a &lt;code&gt;rel&lt;/code&gt; value of "reference" and an &lt;code&gt;href&lt;/code&gt; value that is a fragment "#" followed by a reference to a reference identifier. Other specialized link "rel" values also use this pattern when indicated in that context of use.&lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;description&gt;Use of link, citation, and resource&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The following is a contrived example to show the use of link, citation, and resource.&lt;/p&gt;
      &lt;/remarks&gt;
      &lt;profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"&gt;
         &lt;metadata&gt;
            &lt;link rel="citation" href="#resource1"&gt;My citation&lt;/link&gt;
         &lt;/metadata&gt;
         &lt;back-matter&gt;
            &lt;resource id="resource1"&gt;
               &lt;rlink href="https://example.org/some-resource"/&gt;
            &lt;/resource&gt;
         &lt;/back-matter&gt;
      &lt;/profile&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/property" class="toc1 head">Assembly
         <code>property</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Property</p>
      <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
         qualified name/value pair. The value of a property is a simple scalar value, which
         may be expressed as a list of values.</p>
      <p class="use-name"><span class="lbl">use-name</span>prop</p>
      <div class="remarks">
         <p class="p">Properties permit the deployment and management of arbitrary controlled values, within
            OSCAL objects. A property can be included for any purpose useful to an application
            or implementation. Typically, properties will be used to sort, filter, select, order,
            and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
            an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
            lexical composition of properties may be constrained by external processes to ensure
            consistency.</p>
         <p class="p">Property allows for associated remarks that describe why the specific property value
            was applied to the containing object, or the significance of the value in the context
            of the containing object.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/property/name">Flag (defined inline) <code>name</code></li>
         <li id="/assembly/oscal-metadata/property/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-metadata/property/ns">Flag (defined inline) <code>ns</code></li>
         <li id="/assembly/oscal-metadata/property/value">Flag (defined inline) <code>value</code></li>
         <li id="/assembly/oscal-metadata/property/class">Flag (defined inline) <code>class</code></li>
         <li id="/assembly/oscal-metadata/property/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/property"
                 _metaschema-json-id="/assembly/oscal-metadata/property"
                 scope="global"
                 name="property"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:property"&gt;
   &lt;formal-name&gt;Property&lt;/formal-name&gt;
   &lt;description&gt;An attribute, characteristic, or quality of the containing object expressed as a namespace qualified name/value pair. The value of a property is a simple scalar value, which may be expressed as a list of values.&lt;/description&gt;
   &lt;use-name&gt;prop&lt;/use-name&gt;
   &lt;define-flag _step="name"
                _key="name"
                _metaschema-xml-id="/assembly/oscal-metadata/property/name"
                _metaschema-json-id="/assembly/oscal-metadata/property/name"
                required="yes"
                as-type="NCName"
                name="name"
                _using-name="name"
                _in-xml-name="name"
                _in-json-name="name"&gt;
      &lt;formal-name&gt;Property Name&lt;/formal-name&gt;
      &lt;description&gt;A textual label that uniquely identifies a specific attribute, characteristic, or quality of the property's containing object.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="marking"&gt;A label or descriptor that is tied to a sensitivity or classification marking system. An optional class can be used to define the specific marking system used for the associated value.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-metadata/property/uuid"
                _metaschema-json-id="/assembly/oscal-metadata/property/uuid"
                required="no"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Property Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier that can be used to reference this property elsewhere in an OSCAL document. A UUID should be consistently used for a given location across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="ns"
                _key="ns"
                _metaschema-xml-id="/assembly/oscal-metadata/property/ns"
                _metaschema-json-id="/assembly/oscal-metadata/property/ns"
                required="no"
                as-type="uri"
                name="ns"
                _using-name="ns"
                _in-xml-name="ns"
                _in-json-name="ns"&gt;
      &lt;formal-name&gt;Property Namespace&lt;/formal-name&gt;
      &lt;description&gt;A namespace qualifying the property's name. This allows different organizations to associate distinct semantics with the same name.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;Provides a means to segment the value space for the &lt;code&gt;name&lt;/code&gt;, so that different organizations and individuals can assert control over the allowed names and associated values used in a property. This allows the semantics associated with a given name/value pair to be defined on an organization-by-organization basis.&lt;/p&gt;
         &lt;p&gt;An organization MUST use a URI that they have control over. e.g., a domain registered to the organization in a URI, a registered uniform resource names (URN) namespace.&lt;/p&gt;
         &lt;p&gt;When a &lt;code&gt;ns&lt;/code&gt; is not provided, its value should be assumed to be &lt;code&gt;http://csrc.nist.gov/ns/oscal&lt;/code&gt; and the name should be a name defined by the associated OSCAL model.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="value"
                _key="value"
                _metaschema-xml-id="/assembly/oscal-metadata/property/value"
                _metaschema-json-id="/assembly/oscal-metadata/property/value"
                required="yes"
                as-type="string"
                name="value"
                _using-name="value"
                _in-xml-name="value"
                _in-json-name="value"&gt;
      &lt;formal-name&gt;Property Value&lt;/formal-name&gt;
      &lt;description&gt;Indicates the value of the attribute, characteristic, or quality.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="class"
                _key="class"
                _metaschema-xml-id="/assembly/oscal-metadata/property/class"
                _metaschema-json-id="/assembly/oscal-metadata/property/class"
                required="no"
                as-type="NCName"
                name="class"
                _using-name="class"
                _in-xml-name="class"
                _in-json-name="class"&gt;
      &lt;formal-name&gt;Property Class&lt;/formal-name&gt;
      &lt;description&gt;A textual label that provides a sub-type or characterization of the property's &lt;code&gt;name&lt;/code&gt;. This can be used to further distinguish or discriminate between the semantics of multiple properties of the same object with the same &lt;code&gt;name&lt;/code&gt; and &lt;code&gt;ns&lt;/code&gt;. &lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can be used in validation rules to express extra constraints over named items of a specific &lt;code&gt;class&lt;/code&gt; value.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/property/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/property/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;Properties permit the deployment and management of arbitrary controlled values, within OSCAL objects. A property can be included for any purpose useful to an application or implementation. Typically, properties will be used to sort, filter, select, order, and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the lexical composition of properties may be constrained by external processes to ensure consistency.&lt;/p&gt;
      &lt;p&gt;Property allows for associated remarks that describe why the specific property value was applied to the containing object, or the significance of the value in the context of the containing object.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/link" class="toc1 head">Assembly
         <code>link</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Link</p>
      <p class="description">A reference to a local or remote resource</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="require">
            <p class="element-label"><span class="lbl">require</span></p>
            
            <div class="require">
               <p class="element-label"><span class="lbl">require</span></p>
               
               <div class="matches">
                  <p class="element-label"><span class="lbl">matches</span></p>
               </div>
               
               <div class="index-has-key">
                  <p class="element-label"><span class="lbl">index-has-key</span></p>
                  
                  <div class="key-field">
                     <p class="element-label"><span class="lbl">key-field</span></p>
                  </div>
                  </div>
               </div>
            
            <div class="require">
               <p class="element-label"><span class="lbl">require</span></p>
               
               <div class="matches">
                  <p class="element-label"><span class="lbl">matches</span></p>
               </div>
               </div>
            </div>
         </div>
      <div class="remarks">
         <p class="p">To provide a cryptographic hash for a remote target resource, a local reference to
            a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
         <p class="p">The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         <p class="description">Providing for link integrity</p>
         
         <div class="remarks">
            <p class="p">The following is a contrived example to show the use of link, citation, and resource.</p>
         </div>
         
         <p class="oscal"><span class="lbl">oscal</span>
            
            <p class="link"><span class="lbl">link</span>My Hashed Resource</p>
            ...snip...
            
            <div class="back-matter">
               <p class="element-label"><span class="lbl">back-matter</span></p>
               
               <div class="resource">
                  <p class="element-label"><span class="lbl">resource</span></p>
                  
                  <div class="rlink">
                     <p class="element-label"><span class="lbl">rlink</span></p>
                     
                     <p class="hash"><span class="lbl">hash</span>C2E9C1..snip..F88D2E</p>
                     </div>
                  </div>
               </div>
            </p>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/link/href">Flag (defined inline) <code>href</code></li>
         <li id="/assembly/oscal-metadata/link/rel">Flag (defined inline) <code>rel</code></li>
         <li id="/assembly/oscal-metadata/link/media-type">Flag (reference) <code>media-type</code></li>
         <li id="/assembly/oscal-metadata/link/text">Field (defined inline) <code>text</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/link"
                 _metaschema-json-id="/assembly/oscal-metadata/link"
                 scope="global"
                 name="link"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:link"&gt;
   &lt;formal-name&gt;Link&lt;/formal-name&gt;
   &lt;description&gt;A reference to a local or remote resource&lt;/description&gt;
   &lt;define-flag _step="href"
                _key="href"
                _metaschema-xml-id="/assembly/oscal-metadata/link/href"
                _metaschema-json-id="/assembly/oscal-metadata/link/href"
                required="yes"
                as-type="uri-reference"
                name="href"
                _using-name="href"
                _in-xml-name="href"
                _in-json-name="href"&gt;
      &lt;formal-name&gt;Hypertext Reference&lt;/formal-name&gt;
      &lt;description&gt;A resolvable URL reference to a resource.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The value of the &lt;code&gt;href&lt;/code&gt; can be an internet resource, or a local reference using a fragment e.g. #fragment that points to a &lt;code&gt;back-matter&lt;/code&gt;
            &lt;code&gt;resource&lt;/code&gt; in the same document.&lt;/p&gt;
         &lt;p&gt;If a local reference using a fragment is used, this will be indicated by a fragment "#" followed by an identifier which references an identified &lt;code&gt;resource&lt;/code&gt; in the document's &lt;code&gt;back-matter&lt;/code&gt; or another object that is within the scope of the containing OSCAL document.&lt;/p&gt;
         &lt;p&gt;If an internet resource is used, the &lt;code&gt;href&lt;/code&gt; value will be an absolute or relative URI pointing to the location of the referenced resource. A relative URI will be resolved relative to the location of the document containing the link.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="rel"
                _key="rel"
                _metaschema-xml-id="/assembly/oscal-metadata/link/rel"
                _metaschema-json-id="/assembly/oscal-metadata/link/rel"
                required="no"
                as-type="NCName"
                name="rel"
                _using-name="rel"
                _in-xml-name="rel"
                _in-json-name="rel"&gt;
      &lt;formal-name&gt;Relation&lt;/formal-name&gt;
      &lt;description&gt;Describes the type of relationship provided by the link. This can be an indicator of the link's purpose.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="reference"&gt;Reference&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;flag _step="media-type"
         _key="media-type"
         _metaschema-xml-id="/assembly/oscal-metadata/link/media-type"
         _metaschema-json-id="/assembly/oscal-metadata/link/media-type"
         as-type="string"
         required="no"
         ref="media-type"
         _key-ref="oscal-metadata:media-type"
         _using-name="media-type"
         _in-xml-name="media-type"
         _in-json-name="media-type"&gt;
      &lt;remarks&gt;
         &lt;p&gt;The &lt;code&gt;media-type&lt;/code&gt; provides a hint about the content model of the referenced resource. A valid entry from the &lt;a href="https://www.iana.org/assignments/media-types/media-types.xhtml"&gt;IANA Media Types registry&lt;/a&gt; SHOULD be used.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/flag&gt;
   &lt;model&gt;
      &lt;define-field _step="text"
                    _key="text"
                    _metaschema-xml-id="/assembly/oscal-metadata/link/text"
                    _metaschema-json-id="/assembly/oscal-metadata/link/text"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="text"
                    _using-name="text"
                    _in-xml-name="text"
                    _in-json-name="text"&gt;
         &lt;formal-name&gt;Link Text&lt;/formal-name&gt;
         &lt;description&gt;A textual label to associate with the link, which may be used for presentation in a tool.&lt;/description&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;require when="@rel=('reference')"&gt;
         &lt;require when="starts-with(@href,'#')"&gt;
            &lt;matches target="@href" datatype="uri-reference"/&gt;
            &lt;index-has-key name="index-back-matter-resource" target="."&gt;
               &lt;key-field target="@href" pattern="#(.*)"/&gt;
            &lt;/index-has-key&gt;
         &lt;/require&gt;
         &lt;require when="not(starts-with(@href,'#'))"&gt;
            &lt;matches target="@href" datatype="uri"/&gt;
         &lt;/require&gt;
      &lt;/require&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;To provide a cryptographic hash for a remote target resource, a local reference to a back matter &lt;code&gt;resource&lt;/code&gt; is needed. The resource allows one or more hash values to be provided using the &lt;code&gt;rlink/hash&lt;/code&gt; object.&lt;/p&gt;
      &lt;p&gt;The OSCAL &lt;code&gt;link&lt;/code&gt; is a roughly based on the HTML &lt;a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK"&gt;link element&lt;/a&gt;. &lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;description&gt;Providing for link integrity&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The following is a contrived example to show the use of link, citation, and resource.&lt;/p&gt;
      &lt;/remarks&gt;
      &lt;oscal xmlns="http://csrc.nist.gov/ns/oscal/1.0"&gt;
         &lt;link rel="reference" href="#resource1"&gt;My Hashed Resource&lt;/link&gt;
        ...snip...
                &lt;back-matter&gt;
            &lt;resource id="resource1"&gt;
               &lt;rlink href="https://example.org/some-resource"&gt;
                  &lt;hash algorithm="sha512"&gt;C2E9C1..snip..F88D2E&lt;/hash&gt;
               &lt;/rlink&gt;
            &lt;/resource&gt;
         &lt;/back-matter&gt;
      &lt;/oscal&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/responsible-party" class="toc1 head">Assembly
         <code>responsible-party</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Responsible Party</p>
      <p class="description">A reference to a set of organizations or persons that have responsibility for performing
         a referenced role in the context of the containing object.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/responsible-party/role-id">Flag (defined inline) <code>role-id</code></li>
         <li id="/assembly/oscal-metadata/responsible-party/party-uuid">Field (reference) <code>party-uuid</code> - grouped as <code>party-uuids</code></li>
         <li id="/assembly/oscal-metadata/responsible-party/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/responsible-party/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/responsible-party/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/responsible-party"
                 _metaschema-json-id="/assembly/oscal-metadata/responsible-party"
                 scope="global"
                 name="responsible-party"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:responsible-party"&gt;
   &lt;formal-name&gt;Responsible Party&lt;/formal-name&gt;
   &lt;description&gt;A reference to a set of organizations or persons that have responsibility for performing a referenced role in the context of the containing object.&lt;/description&gt;
   &lt;define-flag _step="role-id"
                _key="role-id"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/role-id"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-party/role-id"
                required="yes"
                as-type="NCName"
                name="role-id"
                _using-name="role-id"
                _in-xml-name="role-id"
                _in-json-name="role-id"&gt;
      &lt;formal-name&gt;Responsible Role&lt;/formal-name&gt;
      &lt;description&gt;The role that the party is responsible for.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;field _step="party-uuid"
             _key="party-uuids"
             _group-name="party-uuids"
             _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/party-uuid"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-party/party-uuids"
             max-occurs="unbounded"
             min-occurs="1"
             ref="party-uuid"
             _key-ref="oscal-metadata:party-uuid"
             _using-name="party-uuid"
             _in-xml-name="party-uuid"
             _in-json-name="party-uuids"&gt;
         &lt;group-as name="party-uuids" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Specifies one or more parties that are responsible for performing the associated &lt;code&gt;role&lt;/code&gt;. &lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/prop"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-party/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/link"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-party/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-party/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-role-id" target="."&gt;
         &lt;key-field target="@role-id"/&gt;
      &lt;/index-has-key&gt;
      &lt;index-has-key name="index-metadata-party-uuid" target="party-uuid"&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/responsible-role" class="toc1 head">Assembly
         <code>responsible-role</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Responsible Role</p>
      <p class="description">A reference to one or more roles with responsibility for performing a function relative
         to the containing object.</p>
      <ul class="model">
         <li id="/assembly/oscal-metadata/responsible-role/role-id">Flag (defined inline) <code>role-id</code></li>
         <li id="/assembly/oscal-metadata/responsible-role/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/responsible-role/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/responsible-role/party-uuid">Field (reference) <code>party-uuid</code> - grouped as <code>party-uuids</code></li>
         <li id="/assembly/oscal-metadata/responsible-role/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/responsible-role"
                 _metaschema-json-id="/assembly/oscal-metadata/responsible-role"
                 scope="global"
                 name="responsible-role"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:responsible-role"&gt;
   &lt;formal-name&gt;Responsible Role&lt;/formal-name&gt;
   &lt;description&gt;A reference to one or more roles with responsibility for performing a function relative to the containing object.&lt;/description&gt;
   &lt;define-flag _step="role-id"
                _key="role-id"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/role-id"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-role/role-id"
                required="yes"
                as-type="NCName"
                name="role-id"
                _using-name="role-id"
                _in-xml-name="role-id"
                _in-json-name="role-id"&gt;
      &lt;formal-name&gt;Responsible Role ID&lt;/formal-name&gt;
      &lt;description&gt;The role that is responsible for the business function.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/prop"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-role/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/link"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-role/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="party-uuid"
             _key="party-uuids"
             _group-name="party-uuids"
             _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/party-uuid"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-role/party-uuids"
             max-occurs="unbounded"
             min-occurs="0"
             ref="party-uuid"
             _key-ref="oscal-metadata:party-uuid"
             _using-name="party-uuid"
             _in-xml-name="party-uuid"
             _in-json-name="party-uuids"&gt;
         &lt;group-as name="party-uuids" in-json="ARRAY"/&gt;
      &lt;/field&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-role/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/hash" class="toc1 head">Field <code>hash</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Hash</p>
      <p class="description">A representation of a cryptographic digest generated over a resource using a specified
         hash algorithm.</p>
      <p class="json-value-key"><span class="lbl">json-value-key</span>value</p>
      <div class="remarks">
         <p class="p">A hash value can be used to authenticate that a referenced resource is the same resources
            as was pointed to by the author of the reference.</p>
      </div>
      <ul class="model">
         <li id="/field/oscal-metadata/hash/algorithm">Flag (defined inline) <code>algorithm</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/hash"
              _metaschema-json-id="/field/oscal-metadata/hash"
              collapsible="no"
              as-type="string"
              scope="global"
              name="hash"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:hash"&gt;
   &lt;formal-name&gt;Hash&lt;/formal-name&gt;
   &lt;description&gt;A representation of a cryptographic digest generated over a resource using a specified hash algorithm.&lt;/description&gt;
   &lt;json-value-key&gt;value&lt;/json-value-key&gt;
   &lt;define-flag _step="algorithm"
                _key="algorithm"
                _metaschema-xml-id="/field/oscal-metadata/hash/algorithm"
                _metaschema-json-id="/field/oscal-metadata/hash/algorithm"
                required="yes"
                as-type="string"
                name="algorithm"
                _using-name="algorithm"
                _in-xml-name="algorithm"
                _in-json-name="algorithm"&gt;
      &lt;formal-name&gt;Hash algorithm&lt;/formal-name&gt;
      &lt;description&gt;Method by which a hash is derived&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="SHA-224"&gt;The SHA-224 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.180-4"&gt;NIST FIPS 180-4&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA-256"&gt;The SHA-256 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.180-4"&gt;NIST FIPS 180-4&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA-384"&gt;The SHA-384 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.180-4"&gt;NIST FIPS 180-4&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA-512"&gt;The SHA-512 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.180-4"&gt;NIST FIPS 180-4&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA3-224"&gt;The SHA3-224 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.202"&gt;NIST FIPS 202&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA3-256"&gt;The SHA3-256 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.202"&gt;NIST FIPS 202&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA3-384"&gt;The SHA3-384 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.202"&gt;NIST FIPS 202&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA3-512"&gt;The SHA3-512 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.202"&gt;NIST FIPS 202&lt;/a&gt;.
                    &lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
      &lt;remarks&gt;
         &lt;p&gt;Any other value used MUST be a value defined in the W3C &lt;a href="http://www.w3.org/TR/xmlsec-algorithms/#digest-method"&gt;XML Security Algorithm Cross-Reference&lt;/a&gt; Digest Methods (W3C, April 2013) or &lt;a href="https://tools.ietf.org/html/rfc6931#section-2.1.5"&gt;RFC 6931 Section 2.1.5&lt;/a&gt; New SHA Functions.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;remarks&gt;
      &lt;p&gt;A hash value can be used to authenticate that a referenced resource is the same resources as was pointed to by the author of the reference.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-metadata/media-type" class="toc1 head">Flag <code>media-type</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Media Type</p>
      <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
         <a href="https://www.iana.org/assignments/media-types/media-types.xhtml">Media Types Registry</a>. </p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-metadata/media-type"
             _metaschema-json-id="/flag/oscal-metadata/media-type"
             as-type="string"
             scope="global"
             name="media-type"
             module="oscal-metadata"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:media-type"&gt;
   &lt;formal-name&gt;Media Type&lt;/formal-name&gt;
   &lt;description&gt;Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA) &lt;a href="https://www.iana.org/assignments/media-types/media-types.xhtml"&gt;Media Types Registry&lt;/a&gt;. &lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/remarks" class="toc1 head">Field <code>remarks</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Remarks</p>
      <p class="description">Additional commentary on the containing object.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/remarks"
              _metaschema-json-id="/field/oscal-metadata/remarks"
              in-xml="WITH_WRAPPER"
              collapsible="no"
              as-type="markup-multiline"
              scope="global"
              name="remarks"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:remarks"&gt;
   &lt;formal-name&gt;Remarks&lt;/formal-name&gt;
   &lt;description&gt;Additional commentary on the containing object.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/published" class="toc1 head">Field <code>published</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Publication Timestamp</p>
      <p class="description">The date and time the document was published. The date-time value must be formatted
         according to <a href="https://tools.ietf.org/html/rfc3339">RFC 3339</a> with full time and time zone included.</p>
      <div class="remarks">
         <p class="p">This value represents the point in time when the OSCAL document was published. Typically,
            this date value will be machine generated at the time the containing document is published.</p>
         <p class="p">In some cases, an OSCAL document may be derived from some source material in a different
            format. In such a case, the <code>published</code> value should indicate when the OSCAL document was published, not the source material.
            Where necessary, the publication date of the original source material can be captured
            as a named property or custom metadata construct.</p>
         <p class="p">A publisher of OSCAL content can use this data point along with its siblings <code>last-modified</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
            The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/published"
              _metaschema-json-id="/field/oscal-metadata/published"
              collapsible="no"
              as-type="dateTime-with-timezone"
              scope="local"
              name="published"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:published"&gt;
   &lt;formal-name&gt;Publication Timestamp&lt;/formal-name&gt;
   &lt;description&gt;The date and time the document was published. The date-time value must be formatted according to &lt;a href="https://tools.ietf.org/html/rfc3339"&gt;RFC 3339&lt;/a&gt; with full time and time zone included.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;This value represents the point in time when the OSCAL document was published. Typically, this date value will be machine generated at the time the containing document is published.&lt;/p&gt;
      &lt;p&gt;In some cases, an OSCAL document may be derived from some source material in a different format. In such a case, the &lt;code&gt;published&lt;/code&gt; value should indicate when the OSCAL document was published, not the source material. Where necessary, the publication date of the original source material can be captured as a named property or custom metadata construct.&lt;/p&gt;
      &lt;p&gt;A publisher of OSCAL content can use this data point along with its siblings &lt;code&gt;last-modified&lt;/code&gt; and &lt;code&gt;version&lt;/code&gt; to establish a sequence of successive revisions of a given OSCAL-based publication. The metadata for previous revisions can be represented as a &lt;code&gt;revision&lt;/code&gt; in this object.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/last-modified" class="toc1 head">Field <code>last-modified</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Last Modified Timestamp</p>
      <p class="description">The date and time the document was last modified. The date-time value must be formatted
         according to <a href="https://tools.ietf.org/html/rfc3339">RFC 3339</a> with full time and time zone included.</p>
      <div class="remarks">
         <p class="p">This value represents the point in time when the OSCAL document was last updated,
            or at the point of creation the creation date. Typically, this date value will be
            machine generated at time of creation or modification.</p>
         <p class="p">In some cases, an OSCAL document may be derived from some source material in a different
            format. In such a case, the <code>last-modified</code> value should indicate the modification time of the OSCAL document, not the source
            material.</p>
         <p class="p">A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
            The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/last-modified"
              _metaschema-json-id="/field/oscal-metadata/last-modified"
              collapsible="no"
              as-type="dateTime-with-timezone"
              scope="local"
              name="last-modified"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:last-modified"&gt;
   &lt;formal-name&gt;Last Modified Timestamp&lt;/formal-name&gt;
   &lt;description&gt;The date and time the document was last modified. The date-time value must be formatted according to &lt;a href="https://tools.ietf.org/html/rfc3339"&gt;RFC 3339&lt;/a&gt; with full time and time zone included.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;This value represents the point in time when the OSCAL document was last updated, or at the point of creation the creation date. Typically, this date value will be machine generated at time of creation or modification.&lt;/p&gt;
      &lt;p&gt;In some cases, an OSCAL document may be derived from some source material in a different format. In such a case, the &lt;code&gt;last-modified&lt;/code&gt; value should indicate the modification time of the OSCAL document, not the source material.&lt;/p&gt;
      &lt;p&gt;A publisher of OSCAL content can use this data point along with its siblings &lt;code&gt;published&lt;/code&gt; and &lt;code&gt;version&lt;/code&gt; to establish a sequence of successive revisions of a given OSCAL-based publication. The metadata for previous revisions can be represented as a &lt;code&gt;revision&lt;/code&gt; in this object.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/version" class="toc1 head">Field <code>version</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Document Version</p>
      <p class="description">A string used to distinguish the current version of the document from other previous
         (and future) versions.</p>
      <div class="remarks">
         <p class="p">A version string may be a release number, sequence number, date, or other identifier
            suffcient to distinguish between different document versions. This version is typically
            set by the document owner or by the tool used to maintain the content.</p>
         <p class="p">While not required, it is recommended that OSCAL content authors use <a href="https://semver.org/spec/v2.0.0.html">Semantic Versioning</a> as a format for version strings. This allows for the easy identification of a version
            tree consisting of major, minor, and patch numbers.</p>
         <p class="p">A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>last-modified</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
            The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/version"
              _metaschema-json-id="/field/oscal-metadata/version"
              collapsible="no"
              as-type="string"
              scope="local"
              name="version"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:version"&gt;
   &lt;formal-name&gt;Document Version&lt;/formal-name&gt;
   &lt;description&gt;A string used to distinguish the current version of the document from other previous (and future) versions.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;A version string may be a release number, sequence number, date, or other identifier suffcient to distinguish between different document versions. This version is typically set by the document owner or by the tool used to maintain the content.&lt;/p&gt;
      &lt;p&gt;While not required, it is recommended that OSCAL content authors use &lt;a href="https://semver.org/spec/v2.0.0.html"&gt;Semantic Versioning&lt;/a&gt; as a format for version strings. This allows for the easy identification of a version tree consisting of major, minor, and patch numbers.&lt;/p&gt;
      &lt;p&gt;A publisher of OSCAL content can use this data point along with its siblings &lt;code&gt;published&lt;/code&gt; and &lt;code&gt;last-modified&lt;/code&gt; to establish a sequence of successive revisions of a given OSCAL-based publication. The metadata for previous revisions can be represented as a &lt;code&gt;revision&lt;/code&gt; in this object.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/oscal-version" class="toc1 head">Field <code>oscal-version</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">OSCAL version</p>
      <p class="description">The OSCAL model version the document was authored against.</p>
      <div class="remarks">
         <p class="p">Indicates the version of the OSCAL model to which this data set conforms, for example
            <q>1.1.0</q> or <q>1.0.0-M1</q>. That can be used as a hint by a tool to indicate which version of the OSCAL XML
            or JSON schema to use for validation.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/oscal-version"
              _metaschema-json-id="/field/oscal-metadata/oscal-version"
              collapsible="no"
              as-type="string"
              scope="local"
              name="oscal-version"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:oscal-version"&gt;
   &lt;formal-name&gt;OSCAL version&lt;/formal-name&gt;
   &lt;description&gt;The OSCAL model version the document was authored against.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;Indicates the version of the OSCAL model to which this data set conforms, for example &lt;q&gt;1.1.0&lt;/q&gt; or &lt;q&gt;1.0.0-M1&lt;/q&gt;. That can be used as a hint by a tool to indicate which version of the OSCAL XML or JSON schema to use for validation.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/email-address" class="toc1 head">Field <code>email-address</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Email Address</p>
      <p class="description">An email address as defined by <a href="https://tools.ietf.org/html/rfc5322#section-3.4.1">RFC 5322 Section 3.4.1</a>. </p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/email-address"
              _metaschema-json-id="/field/oscal-metadata/email-address"
              collapsible="no"
              as-type="email"
              scope="local"
              name="email-address"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:email-address"&gt;
   &lt;formal-name&gt;Email Address&lt;/formal-name&gt;
   &lt;description&gt;An email address as defined by &lt;a href="https://tools.ietf.org/html/rfc5322#section-3.4.1"&gt;RFC 5322 Section 3.4.1&lt;/a&gt;. &lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/telephone-number" class="toc1 head">Field <code>telephone-number</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Telephone Number</p>
      <p class="description">Contact number by telephone.</p>
      <p class="json-value-key"><span class="lbl">json-value-key</span>number</p>
      <ul class="model">
         <li id="/field/oscal-metadata/telephone-number/type">Flag (defined inline) <code>type</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/telephone-number"
              _metaschema-json-id="/field/oscal-metadata/telephone-number"
              collapsible="no"
              as-type="string"
              scope="local"
              name="telephone-number"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:telephone-number"&gt;
   &lt;formal-name&gt;Telephone Number&lt;/formal-name&gt;
   &lt;description&gt;Contact number by telephone.&lt;/description&gt;
   &lt;json-value-key&gt;number&lt;/json-value-key&gt;
   &lt;define-flag _step="type"
                _key="type"
                _metaschema-xml-id="/field/oscal-metadata/telephone-number/type"
                _metaschema-json-id="/field/oscal-metadata/telephone-number/type"
                required="no"
                as-type="string"
                name="type"
                _using-name="type"
                _in-xml-name="type"
                _in-json-name="type"&gt;
      &lt;formal-name&gt;type flag&lt;/formal-name&gt;
      &lt;description&gt;Indicates the type of phone number.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="home"&gt;A home phone number.&lt;/enum&gt;
            &lt;enum value="office"&gt;An office phone number.&lt;/enum&gt;
            &lt;enum value="mobile"&gt;A mobile phone number.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/address" class="toc1 head">Assembly
         <code>address</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Address</p>
      <p class="description">A postal address for the location.</p>
      <ul class="model">
         <li id="/assembly/oscal-metadata/address/type">Flag (reference) <code>location-type</code> - using name <code>type</code></li>
         <li id="/assembly/oscal-metadata/address/addr-line">Field (reference) <code>addr-line</code> - grouped as <code>addr-lines</code></li>
         <li id="/assembly/oscal-metadata/address/city">Field (defined inline) <code>city</code></li>
         <li id="/assembly/oscal-metadata/address/state">Field (defined inline) <code>state</code></li>
         <li id="/assembly/oscal-metadata/address/postal-code">Field (defined inline) <code>postal-code</code></li>
         <li id="/assembly/oscal-metadata/address/country">Field (defined inline) <code>country</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/address"
                 _metaschema-json-id="/assembly/oscal-metadata/address"
                 scope="local"
                 name="address"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:address"&gt;
   &lt;formal-name&gt;Address&lt;/formal-name&gt;
   &lt;description&gt;A postal address for the location.&lt;/description&gt;
   &lt;flag _step="type"
         _key="type"
         _metaschema-xml-id="/assembly/oscal-metadata/address/type"
         _metaschema-json-id="/assembly/oscal-metadata/address/type"
         as-type="NCName"
         required="no"
         ref="location-type"
         _key-ref="oscal-metadata:location-type"
         _using-name="type"
         _in-xml-name="type"
         _in-json-name="type"&gt;
      &lt;use-name&gt;type&lt;/use-name&gt;
   &lt;/flag&gt;
   &lt;model&gt;
      &lt;field _step="addr-line"
             _key="addr-lines"
             _group-name="addr-lines"
             _metaschema-xml-id="/assembly/oscal-metadata/address/addr-line"
             _metaschema-json-id="/assembly/oscal-metadata/address/addr-lines"
             max-occurs="unbounded"
             min-occurs="0"
             ref="addr-line"
             _key-ref="oscal-metadata:addr-line"
             _using-name="addr-line"
             _in-xml-name="addr-line"
             _in-json-name="addr-lines"&gt;
         &lt;group-as name="addr-lines" in-json="ARRAY"/&gt;
      &lt;/field&gt;
      &lt;define-field _step="city"
                    _key="city"
                    _metaschema-xml-id="/assembly/oscal-metadata/address/city"
                    _metaschema-json-id="/assembly/oscal-metadata/address/city"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="city"
                    _using-name="city"
                    _in-xml-name="city"
                    _in-json-name="city"&gt;
         &lt;formal-name&gt;City&lt;/formal-name&gt;
         &lt;description&gt;City, town or geographical region for the mailing address.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="state"
                    _key="state"
                    _metaschema-xml-id="/assembly/oscal-metadata/address/state"
                    _metaschema-json-id="/assembly/oscal-metadata/address/state"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="state"
                    _using-name="state"
                    _in-xml-name="state"
                    _in-json-name="state"&gt;
         &lt;formal-name&gt;State&lt;/formal-name&gt;
         &lt;description&gt;State, province or analogous geographical region for mailing address&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="postal-code"
                    _key="postal-code"
                    _metaschema-xml-id="/assembly/oscal-metadata/address/postal-code"
                    _metaschema-json-id="/assembly/oscal-metadata/address/postal-code"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="postal-code"
                    _using-name="postal-code"
                    _in-xml-name="postal-code"
                    _in-json-name="postal-code"&gt;
         &lt;formal-name&gt;Postal Code&lt;/formal-name&gt;
         &lt;description&gt;Postal or ZIP code for mailing address&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="country"
                    _key="country"
                    _metaschema-xml-id="/assembly/oscal-metadata/address/country"
                    _metaschema-json-id="/assembly/oscal-metadata/address/country"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="country"
                    _using-name="country"
                    _in-xml-name="country"
                    _in-json-name="country"&gt;
         &lt;formal-name&gt;Country Code&lt;/formal-name&gt;
         &lt;description&gt;The ISO 3166-1 alpha-2 country code for the mailing address.&lt;/description&gt;
         &lt;constraint&gt;
            &lt;matches target="." regex="[A-Z](2)"/&gt;
         &lt;/constraint&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/addr-line" class="toc1 head">Field <code>addr-line</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Address line</p>
      <p class="description">A single line of an address.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/addr-line"
              _metaschema-json-id="/field/oscal-metadata/addr-line"
              collapsible="no"
              as-type="string"
              scope="local"
              name="addr-line"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:addr-line"&gt;
   &lt;formal-name&gt;Address line&lt;/formal-name&gt;
   &lt;description&gt;A single line of an address.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-metadata/location-type" class="toc1 head">Flag <code>location-type</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Address Type</p>
      <p class="description">Indicates the type of address.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A home address.</p>
            
            <p class="enum"><span class="lbl">enum</span>A work address.</p>
            </div>
         </div>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-metadata/location-type"
             _metaschema-json-id="/flag/oscal-metadata/location-type"
             as-type="NCName"
             scope="local"
             name="location-type"
             module="oscal-metadata"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:location-type"&gt;
   &lt;formal-name&gt;Address Type&lt;/formal-name&gt;
   &lt;description&gt;Indicates the type of address.&lt;/description&gt;
   &lt;constraint&gt;
      &lt;allowed-values allow-other="yes"&gt;
         &lt;enum value="home"&gt;A home address.&lt;/enum&gt;
         &lt;enum value="work"&gt;A work address.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/document-id" class="toc1 head">Field <code>document-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Document Identifier</p>
      <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
         that are to be treated as different versions of the same document. If this element
         does not appear, or if the value of this element is empty, the value of "document-id"
         is equal to the value of the "uuid" flag of the top-level root element.</p>
      <p class="json-value-key"><span class="lbl">json-value-key</span>identifier</p>
      <div class="remarks">
         <p class="p">This element is optional, but it will always have a valid value, as if it is missing
            the value of "document-id" is assumed to be equal to the UUID of the root. This requirement
            allows for document creators to retroactively link an update to the original version,
            by providing a document-id on the new document that is equal to the uuid of the original
            document.</p>
      </div>
      <ul class="model">
         <li id="/field/oscal-metadata/document-id/scheme">Flag (defined inline) <code>scheme</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/document-id"
              _metaschema-json-id="/field/oscal-metadata/document-id"
              collapsible="no"
              as-type="string"
              scope="local"
              name="document-id"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:document-id"&gt;
   &lt;formal-name&gt;Document Identifier&lt;/formal-name&gt;
   &lt;description&gt;A document identifier qualified by an identifier &lt;code&gt;scheme&lt;/code&gt;. A document identifier provides a globally unique identifier for a group of documents that are to be treated as different versions of the same document. If this element does not appear, or if the value of this element is empty, the value of "document-id" is equal to the value of the "uuid" flag of the top-level root element.&lt;/description&gt;
   &lt;json-value-key&gt;identifier&lt;/json-value-key&gt;
   &lt;define-flag _step="scheme"
                _key="scheme"
                _metaschema-xml-id="/field/oscal-metadata/document-id/scheme"
                _metaschema-json-id="/field/oscal-metadata/document-id/scheme"
                required="no"
                as-type="uri"
                name="scheme"
                _using-name="scheme"
                _in-xml-name="scheme"
                _in-json-name="scheme"&gt;
      &lt;formal-name&gt;Document Identification Scheme&lt;/formal-name&gt;
      &lt;description&gt;Qualifies the kind of document identifier using a URI. If the scheme is not provided the value of the element will be interpreted as a string of characters. &lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="https://www.doi.org/"&gt;A &lt;a href="https://www.doi.org/hb.html"&gt;Digital Object Identifier&lt;/a&gt; (DOI); use is preferred, since this allows for retrieval of a full bibliographic record.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;remarks&gt;
      &lt;p&gt;This element is optional, but it will always have a valid value, as if it is missing the value of "document-id" is assumed to be equal to the UUID of the root. This requirement allows for document creators to retroactively link an update to the original version, by providing a document-id on the new document that is equal to the uuid of the original document.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/part" class="toc1 head">Assembly
         <code>part</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Part</p>
      <p class="description">A partition of a control's definition or a child of another part.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A human-readable label for the parent context.</p>
            
            <p class="enum"><span class="lbl">enum</span>An alternative identifier, whose value is easily sortable among other such values
               in the document.</p>
            
            </div>
         
         <div class="require">
            <p class="element-label"><span class="lbl">require</span></p>
            
            <div class="allowed-values">
               <p class="element-label"><span class="lbl">allowed-values</span></p>
               
               <p class="enum"><span class="lbl">enum</span>The assessment method to use. This typically appears on parts with the name "assessment".</p>
               </div>
            
            <div class="has-cardinality">
               <p class="element-label"><span class="lbl">has-cardinality</span></p>
            </div>
            
            <div class="allowed-values">
               <p class="element-label"><span class="lbl">allowed-values</span></p>
               
               <p class="enum"><span class="lbl">enum</span>The process of holding discussions with individuals or groups of individuals within
                  an organization to once again, facilitate assessor understanding, achieve clarification,
                  or obtain evidence.</p>
               
               <p class="enum"><span class="lbl">enum</span>The process of reviewing, inspecting, observing, studying, or analyzing one or more
                  assessment objects (i.e., specifications, mechanisms, or activities).</p>
               
               <p class="enum"><span class="lbl">enum</span>The process of exercising one or more assessment objects (i.e., activities or mechanisms)
                  under specified conditions to compare actual with expected behavior.</p>
               </div>
            </div>
         </div>
      <div class="remarks">
         <p class="p">A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
            (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
            hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
         <p class="p">A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
            within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
            a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
         <p class="p">Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
            <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
            Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
            Each organization is responsible for governance of their own extensions, and is strongly
            encouraged to publish their extensions as standards to their user community. If no
            <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
         <p class="p">To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
            DNS or other globally defined organization name should be used. For example, if FedRAMP
            and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
         <p class="p">Tools that process OSCAL content are not required to interpret unrecognized OSCAL
            extensions; however, OSCAL compliant tools should not modify or remove unrecognized
            extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         <p class="description">Multiple Parts with Different Organization-Specific Names</p>
         
         <div class="part">
            <p class="element-label"><span class="lbl">part</span></p>
            
            <p class="part"><span class="lbl">part</span>Something FedRAMP Cares About</p>
            
            <p class="part"><span class="lbl">part</span>Something DoD Cares About</p>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/part/id">Flag (defined inline) <code>id</code></li>
         <li id="/assembly/oscal-catalog-common/part/name">Flag (defined inline) <code>name</code></li>
         <li id="/assembly/oscal-catalog-common/part/ns">Flag (defined inline) <code>ns</code></li>
         <li id="/assembly/oscal-catalog-common/part/class">Flag (defined inline) <code>class</code></li>
         <li id="/assembly/oscal-catalog-common/part/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-catalog-common/part/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-catalog-common/part/p ul ol pre table h1 h2 h3 h4 h5 h6">Field (defined inline) <code>prose</code></li>
         <li id="/assembly/oscal-catalog-common/part/part">Assembly (reference) <code>part</code> - grouped as <code>parts</code></li>
         <li id="/assembly/oscal-catalog-common/part/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/part"
                 _metaschema-json-id="/assembly/oscal-catalog-common/part"
                 scope="global"
                 name="part"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:part"&gt;
   &lt;formal-name&gt;Part&lt;/formal-name&gt;
   &lt;description&gt;A partition of a control's definition or a child of another part.&lt;/description&gt;
   &lt;define-flag _step="id"
                _key="id"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/id"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/id"
                required="no"
                as-type="NCName"
                name="id"
                _using-name="id"
                _in-xml-name="id"
                _in-json-name="id"&gt;
      &lt;formal-name&gt;Part Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier for a specific part instance. This identifier's uniqueness is document scoped and is intended to be consistent for the same part across minor revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="name"
                _key="name"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/name"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/name"
                required="yes"
                as-type="NCName"
                name="name"
                _using-name="name"
                _in-xml-name="name"
                _in-json-name="name"&gt;
      &lt;formal-name&gt;Part Name&lt;/formal-name&gt;
      &lt;description&gt;A textual label that uniquely identifies the part's semantic type.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="overview"&gt;An introduction to a control or a group of controls.&lt;/enum&gt;
            &lt;enum value="statement"&gt;A set of control implementation requirements.&lt;/enum&gt;
            &lt;enum value="item"&gt;An individual item within a control statement.&lt;/enum&gt;
            &lt;enum value="guidance"&gt;Additional information to consider when selecting, implementing, assessing, and monitoring a control.&lt;/enum&gt;
            &lt;enum value="objective"&gt;Describes a set of assessment objectives.&lt;/enum&gt;
            &lt;enum value="assessment"&gt;Describes a method-based assessment over a set of assessment objects.&lt;/enum&gt;
            &lt;enum value="objects"&gt;Provides a list of assessment objects.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="ns"
                _key="ns"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/ns"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/ns"
                required="no"
                as-type="uri"
                name="ns"
                _using-name="ns"
                _in-xml-name="ns"
                _in-json-name="ns"&gt;
      &lt;formal-name&gt;Part Namespace&lt;/formal-name&gt;
      &lt;description&gt;A namespace qualifying the part's name. This allows different organizations to associate distinct semantics with the same name.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;Provides a means to segment the value space for the &lt;code&gt;name&lt;/code&gt;, so that different organizations and individuals can assert control over the allowed names and associated text used in a part. This allows the semantics associated with a given name to be defined on an organization-by-organization basis.&lt;/p&gt;
         &lt;p&gt;An organization MUST use a URI that they have control over. e.g., a domain registered to the organization in a URI, a registered uniform resource names (URN) namespace.&lt;/p&gt;
         &lt;p&gt;When a &lt;code&gt;ns&lt;/code&gt; is not provided, its value should be assumed to be &lt;code&gt;http://csrc.nist.gov/ns/oscal&lt;/code&gt; and the name should be a name defined by the associated OSCAL model.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="class"
                _key="class"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/class"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/class"
                required="no"
                as-type="NCName"
                name="class"
                _using-name="class"
                _in-xml-name="class"
                _in-json-name="class"&gt;
      &lt;formal-name&gt;Part Class&lt;/formal-name&gt;
      &lt;description&gt;A textual label that provides a sub-type or characterization of the part's &lt;code&gt;name&lt;/code&gt;. This can be used to further distinguish or discriminate between the semantics of multiple parts of the same control with the same &lt;code&gt;name&lt;/code&gt; and &lt;code&gt;ns&lt;/code&gt;. &lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can be used in validation rules to express extra constraints over named items of a specific &lt;code&gt;class&lt;/code&gt; value.&lt;/p&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can also be used in an OSCAL profile as a means to target an alteration to control content.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/part/title"
                    _metaschema-json-id="/assembly/oscal-catalog-common/part/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Part Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the part, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/prop"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-field _step="p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _key="prose"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/part/p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _metaschema-json-id="/assembly/oscal-catalog-common/part/prose"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="UNWRAPPED"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="prose"
                    _using-name="prose"
                    _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _in-json-name="prose"&gt;
         &lt;formal-name&gt;Part Text&lt;/formal-name&gt;
         &lt;description&gt;Permits multiple paragraphs, lists, tables etc.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="part"
                _key="parts"
                _group-name="parts"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/part"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/parts"
                max-occurs="unbounded"
                min-occurs="0"
                ref="part"
                _key-ref="oscal-catalog-common:part"
                _using-name="part"
                _in-xml-name="part"
                _in-json-name="parts"&gt;
         &lt;group-as name="parts" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/link"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="label"&gt;A human-readable label for the parent context.&lt;/enum&gt;
         &lt;enum value="sort-id"&gt;An alternative identifier, whose value is easily sortable among other such values in the document.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;require when="@name='assessment'"&gt;
         &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
            &lt;enum value="method"&gt;The assessment method to use. This typically appears on parts with the name "assessment".&lt;/enum&gt;
         &lt;/allowed-values&gt;
         &lt;has-cardinality target="prop[@name='method']" min-occurs="1"/&gt;
         &lt;allowed-values target="prop[@name='method']/@value"&gt;
            &lt;enum value="INTERVIEW"&gt;The process of holding discussions with individuals or groups of individuals within an organization to once again, facilitate assessor understanding, achieve clarification, or obtain evidence.&lt;/enum&gt;
            &lt;enum value="EXAMINE"&gt;The process of reviewing, inspecting, observing, studying, or analyzing one or more assessment objects (i.e., specifications, mechanisms, or activities).&lt;/enum&gt;
            &lt;enum value="TEST"&gt;The process of exercising one or more assessment objects (i.e., activities or mechanisms) under specified conditions to compare actual with expected behavior.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/require&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;A &lt;code&gt;part&lt;/code&gt; provides for logical partitioning of prose, and can be thought of as a grouping structure (e.g., section). A &lt;code&gt;part&lt;/code&gt; can have child parts allowing for arbitrary nesting of prose content (e.g., statement hierarchy). A &lt;code&gt;part&lt;/code&gt; can contain &lt;code&gt;prop&lt;/code&gt; objects that allow for enriching prose text with structured name/value information.&lt;/p&gt;
      &lt;p&gt;A &lt;code&gt;part&lt;/code&gt; can be assigned an optional &lt;code&gt;id&lt;/code&gt;, which allows for internal and external references to the textual concept contained within a &lt;code&gt;part&lt;/code&gt;. A &lt;code&gt;id&lt;/code&gt; provides a means for an OSCAL profile, or a higher layer OSCAL model to reference a specific part within a &lt;code&gt;catalog&lt;/code&gt;. For example, an &lt;code&gt;id&lt;/code&gt; can be used to reference or to make modifications to a control statement in a profile.&lt;/p&gt;
      &lt;p&gt;Use of &lt;code&gt;part&lt;/code&gt; and &lt;code&gt;prop&lt;/code&gt; provides for a wide degree of extensibility within the OSCAL catalog model. The optional &lt;code&gt;ns&lt;/code&gt; provides a means to qualify a part's &lt;code&gt;name&lt;/code&gt;, allowing for organization-specific vocabularies to be defined with clear semantics. Any organization that extends OSCAL in this way should consistently assign a &lt;code&gt;ns&lt;/code&gt; value that represents the organization, making a given namespace qualified &lt;code&gt;name&lt;/code&gt; unique to that organization. This allows the combination of &lt;code&gt;ns&lt;/code&gt; and &lt;code&gt;name&lt;/code&gt; to always be unique and unambiguous, even when mixed with extensions from other organizations. Each organization is responsible for governance of their own extensions, and is strongly encouraged to publish their extensions as standards to their user community. If no &lt;code&gt;ns&lt;/code&gt; is provided, the name is expected to be in the "OSCAL" namespace.&lt;/p&gt;
      &lt;p&gt;To ensure a &lt;code&gt;ns&lt;/code&gt; is unique to an organization and naming conflicts are avoided, a URI containing a DNS or other globally defined organization name should be used. For example, if FedRAMP and DoD both extend OSCAL, FedRAMP will use the &lt;code&gt;ns&lt;/code&gt; "https://fedramp.gov", while DoD will use the &lt;code&gt;ns&lt;/code&gt; "https://defense.gov" for any organization specific &lt;code&gt;name&lt;/code&gt;. &lt;/p&gt;
      &lt;p&gt;Tools that process OSCAL content are not required to interpret unrecognized OSCAL extensions; however, OSCAL compliant tools should not modify or remove unrecognized extensions, unless there is a compelling reason to do so, such as data sensitivity.&lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;description&gt;Multiple Parts with Different Organization-Specific Names&lt;/description&gt;
      &lt;part xmlns="http://csrc.nist.gov/ns/oscal/1.0"
            name="statement"
            id="statement-A"&gt;
         &lt;part ns="https://fedramp.gov" name="status" id="statement-A-FedRAMP"&gt;Something FedRAMP Cares About&lt;/part&gt;
         &lt;part ns="https://defense.gov" name="status" id="statement-A-DoD"&gt;Something DoD Cares About&lt;/part&gt;
      &lt;/part&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/parameter" class="toc1 head">Assembly
         <code>parameter</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Parameter</p>
      <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
      <p class="use-name"><span class="lbl">use-name</span>param</p>
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
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/parameter/id">Flag (defined inline) <code>id</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/class">Flag (defined inline) <code>class</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/depends-on">Flag (reference) <code>depends-on</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/label">Field (defined inline) <code>label</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/usage">Field (defined inline) <code>usage</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/constraint">Assembly (reference) <code>parameter-constraint</code> - using name <code>constraint</code> - grouped as <code>constraints</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/guideline">Assembly (reference) <code>parameter-guideline</code> - using name <code>guideline</code> - grouped as <code>guidelines</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/value">Field (reference) <code>parameter-value</code> - using name <code>value</code> - grouped as <code>values</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/select">Assembly (reference) <code>parameter-selection</code> - using name <code>select</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/parameter"
                 _metaschema-json-id="/assembly/oscal-catalog-common/parameter"
                 scope="global"
                 name="parameter"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:parameter"&gt;
   &lt;formal-name&gt;Parameter&lt;/formal-name&gt;
   &lt;description&gt;Parameters provide a mechanism for the dynamic assignment of value(s) in a control.&lt;/description&gt;
   &lt;use-name&gt;param&lt;/use-name&gt;
   &lt;define-flag _step="id"
                _key="id"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/id"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/id"
                required="yes"
                as-type="NCName"
                name="id"
                _using-name="id"
                _in-xml-name="id"
                _in-json-name="id"&gt;
      &lt;formal-name&gt;Parameter Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier for a specific parameter instance. This identifier's uniqueness is document scoped and is intended to be consistent for the same parameter across minor revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="class"
                _key="class"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/class"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/class"
                required="no"
                as-type="NCName"
                name="class"
                _using-name="class"
                _in-xml-name="class"
                _in-json-name="class"&gt;
      &lt;formal-name&gt;Parameter Class&lt;/formal-name&gt;
      &lt;description&gt;A textual label that provides a characterization of the parameter.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can be used in validation rules to express extra constraints over named items of a specific &lt;code&gt;class&lt;/code&gt; value.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;flag _step="depends-on"
         _key="depends-on"
         _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/depends-on"
         _metaschema-json-id="/assembly/oscal-catalog-common/parameter/depends-on"
         as-type="NCName"
         required="no"
         ref="depends-on"
         _key-ref="oscal-catalog-common:depends-on"
         _using-name="depends-on"
         _in-xml-name="depends-on"
         _in-json-name="depends-on"/&gt;
   &lt;model&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/prop"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/link"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-field _step="label"
                    _key="label"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/label"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter/label"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="label"
                    _using-name="label"
                    _in-xml-name="label"
                    _in-json-name="label"&gt;
         &lt;formal-name&gt;Parameter Label&lt;/formal-name&gt;
         &lt;description&gt;A short, placeholder name for the parameter, which can be used as a substitute for a &lt;code&gt;value&lt;/code&gt; if no value is assigned.&lt;/description&gt;
         &lt;remarks&gt;
            &lt;p&gt;The label value should be suitable for inline display in a rendered catalog.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="usage"
                    _key="usage"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/usage"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter/usage"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="usage"
                    _using-name="usage"
                    _in-xml-name="usage"
                    _in-json-name="usage"&gt;
         &lt;formal-name&gt;Parameter Usage Description&lt;/formal-name&gt;
         &lt;description&gt;Describes the purpose and use of a parameter&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="constraint"
                _key="constraints"
                _group-name="constraints"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/constraint"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/constraints"
                max-occurs="unbounded"
                min-occurs="0"
                ref="parameter-constraint"
                _key-ref="oscal-catalog-common:parameter-constraint"
                _using-name="constraint"
                _in-xml-name="constraint"
                _in-json-name="constraints"&gt;
         &lt;use-name&gt;constraint&lt;/use-name&gt;
         &lt;group-as name="constraints" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="guideline"
                _key="guidelines"
                _group-name="guidelines"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/guideline"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/guidelines"
                max-occurs="unbounded"
                min-occurs="0"
                ref="parameter-guideline"
                _key-ref="oscal-catalog-common:parameter-guideline"
                _using-name="guideline"
                _in-xml-name="guideline"
                _in-json-name="guidelines"&gt;
         &lt;use-name&gt;guideline&lt;/use-name&gt;
         &lt;group-as name="guidelines" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;choice&gt;
         &lt;field _step="value"
                _key="values"
                _group-name="values"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/value"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/values"
                max-occurs="unbounded"
                min-occurs="0"
                ref="parameter-value"
                _key-ref="oscal-catalog-common:parameter-value"
                _using-name="value"
                _in-xml-name="value"
                _in-json-name="values"&gt;
            &lt;use-name&gt;value&lt;/use-name&gt;
            &lt;group-as name="values" in-json="ARRAY"/&gt;
            &lt;remarks&gt;
               &lt;p&gt;A set of values provided in a catalog can be redefined at any higher layer of OSCAL (e.g., Profile).&lt;/p&gt;
            &lt;/remarks&gt;
         &lt;/field&gt;
         &lt;assembly _step="select"
                   _key="select"
                   _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/select"
                   _metaschema-json-id="/assembly/oscal-catalog-common/parameter/select"
                   max-occurs="1"
                   min-occurs="0"
                   ref="parameter-selection"
                   _key-ref="oscal-catalog-common:parameter-selection"
                   _using-name="select"
                   _in-xml-name="select"
                   _in-json-name="select"&gt;
            &lt;use-name&gt;select&lt;/use-name&gt;
            &lt;remarks&gt;
               &lt;p&gt;A set of parameter value choices, that may be picked from to set the parameter value.&lt;/p&gt;
            &lt;/remarks&gt;
         &lt;/assembly&gt;
      &lt;/choice&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/remarks"
             _metaschema-json-id="/assembly/oscal-catalog-common/parameter/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;In a catalog, a parameter is typically used as a placeholder for the future assignment of a parameter value, although the OSCAL model allows for the direct assignment of a value if desired by the control author. The &lt;code&gt;value&lt;/code&gt; may be optionally used to specify one or more values. If no value is provided, then it is expected that the value will be provided at the Profile or Implementation layer.&lt;/p&gt;
      &lt;p&gt;A parameter can include a variety of metadata options that support the future solicitation of one or more values. A &lt;code&gt;label&lt;/code&gt; provides a textual placeholder that can be used in a tool to solicit parameter value input, or to display in catalog documentation. The &lt;code&gt;desc&lt;/code&gt; provides a short description of what the parameter is used for, which can be used in tooling to help a user understand how to use the parameter. A &lt;code&gt;constraint&lt;/code&gt; can be used to provide criteria for the allowed values. A &lt;code&gt;guideline&lt;/code&gt; provides a recommendation for the use of a parameter.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/parameter-constraint" class="toc1 head">Assembly
         <code>parameter-constraint</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Constraint</p>
      <p class="description">A formal or informal expression of a constraint or test</p>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/parameter-constraint/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-catalog-common/parameter-constraint/test">Assembly (defined inline) <code>test</code> - grouped as <code>tests</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint"
                 _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint"
                 scope="global"
                 name="parameter-constraint"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:parameter-constraint"&gt;
   &lt;formal-name&gt;Constraint&lt;/formal-name&gt;
   &lt;description&gt;A formal or informal expression of a constraint or test&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint/description"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint/description"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Constraint Description&lt;/formal-name&gt;
         &lt;description&gt;A textual summary of the constraint to be applied.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-assembly _step="test"
                       _key="tests"
                       _group-name="tests"
                       _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint/test"
                       _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint/tests"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="test"
                       _using-name="test"
                       _in-xml-name="test"
                       _in-json-name="tests"&gt;
         &lt;formal-name&gt;Constraint Test&lt;/formal-name&gt;
         &lt;description&gt;A test expression which is expected to be evaluated by a tool.&lt;/description&gt;
         &lt;group-as name="tests" in-json="ARRAY"/&gt;
         &lt;model&gt;
            &lt;define-field _step="expression"
                          _key="expression"
                          _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint/test/expression"
                          _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint/tests/expression"
                          max-occurs="1"
                          min-occurs="1"
                          collapsible="no"
                          as-type="string"
                          name="expression"
                          _using-name="expression"
                          _in-xml-name="expression"
                          _in-json-name="expression"&gt;
               &lt;formal-name&gt;Constraint test&lt;/formal-name&gt;
               &lt;description&gt;A formal (executable) expression of a constraint&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint/test/remarks"
                   _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint/tests/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
      &lt;/define-assembly&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/parameter-guideline" class="toc1 head">Assembly
         <code>parameter-guideline</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Guideline</p>
      <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/parameter-guideline/p ul ol pre table h1 h2 h3 h4 h5 h6">Field (defined inline) <code>prose</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline"
                 _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline"
                 scope="global"
                 name="parameter-guideline"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:parameter-guideline"&gt;
   &lt;formal-name&gt;Guideline&lt;/formal-name&gt;
   &lt;description&gt;A prose statement that provides a recommendation for the use of a parameter.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _key="prose"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline/p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline/prose"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="UNWRAPPED"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="prose"
                    _using-name="prose"
                    _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _in-json-name="prose"&gt;
         &lt;formal-name&gt;Guideline Text&lt;/formal-name&gt;
         &lt;description&gt;Prose permits multiple paragraphs, lists, tables etc.&lt;/description&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-catalog-common/parameter-value" class="toc1 head">Field <code>parameter-value</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Parameter Value</p>
      <p class="description">A parameter value or set of values.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-catalog-common/parameter-value"
              _metaschema-json-id="/field/oscal-catalog-common/parameter-value"
              collapsible="no"
              as-type="string"
              scope="global"
              name="parameter-value"
              module="oscal-catalog-common"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
              _key-name="oscal-catalog-common:parameter-value"&gt;
   &lt;formal-name&gt;Parameter Value&lt;/formal-name&gt;
   &lt;description&gt;A parameter value or set of values.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/parameter-selection" class="toc1 head">Assembly
         <code>parameter-selection</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Selection</p>
      <p class="description">Presenting a choice among alternatives</p>
      <div class="remarks">
         <p class="p">A set of parameter value choices, that may be picked from to set the parameter value.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/parameter-selection/how-many">Flag (defined inline) <code>how-many</code></li>
         <li id="/assembly/oscal-catalog-common/parameter-selection/choice">Field (defined inline) <code>parameter-choice</code> - using name <code>choice</code> - grouped as <code>choice</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-selection"
                 _metaschema-json-id="/assembly/oscal-catalog-common/parameter-selection"
                 scope="global"
                 name="parameter-selection"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:parameter-selection"&gt;
   &lt;formal-name&gt;Selection&lt;/formal-name&gt;
   &lt;description&gt;Presenting a choice among alternatives&lt;/description&gt;
   &lt;define-flag _step="how-many"
                _key="how-many"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-selection/how-many"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter-selection/how-many"
                required="no"
                as-type="string"
                name="how-many"
                _using-name="how-many"
                _in-xml-name="how-many"
                _in-json-name="how-many"&gt;
      &lt;formal-name&gt;Parameter Cardinality&lt;/formal-name&gt;
      &lt;description&gt;Describes the number of selections that must occur.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="choice"
                    _key="choice"
                    _group-name="choice"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-selection/choice"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter-selection/choice"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="parameter-choice"
                    _using-name="choice"
                    _in-xml-name="choice"
                    _in-json-name="choice"&gt;
         &lt;formal-name&gt;Choice&lt;/formal-name&gt;
         &lt;description&gt;A value selection among several such options&lt;/description&gt;
         &lt;use-name&gt;choice&lt;/use-name&gt;
         &lt;json-value-key&gt;value&lt;/json-value-key&gt;
         &lt;group-as name="choice" in-json="ARRAY"/&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;A set of parameter value choices, that may be picked from to set the parameter value.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-catalog-common/depends-on" class="toc1 head">Flag <code>depends-on</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Depends on</p>
      <p class="description">Another parameter invoking this one</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-catalog-common/depends-on"
             _metaschema-json-id="/flag/oscal-catalog-common/depends-on"
             as-type="NCName"
             scope="global"
             name="depends-on"
             module="oscal-catalog-common"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
             _key-name="oscal-catalog-common:depends-on"&gt;
   &lt;formal-name&gt;Depends on&lt;/formal-name&gt;
   &lt;description&gt;Another parameter invoking this one&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-catalog-common/control-id" class="toc1 head">Flag <code>control-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Control Identifier Reference</p>
      <p class="description">A reference to a control with a corresponding <code>id</code> value.</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-catalog-common/control-id"
             _metaschema-json-id="/flag/oscal-catalog-common/control-id"
             as-type="NCName"
             scope="global"
             name="control-id"
             module="oscal-catalog-common"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
             _key-name="oscal-catalog-common:control-id"&gt;
   &lt;formal-name&gt;Control Identifier Reference&lt;/formal-name&gt;
   &lt;description&gt;A reference to a control with a corresponding &lt;code&gt;id&lt;/code&gt; value.&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
</div>