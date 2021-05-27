---
title: "Profile Model JSON Format Reference"
heading: "OSCAL Profile Model JSON Format Reference"
description: A reference for the OSCAL Profile model JSON format.
weight: 20
sidenav:
  title: JSON Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
aliases:
  - /docs/schemas/oscal-profile-json/
  - /documentation/schema/profile/json-schema/
  - /documentation/schema/profile-layer/profile/json-schema/
---

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml" class="json-reference">
   <p><span class="usa-tag">Schema version:</span> 1.0.0-rc2</p>
   <section class="json-obj">
      <div class="header">
         <div>
            <h1 id="/profile" class="toc1 head">profile</h1>ProfileEach OSCAL profile is defined by a Profile elementCatalog Universally Unique
            IdentifierA globally unique identifier for this profile instance. This UUID should
            be changed when this document is revised.Publication metadataProvides information
            about the publication and availability of the containing document.Document TitleA
            name given to the document, which may be used by a tool for display and navigation.Publication
            TimestampThe date and time the document was published. The date-time value must be
            formatted according to RFC 3339 with full time and time zone included.This value represents
            the point in time when the OSCAL document was published. Typically, this date value
            will be machine generated at the time the containing document is published.In some
            cases, an OSCAL document may be derived from some source material in a different format.
            In such a case, the published value should indicate when the OSCAL document was published,
            not the source material. Where necessary, the publication date of the original source
            material can be captured as a named property or custom metadata construct.A publisher
            of OSCAL content can use this data point along with its siblings last-modified and
            version to establish a sequence of successive revisions of a given OSCAL-based publication.
            The metadata for previous revisions can be represented as a revision in this object.Last
            Modified TimestampThe date and time the document was last modified. The date-time
            value must be formatted according to RFC 3339 with full time and time zone included.This
            value represents the point in time when the OSCAL document was last updated, or at
            the point of creation the creation date. Typically, this date value will be machine
            generated at time of creation or modification.In some cases, an OSCAL document may
            be derived from some source material in a different format. In such a case, the last-modified
            value should indicate the modification time of the OSCAL document, not the source
            material.A publisher of OSCAL content can use this data point along with its siblings
            published and version to establish a sequence of successive revisions of a given OSCAL-based
            publication. The metadata for previous revisions can be represented as a revision
            in this object.Document VersionA string used to distinguish the current version of
            the document from other previous (and future) versions.A version string may be a release
            number, sequence number, date, or other identifier suffcient to distinguish between
            different document versions. This version is typically set by the document owner or
            by the tool used to maintain the content.While not required, it is recommended that
            OSCAL content authors use Semantic Versioning as a format for version strings. This
            allows for the easy identification of a version tree consisting of major, minor, and
            patch numbers.A publisher of OSCAL content can use this data point along with its
            siblings published and last-modified to establish a sequence of successive revisions
            of a given OSCAL-based publication. The metadata for previous revisions can be represented
            as a revision in this object.OSCAL versionThe OSCAL model version the document was
            authored against.Indicates the version of the OSCAL model to which this data set conforms,
            for example 1.1.0 or 1.0.0-M1. That can be used as a hint by a tool to indicate which
            version of the OSCAL XML or JSON schema to use for validation.
            <p>An array of Revision History Entry objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Revision History Entry</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>revisions</code>.</p>
                  <p class="path">/profile/metadata/revisions</p>
               </div>
               <p class="description">An entry in a sequential list of revisions to the containing document in reverse chronological
                  order (i.e., most recent previous revision first).</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>While <code>published</code>, <code>last-modified</code>, <code>oscal-version</code>, and <code>version</code> are not required, values for these entries should be provided if the information
                        is known. For a revision entry to be considered valid, at least one of the following
                        items must be provided: <code>published</code>, <code>last-modified</code>, <code>version</code>, or a <code>link</code> with a <code>rel</code> of <q>source</q>.</p>
                  </div>
               </details>
            </div>
            <p>An array of Document Identifier objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Document Identifier</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An object of type <a href="link.to.string">string</a> member of array <code>document-ids</code>.</p>
                  <p class="path">/profile/metadata/document-ids</p>
               </div>
               <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
                  that are to be treated as different versions of the same document. If this element
                  does not appear, or if the value of this element is empty, the value of "document-id"
                  is equal to the value of the "uuid" flag of the top-level root element.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>This element is optional, but it will always have a valid value, as if it is missing
                        the value of "document-id" is assumed to be equal to the UUID of the root. This requirement
                        allows for document creators to retroactively link an update to the original version,
                        by providing a document-id on the new document that is equal to the uuid of the original
                        document.</p>
                  </div>
               </details>
            </div>
            <p>An array of Property objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Property</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>props</code>.</p>
                  <p class="path">/profile/metadata/props</p>
               </div>
               <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                  qualified name/value pair. The value of a property is a simple scalar value, which
                  may be expressed as a list of values.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Properties permit the deployment and management of arbitrary controlled values, within
                        OSCAL objects. A property can be included for any purpose useful to an application
                        or implementation. Typically, properties will be used to sort, filter, select, order,
                        and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                        an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                        lexical composition of properties may be constrained by external processes to ensure
                        consistency.</p>
                     <p>Property allows for associated remarks that describe why the specific property value
                        was applied to the containing object, or the significance of the value in the context
                        of the containing object.</p>
                  </div>
               </details>
            </div>
            <p>An array of Link objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Link</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>links</code>.</p>
                  <p class="path">/profile/metadata/links</p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To provide a cryptographic hash for a remote target resource, a local reference to
                        a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                     <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                  </div>
               </details>
            </div>
            <p>An array of Role objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Role</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>roles</code>.</p>
                  <p class="path">/profile/metadata/roles</p>
               </div>
               <p class="description">Defines a function assumed or expected to be assumed by a party in a specific situation.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Permissible values to be determined closer to the application (e.g. by a receiving
                        authority).</p>
                  </div>
               </details>
            </div>
            <p>An array of Location objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Location</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>locations</code>.</p>
                  <p class="path">/profile/metadata/locations</p>
               </div>
               <p class="description">A location, with associated metadata that can be referenced.</p>
            </div>
            <p>An array of Party (organization or person) objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Party (organization or person)</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>parties</code>.</p>
                  <p class="path">/profile/metadata/parties</p>
               </div>
               <p class="description">A responsible entity which is either a person or an organization.</p>
            </div>
            <p>An array of Responsible Party objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Responsible Party</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>responsible-parties</code>.</p>
                  <p class="path">/profile/metadata/responsible-parties</p>
               </div>
               <p class="description">A reference to a set of organizations or persons that have responsibility for performing
                  a referenced role in the context of the containing object.</p>
            </div>RemarksAdditional commentary on the containing object.
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            Since responsible-party associates multiple party-uuid entries with a single role-id,
            each role-id must be referenced only once.
            
            
            Indicates the organization that created this content.
            Indicates the organization for which this content was created.
            Indicates the organization responsible for all content represented in the "document".
            
            
            The link identifies the authoritative location for this file. Defined by RFC 6596.
            The link identifies an alternative location or format for this file. Defined by the
            HTML Living Standard
            This link identifies a resource containing the latest version in the version history.
            Defined by RFC 5829.
            This link identifies a resource containing the predecessor version in the version
            history. Defined by  RFC 5829.
            This link identifies a resource containing the predecessor version in the version
            history. Defined by RFC 5829.
            
            
            <p>An array of Import resource objects</p>
            <p class="occurrence"><span class="cardinality">[1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Import resource</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>imports</code>.</p>
                  <p class="path">/profile/imports</p>
               </div>
               <p class="description">The <code>import</code> designates a catalog, profile, or other resource to be included (referenced and potentially
                  modified) by this profile. The import also identifies which controls to select using
                  the <code>include-all</code>, <code>include-controls</code>, and <code>exclude-controls</code> directives.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A profile must be based on an existing OSCAL catalog or another OSCAL profile. An
                        <code>import</code> indicates such a source whose controls are to be included (referenced and modified)
                        in a profile. This source will either be a catalog whose controls are given (<q>by value</q>), or a profile with its own control imports.</p>
                     <p>The contents of the <code>import</code> element indicate which controls from the source will be included. Controls from the
                        source catalog or profile may be either selected, using the <code>include-all</code> or <code>include-controls</code> directives, or de-selected (using an <code>exclude-controls</code> directive).</p>
                  </div>
               </details>
            </div>Merge controlsA Merge element merges controls in resolution.Combination ruleA Combine
            element defines whether and how to combine multiple (competing) versions of the same
            controlCombination methodHow clashing controls should be handled
            
            Use the first definition - the first control with a given ID is used; subsequent ones
            are discarded
            Merge - controls with the same ID are combined
            Keep - controls with the same ID are kept, retaining the clash
            
            Whenever combining controls from multiple (import) pathways, an issue arises of what
            to do with clashing invocations (multiple competing versions of a control). This setting
            permits a profile designer to apply a rule for the resolution of such cases. In a
            well-designed profile, such collisions would ordinarily be avoided, but this setting
            can be useful for defining what to do when it occurs.As isAn As-is element indicates
            that the controls should be structured in resolution as they are structured in their
            source catalogs. It does not contain any elements or attributes.Custom groupingA Custom
            element frames a structure for embedding represented controls in resolution.
            <p>An array of Control group objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Control group</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>groups</code>.</p>
                  <p class="path">/profile/merge/custom/groups</p>
               </div>
               <p class="description">A group of (selected) controls or of groups of controls</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>This construct mirrors the same construct that exists in an OSCAL catalog.</p>
                  </div>
               </details>
            </div>
            <p>An array of Select controls objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Select controls</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>insert-controls</code>.</p>
                  <p class="path">/profile/merge/custom/insert-controls</p>
               </div>
               <p class="description">Specifies which controls to use in the containing context.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To be schema-valid, this element must contain either (but not both) a single <code>include-all</code> directive, or a sequence of <code>include-controls</code> directives.</p>
                     <p>If this directive is not provided, then no controls are to be inserted; i.e., all
                        controls are included explicitly.</p>
                  </div>
               </details>
            </div>The custom element represents a custom arrangement or organization of controls in
            the resolution of a catalog.While the as-is element provides for a restitution of
            a control set's organization (in one or more source catalogs), this element permits
            the definition of an entirely different structure.The contents of the merge element
            may be used to reorder or restructure controls by indicating an order and/or structure
            in resolution.Implicitly, a merge element is also a filter: controls that are included
            in a profile, but not included (implicitly or explicitly) in the scope of a merge
            element, will not be merged into (will be dropped) in the resulting resolution.Modify
            controlsSet parameters or amend controls in resolution
            <p>An array of Parameter Setting objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Parameter Setting</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>set-parameters</code>.</p>
                  <p class="path">/profile/modify/set-parameters</p>
               </div>
               <p class="description">A parameter setting, to be propagated to points of insertion</p>
            </div>
            <p>An array of Alteration objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Alteration</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>alters</code>.</p>
                  <p class="path">/profile/modify/alters</p>
               </div>
               <p class="description">An Alter element specifies changes to be made to an included control when a profile
                  is resolved.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Use <code>@control-id</code> to indicate the scope of alteration.</p>
                     <p>It is an error for two <code>alter</code> elements to apply to the same control. In practice, multiple alterations can be applied
                        (together), but it creates confusion.</p>
                     <p>At present, no provision is made for altering many controls at once (for example,
                        to systematically remove properties or add global properties); extending this element
                        to match multiple control IDs could provide for this.</p>
                  </div>
               </details>
            </div>Back matterA collection of resources, which may be included directly or by reference.
            <p>An array of Resource objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Resource</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>resources</code>.</p>
                  <p class="path">/profile/back-matter/resources</p>
               </div>
               <p class="description">A resource associated with content in the containing document. A resource may be directly
                  included in the document base64 encoded or may point to one or more equivalent internet
                  resources.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                        resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                        for the same resource. Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                        the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                        This allows the document consumer to choose a preferred item to process based on a
                        the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                        in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                        from any of the available formats indicated by the items.</p>
                     <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                  </div>
                  <div class="remarks">
                     <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                        resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                        for the same resource. Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                        the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                        This allows the document consumer to choose a preferred item to process based on a
                        the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                        in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                        from any of the available formats indicated by the items.</p>
                     <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                  </div>
               </details>
            </div>
            
            
            
            Provides a collection of identified resource objects that can be referenced by a link
            with a rel value of "reference" and an href value that is a fragment "#" followed
            by a reference to a reference identifier. Other specialized link "rel" values also
            use this pattern when indicated in that context of use.An OSCAL document that describes
            a tailoring of controls from one or more catalogs, with possible modification of multiple
            controls. It provides mechanisms by which controls may be selected (import), merged
            or (re)structured (merge), and amended (modify). OSCAL profiles may select subsets
            of controls, set parameter values for them in application, and even adjust the representation
            of controls as given in and by a catalog. They may also serve as sources for further
            modification in and by other profiles, that import them.An OSCAL document that describes
            a tailoring of controls from one or more catalogs, with possible modification of multiple
            controls. It provides mechanisms by which controls may be selected (import), merged
            or (re)structured (merge), and amended (modify). OSCAL profiles may select subsets
            of controls, set parameter values for them in application, and even adjust the representation
            of controls as given in and by a catalog. They may also serve as sources for further
            modification in and by other profiles, that import them.
            <div class="crosslink"><a href="../xml-reference/#/profile"><button class="schema-link">Switch to XML</button></a></div>
         </div>
      </div>
      <p>See <a href="../json-outline/#/profile">/profile</a> in the object map.</p>
      <div class="obj-desc">
         <div class="obj-matrix">
            <p class="obj-name">object Profile</p>
            <p class="occurrence"><span class="cardinality">[1]</span></p>
            <p>An object  with key <code>profile</code>.</p>
            <p class="path">/profile</p>
         </div>
         <p class="description">Each OSCAL profile is defined by a Profile element</p>
         <details open="open" class="remarks-group">
            <summary>Remarks</summary>
            <div class="remarks">
               <p>An OSCAL document that describes a tailoring of controls from one or more catalogs,
                  with possible modification of multiple controls. It provides mechanisms by which controls
                  may be selected (<code>import</code>), merged or (re)structured (<code>merge</code>), and amended (<code>modify</code>). OSCAL profiles may select subsets of controls, set parameter values for them in
                  application, and even adjust the representation of controls as given in and by a catalog.
                  They may also serve as sources for further modification in and by other profiles,
                  that import them.</p>
            </div>
            <div class="remarks">
               <p>An OSCAL document that describes a tailoring of controls from one or more catalogs,
                  with possible modification of multiple controls. It provides mechanisms by which controls
                  may be selected (<code>import</code>), merged or (re)structured (<code>merge</code>), and amended (<code>modify</code>). OSCAL profiles may select subsets of controls, set parameter values for them in
                  application, and even adjust the representation of controls as given in and by a catalog.
                  They may also serve as sources for further modification in and by other profiles,
                  that import them.</p>
            </div>
         </details>
      </div>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/profile/uuid" class="toc2 head">uuid</h2>Catalog Universally Unique IdentifierA globally unique identifier for this profile
               instance. This UUID should be changed when this document is revised.
               <div class="crosslink"><a href="../xml-reference/#/profile/@uuid"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/profile/uuid">/profile/uuid</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">string Catalog Universally Unique Identifier</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
               <p class="path">/profile/uuid</p>
            </div>
            <p class="description">A globally unique identifier for this profile instance. This UUID should be changed
               when this document is revised.</p>
         </div>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/profile/metadata" class="toc2 head">metadata</h2>Publication metadataProvides information about the publication and availability of
               the containing document.Document TitleA name given to the document, which may be used
               by a tool for display and navigation.Publication TimestampThe date and time the document
               was published. The date-time value must be formatted according to RFC 3339 with full
               time and time zone included.This value represents the point in time when the OSCAL
               document was published. Typically, this date value will be machine generated at the
               time the containing document is published.In some cases, an OSCAL document may be
               derived from some source material in a different format. In such a case, the published
               value should indicate when the OSCAL document was published, not the source material.
               Where necessary, the publication date of the original source material can be captured
               as a named property or custom metadata construct.A publisher of OSCAL content can
               use this data point along with its siblings last-modified and version to establish
               a sequence of successive revisions of a given OSCAL-based publication. The metadata
               for previous revisions can be represented as a revision in this object.Last Modified
               TimestampThe date and time the document was last modified. The date-time value must
               be formatted according to RFC 3339 with full time and time zone included.This value
               represents the point in time when the OSCAL document was last updated, or at the point
               of creation the creation date. Typically, this date value will be machine generated
               at time of creation or modification.In some cases, an OSCAL document may be derived
               from some source material in a different format. In such a case, the last-modified
               value should indicate the modification time of the OSCAL document, not the source
               material.A publisher of OSCAL content can use this data point along with its siblings
               published and version to establish a sequence of successive revisions of a given OSCAL-based
               publication. The metadata for previous revisions can be represented as a revision
               in this object.Document VersionA string used to distinguish the current version of
               the document from other previous (and future) versions.A version string may be a release
               number, sequence number, date, or other identifier suffcient to distinguish between
               different document versions. This version is typically set by the document owner or
               by the tool used to maintain the content.While not required, it is recommended that
               OSCAL content authors use Semantic Versioning as a format for version strings. This
               allows for the easy identification of a version tree consisting of major, minor, and
               patch numbers.A publisher of OSCAL content can use this data point along with its
               siblings published and last-modified to establish a sequence of successive revisions
               of a given OSCAL-based publication. The metadata for previous revisions can be represented
               as a revision in this object.OSCAL versionThe OSCAL model version the document was
               authored against.Indicates the version of the OSCAL model to which this data set conforms,
               for example 1.1.0 or 1.0.0-M1. That can be used as a hint by a tool to indicate which
               version of the OSCAL XML or JSON schema to use for validation.
               <p>An array of Revision History Entry objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Revision History Entry</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>revisions</code>.</p>
                     <p class="path">/profile/metadata/revisions</p>
                  </div>
                  <p class="description">An entry in a sequential list of revisions to the containing document in reverse chronological
                     order (i.e., most recent previous revision first).</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>While <code>published</code>, <code>last-modified</code>, <code>oscal-version</code>, and <code>version</code> are not required, values for these entries should be provided if the information
                           is known. For a revision entry to be considered valid, at least one of the following
                           items must be provided: <code>published</code>, <code>last-modified</code>, <code>version</code>, or a <code>link</code> with a <code>rel</code> of <q>source</q>.</p>
                     </div>
                  </details>
               </div>
               <p>An array of Document Identifier objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Document Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An object of type <a href="link.to.string">string</a> member of array <code>document-ids</code>.</p>
                     <p class="path">/profile/metadata/document-ids</p>
                  </div>
                  <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
                     that are to be treated as different versions of the same document. If this element
                     does not appear, or if the value of this element is empty, the value of "document-id"
                     is equal to the value of the "uuid" flag of the top-level root element.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>This element is optional, but it will always have a valid value, as if it is missing
                           the value of "document-id" is assumed to be equal to the UUID of the root. This requirement
                           allows for document creators to retroactively link an update to the original version,
                           by providing a document-id on the new document that is equal to the uuid of the original
                           document.</p>
                     </div>
                  </details>
               </div>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/profile/metadata/props</p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Properties permit the deployment and management of arbitrary controlled values, within
                           OSCAL objects. A property can be included for any purpose useful to an application
                           or implementation. Typically, properties will be used to sort, filter, select, order,
                           and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                           an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                           lexical composition of properties may be constrained by external processes to ensure
                           consistency.</p>
                        <p>Property allows for associated remarks that describe why the specific property value
                           was applied to the containing object, or the significance of the value in the context
                           of the containing object.</p>
                     </div>
                  </details>
               </div>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/profile/metadata/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <p>An array of Role objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Role</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>roles</code>.</p>
                     <p class="path">/profile/metadata/roles</p>
                  </div>
                  <p class="description">Defines a function assumed or expected to be assumed by a party in a specific situation.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Permissible values to be determined closer to the application (e.g. by a receiving
                           authority).</p>
                     </div>
                  </details>
               </div>
               <p>An array of Location objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Location</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>locations</code>.</p>
                     <p class="path">/profile/metadata/locations</p>
                  </div>
                  <p class="description">A location, with associated metadata that can be referenced.</p>
               </div>
               <p>An array of Party (organization or person) objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Party (organization or person)</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>parties</code>.</p>
                     <p class="path">/profile/metadata/parties</p>
                  </div>
                  <p class="description">A responsible entity which is either a person or an organization.</p>
               </div>
               <p>An array of Responsible Party objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Responsible Party</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>responsible-parties</code>.</p>
                     <p class="path">/profile/metadata/responsible-parties</p>
                  </div>
                  <p class="description">A reference to a set of organizations or persons that have responsibility for performing
                     a referenced role in the context of the containing object.</p>
               </div>RemarksAdditional commentary on the containing object.
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               Since responsible-party associates multiple party-uuid entries with a single role-id,
               each role-id must be referenced only once.
               
               
               Indicates the organization that created this content.
               Indicates the organization for which this content was created.
               Indicates the organization responsible for all content represented in the "document".
               
               
               The link identifies the authoritative location for this file. Defined by RFC 6596.
               The link identifies an alternative location or format for this file. Defined by the
               HTML Living Standard
               This link identifies a resource containing the latest version in the version history.
               Defined by RFC 5829.
               This link identifies a resource containing the predecessor version in the version
               history. Defined by  RFC 5829.
               This link identifies a resource containing the predecessor version in the version
               history. Defined by RFC 5829.
               
               
               <div class="crosslink"><a href="../xml-reference/#/profile/metadata"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/profile/metadata">/profile/metadata</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Publication metadata</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An object  with key <code>metadata</code>.</p>
               <p class="path">/profile/metadata</p>
            </div>
            <p class="description">Provides information about the publication and availability of the containing document.</p>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/title" class="toc3 head">title</h3>Document TitleA name given to the document, which may be used by a tool for display
                  and navigation.
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/title"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/title">/profile/metadata/title</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Document Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                  <p class="path">/profile/metadata/title</p>
               </div>
               <p class="description">A name given to the document, which may be used by a tool for display and navigation.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/published" class="toc3 head">published</h3>Publication TimestampThe date and time the document was published. The date-time value
                  must be formatted according to RFC 3339 with full time and time zone included.This
                  value represents the point in time when the OSCAL document was published. Typically,
                  this date value will be machine generated at the time the containing document is published.In
                  some cases, an OSCAL document may be derived from some source material in a different
                  format. In such a case, the published value should indicate when the OSCAL document
                  was published, not the source material. Where necessary, the publication date of the
                  original source material can be captured as a named property or custom metadata construct.A
                  publisher of OSCAL content can use this data point along with its siblings last-modified
                  and version to establish a sequence of successive revisions of a given OSCAL-based
                  publication. The metadata for previous revisions can be represented as a revision
                  in this object.
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/published"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/published">/profile/metadata/published</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Publication Timestamp</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>published</code>.</p>
                  <p class="path">/profile/metadata/published</p>
               </div>
               <p class="description">The date and time the document was published. The date-time value must be formatted
                  according to <a>RFC 3339</a> with full time and time zone included.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>This value represents the point in time when the OSCAL document was published. Typically,
                        this date value will be machine generated at the time the containing document is published.</p>
                     <p>In some cases, an OSCAL document may be derived from some source material in a different
                        format. In such a case, the <code>published</code> value should indicate when the OSCAL document was published, not the source material.
                        Where necessary, the publication date of the original source material can be captured
                        as a named property or custom metadata construct.</p>
                     <p>A publisher of OSCAL content can use this data point along with its siblings <code>last-modified</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                        The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/last-modified" class="toc3 head">last-modified</h3>Last Modified TimestampThe date and time the document was last modified. The date-time
                  value must be formatted according to RFC 3339 with full time and time zone included.This
                  value represents the point in time when the OSCAL document was last updated, or at
                  the point of creation the creation date. Typically, this date value will be machine
                  generated at time of creation or modification.In some cases, an OSCAL document may
                  be derived from some source material in a different format. In such a case, the last-modified
                  value should indicate the modification time of the OSCAL document, not the source
                  material.A publisher of OSCAL content can use this data point along with its siblings
                  published and version to establish a sequence of successive revisions of a given OSCAL-based
                  publication. The metadata for previous revisions can be represented as a revision
                  in this object.
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/last-modified"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/last-modified">/profile/metadata/last-modified</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Last Modified Timestamp</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>last-modified</code>.</p>
                  <p class="path">/profile/metadata/last-modified</p>
               </div>
               <p class="description">The date and time the document was last modified. The date-time value must be formatted
                  according to <a>RFC 3339</a> with full time and time zone included.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>This value represents the point in time when the OSCAL document was last updated,
                        or at the point of creation the creation date. Typically, this date value will be
                        machine generated at time of creation or modification.</p>
                     <p>In some cases, an OSCAL document may be derived from some source material in a different
                        format. In such a case, the <code>last-modified</code> value should indicate the modification time of the OSCAL document, not the source
                        material.</p>
                     <p>A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                        The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/version" class="toc3 head">version</h3>Document VersionA string used to distinguish the current version of the document from
                  other previous (and future) versions.A version string may be a release number, sequence
                  number, date, or other identifier suffcient to distinguish between different document
                  versions. This version is typically set by the document owner or by the tool used
                  to maintain the content.While not required, it is recommended that OSCAL content authors
                  use Semantic Versioning as a format for version strings. This allows for the easy
                  identification of a version tree consisting of major, minor, and patch numbers.A publisher
                  of OSCAL content can use this data point along with its siblings published and last-modified
                  to establish a sequence of successive revisions of a given OSCAL-based publication.
                  The metadata for previous revisions can be represented as a revision in this object.
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/version"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/version">/profile/metadata/version</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Document Version</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> with key <code>version</code>.</p>
                  <p class="path">/profile/metadata/version</p>
               </div>
               <p class="description">A string used to distinguish the current version of the document from other previous
                  (and future) versions.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A version string may be a release number, sequence number, date, or other identifier
                        suffcient to distinguish between different document versions. This version is typically
                        set by the document owner or by the tool used to maintain the content.</p>
                     <p>While not required, it is recommended that OSCAL content authors use <a>Semantic Versioning</a> as a format for version strings. This allows for the easy identification of a version
                        tree consisting of major, minor, and patch numbers.</p>
                     <p>A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>last-modified</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                        The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/oscal-version" class="toc3 head">oscal-version</h3>OSCAL versionThe OSCAL model version the document was authored against.Indicates the
                  version of the OSCAL model to which this data set conforms, for example 1.1.0 or 1.0.0-M1.
                  That can be used as a hint by a tool to indicate which version of the OSCAL XML or
                  JSON schema to use for validation.
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/oscal-version"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/oscal-version">/profile/metadata/oscal-version</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string OSCAL version</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> with key <code>oscal-version</code>.</p>
                  <p class="path">/profile/metadata/oscal-version</p>
               </div>
               <p class="description">The OSCAL model version the document was authored against.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Indicates the version of the OSCAL model to which this data set conforms, for example
                        <q>1.1.0</q> or <q>1.0.0-M1</q>. That can be used as a hint by a tool to indicate which version of the OSCAL XML
                        or JSON schema to use for validation.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/revisions" class="toc3 head">revisions</h3>
                  <p>An array of Revision History Entry objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Revision History Entry</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>revisions</code>.</p>
                        <p class="path">/profile/metadata/revisions</p>
                     </div>
                     <p class="description">An entry in a sequential list of revisions to the containing document in reverse chronological
                        order (i.e., most recent previous revision first).</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>While <code>published</code>, <code>last-modified</code>, <code>oscal-version</code>, and <code>version</code> are not required, values for these entries should be provided if the information
                              is known. For a revision entry to be considered valid, at least one of the following
                              items must be provided: <code>published</code>, <code>last-modified</code>, <code>version</code>, or a <code>link</code> with a <code>rel</code> of <q>source</q>.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/revisions">/profile/metadata/revisions</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>revisions</code>.</p>
                  <p class="path">/profile/metadata/revisions</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/revisions/title" class="toc4 head">title</h4>Document TitleA name given to the document revision, which may be used by a tool for
                     display and navigation.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/revisions/title">/profile/metadata/revisions/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/profile/metadata/revisions/title</p>
                  </div>
                  <p class="description">A name given to the document revision, which may be used by a tool for display and
                     navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/revisions/published" class="toc4 head">published</h4>Publication TimestampThe date and time the document was published. The date-time value
                     must be formatted according to RFC 3339 with full time and time zone included.This
                     value represents the point in time when the OSCAL document was published. Typically,
                     this date value will be machine generated at the time the containing document is published.In
                     some cases, an OSCAL document may be derived from some source material in a different
                     format. In such a case, the published value should indicate when the OSCAL document
                     was published, not the source material. Where necessary, the publication date of the
                     original source material can be captured as a named property or custom metadata construct.A
                     publisher of OSCAL content can use this data point along with its siblings last-modified
                     and version to establish a sequence of successive revisions of a given OSCAL-based
                     publication. The metadata for previous revisions can be represented as a revision
                     in this object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/published"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/revisions/published">/profile/metadata/revisions/published</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Publication Timestamp</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>published</code>.</p>
                     <p class="path">/profile/metadata/revisions/published</p>
                  </div>
                  <p class="description">The date and time the document was published. The date-time value must be formatted
                     according to <a>RFC 3339</a> with full time and time zone included.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>This value represents the point in time when the OSCAL document was published. Typically,
                           this date value will be machine generated at the time the containing document is published.</p>
                        <p>In some cases, an OSCAL document may be derived from some source material in a different
                           format. In such a case, the <code>published</code> value should indicate when the OSCAL document was published, not the source material.
                           Where necessary, the publication date of the original source material can be captured
                           as a named property or custom metadata construct.</p>
                        <p>A publisher of OSCAL content can use this data point along with its siblings <code>last-modified</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                           The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/revisions/last-modified" class="toc4 head">last-modified</h4>Last Modified TimestampThe date and time the document was last modified. The date-time
                     value must be formatted according to RFC 3339 with full time and time zone included.This
                     value represents the point in time when the OSCAL document was last updated, or at
                     the point of creation the creation date. Typically, this date value will be machine
                     generated at time of creation or modification.In some cases, an OSCAL document may
                     be derived from some source material in a different format. In such a case, the last-modified
                     value should indicate the modification time of the OSCAL document, not the source
                     material.A publisher of OSCAL content can use this data point along with its siblings
                     published and version to establish a sequence of successive revisions of a given OSCAL-based
                     publication. The metadata for previous revisions can be represented as a revision
                     in this object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/last-modified"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/revisions/last-modified">/profile/metadata/revisions/last-modified</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Last Modified Timestamp</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>last-modified</code>.</p>
                     <p class="path">/profile/metadata/revisions/last-modified</p>
                  </div>
                  <p class="description">The date and time the document was last modified. The date-time value must be formatted
                     according to <a>RFC 3339</a> with full time and time zone included.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>This value represents the point in time when the OSCAL document was last updated,
                           or at the point of creation the creation date. Typically, this date value will be
                           machine generated at time of creation or modification.</p>
                        <p>In some cases, an OSCAL document may be derived from some source material in a different
                           format. In such a case, the <code>last-modified</code> value should indicate the modification time of the OSCAL document, not the source
                           material.</p>
                        <p>A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                           The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/revisions/version" class="toc4 head">version</h4>Document VersionA string used to distinguish the current version of the document from
                     other previous (and future) versions.A version string may be a release number, sequence
                     number, date, or other identifier suffcient to distinguish between different document
                     versions. This version is typically set by the document owner or by the tool used
                     to maintain the content.While not required, it is recommended that OSCAL content authors
                     use Semantic Versioning as a format for version strings. This allows for the easy
                     identification of a version tree consisting of major, minor, and patch numbers.A publisher
                     of OSCAL content can use this data point along with its siblings published and last-modified
                     to establish a sequence of successive revisions of a given OSCAL-based publication.
                     The metadata for previous revisions can be represented as a revision in this object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/version"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/revisions/version">/profile/metadata/revisions/version</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Version</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>version</code>.</p>
                     <p class="path">/profile/metadata/revisions/version</p>
                  </div>
                  <p class="description">A string used to distinguish the current version of the document from other previous
                     (and future) versions.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A version string may be a release number, sequence number, date, or other identifier
                           suffcient to distinguish between different document versions. This version is typically
                           set by the document owner or by the tool used to maintain the content.</p>
                        <p>While not required, it is recommended that OSCAL content authors use <a>Semantic Versioning</a> as a format for version strings. This allows for the easy identification of a version
                           tree consisting of major, minor, and patch numbers.</p>
                        <p>A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>last-modified</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                           The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/revisions/oscal-version" class="toc4 head">oscal-version</h4>OSCAL versionThe OSCAL model version the document was authored against.Indicates the
                     version of the OSCAL model to which this data set conforms, for example 1.1.0 or 1.0.0-M1.
                     That can be used as a hint by a tool to indicate which version of the OSCAL XML or
                     JSON schema to use for validation.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/oscal-version"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/revisions/oscal-version">/profile/metadata/revisions/oscal-version</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string OSCAL version</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>oscal-version</code>.</p>
                     <p class="path">/profile/metadata/revisions/oscal-version</p>
                  </div>
                  <p class="description">The OSCAL model version the document was authored against.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Indicates the version of the OSCAL model to which this data set conforms, for example
                           <q>1.1.0</q> or <q>1.0.0-M1</q>. That can be used as a hint by a tool to indicate which version of the OSCAL XML
                           or JSON schema to use for validation.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/revisions/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/profile/metadata/revisions/props</p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/revisions/props">/profile/metadata/revisions/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/profile/metadata/revisions/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/props/name">/profile/metadata/revisions/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/profile/metadata/revisions/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/props/uuid">/profile/metadata/revisions/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/profile/metadata/revisions/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/props/ns">/profile/metadata/revisions/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/profile/metadata/revisions/props/ns</p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/props/value">/profile/metadata/revisions/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/profile/metadata/revisions/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/props/class">/profile/metadata/revisions/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/profile/metadata/revisions/props/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/props/remarks">/profile/metadata/revisions/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/profile/metadata/revisions/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/revisions/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/profile/metadata/revisions/links</p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/revisions/links">/profile/metadata/revisions/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/profile/metadata/revisions/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/links/href">/profile/metadata/revisions/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/profile/metadata/revisions/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/links/rel">/profile/metadata/revisions/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/profile/metadata/revisions/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/links/media-type">/profile/metadata/revisions/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/profile/metadata/revisions/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/revisions/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/revisions/links/text">/profile/metadata/revisions/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/profile/metadata/revisions/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/revisions/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/revisions/revision/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/revisions/remarks">/profile/metadata/revisions/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/profile/metadata/revisions/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/document-ids" class="toc3 head">document-ids</h3>
                  <p>An array of Document Identifier objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Document Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An object of type <a href="link.to.string">string</a> member of array <code>document-ids</code>.</p>
                        <p class="path">/profile/metadata/document-ids</p>
                     </div>
                     <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
                        that are to be treated as different versions of the same document. If this element
                        does not appear, or if the value of this element is empty, the value of "document-id"
                        is equal to the value of the "uuid" flag of the top-level root element.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>This element is optional, but it will always have a valid value, as if it is missing
                              the value of "document-id" is assumed to be equal to the UUID of the root. This requirement
                              allows for document creators to retroactively link an update to the original version,
                              by providing a document-id on the new document that is equal to the uuid of the original
                              document.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/document-id"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/document-ids">/profile/metadata/document-ids</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>document-ids</code>.</p>
                  <p class="path">/profile/metadata/document-ids</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/document-ids/scheme" class="toc4 head">scheme</h4>Document Identification SchemeQualifies the kind of document identifier using a URI.
                     If the scheme is not provided the value of the element will be interpreted as a string
                     of characters. 
                     
                     A Digital Object Identifier (DOI); use is preferred, since this allows for retrieval
                     of a full bibliographic record.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/document-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/document-ids/scheme">/profile/metadata/document-ids/scheme</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Identification Scheme</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                     <p class="path">/profile/metadata/document-ids/scheme</p>
                  </div>
                  <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                     the value of the element will be interpreted as a string of characters. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/document-ids/identifier" class="toc4 head">identifier</h4>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/document-id/identifier"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/document-ids/identifier">/profile/metadata/document-ids/identifier</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>identifier</code>.</p>
                     <p class="path">/profile/metadata/document-ids/identifier</p>
                  </div>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/props" class="toc3 head">props</h3>
                  <p>An array of Property objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Property</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>props</code>.</p>
                        <p class="path">/profile/metadata/props</p>
                     </div>
                     <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                        qualified name/value pair. The value of a property is a simple scalar value, which
                        may be expressed as a list of values.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Properties permit the deployment and management of arbitrary controlled values, within
                              OSCAL objects. A property can be included for any purpose useful to an application
                              or implementation. Typically, properties will be used to sort, filter, select, order,
                              and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                              an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                              lexical composition of properties may be constrained by external processes to ensure
                              consistency.</p>
                           <p>Property allows for associated remarks that describe why the specific property value
                              was applied to the containing object, or the significance of the value in the context
                              of the containing object.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/prop"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/props">/profile/metadata/props</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>props</code>.</p>
                  <p class="path">/profile/metadata/props</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/props/name" class="toc4 head">name</h4>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                     or quality of the property's containing object.
                     
                     A label or descriptor that is tied to a sensitivity or classification marking system.
                     An optional class can be used to define the specific marking system used for the associated
                     value.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/props/name">/profile/metadata/props/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/profile/metadata/props/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/props/uuid" class="toc4 head">uuid</h4>Property Universally Unique IdentifierA unique identifier that can be used to reference
                     this property elsewhere in an OSCAL document. A UUID should be consistently used for
                     a given location across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/props/uuid">/profile/metadata/props/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/profile/metadata/props/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/props/ns" class="toc4 head">ns</h4>Property NamespaceA namespace qualifying the property's name. This allows different
                     organizations to associate distinct semantics with the same name.Provides a means
                     to segment the value space for the name, so that different organizations and individuals
                     can assert control over the allowed names and associated values used in a property.
                     This allows the semantics associated with a given name/value pair to be defined on
                     an organization-by-organization basis.An organization MUST use a URI that they have
                     control over. e.g., a domain registered to the organization in a URI, a registered
                     uniform resource names (URN) namespace.When a ns is not provided, its value should
                     be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                     by the associated OSCAL model.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/props/ns">/profile/metadata/props/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/profile/metadata/props/ns</p>
                  </div>
                  <p class="description">A namespace qualifying the property's name. This allows different organizations to
                     associate distinct semantics with the same name.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                           names and associated values used in a property. This allows the semantics associated
                           with a given name/value pair to be defined on an organization-by-organization basis.</p>
                        <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                           to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                        <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/props/value" class="toc4 head">value</h4>Property ValueIndicates the value of the attribute, characteristic, or quality.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/props/value">/profile/metadata/props/value</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                     <p class="path">/profile/metadata/props/value</p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/props/class" class="toc4 head">class</h4>Property ClassA textual label that provides a sub-type or characterization of the
                     property's name. This can be used to further distinguish or discriminate between the
                     semantics of multiple properties of the same object with the same name and ns. A class
                     can be used in validation rules to express extra constraints over named items of a
                     specific class value.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/props/class">/profile/metadata/props/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/profile/metadata/props/class</p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                           a specific <code>class</code> value.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/props/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/props/remarks">/profile/metadata/props/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/profile/metadata/props/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/links" class="toc3 head">links</h3>
                  <p>An array of Link objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Link</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>links</code>.</p>
                        <p class="path">/profile/metadata/links</p>
                     </div>
                     <p class="description">A reference to a local or remote resource</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>To provide a cryptographic hash for a remote target resource, a local reference to
                              a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                           <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/link"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/links">/profile/metadata/links</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>links</code>.</p>
                  <p class="path">/profile/metadata/links</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/links/href" class="toc4 head">href</h4>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                     can be an internet resource, or a local reference using a fragment e.g. #fragment
                     that points to a back-matter resource in the same document.If a local reference using
                     a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                     which references an identified resource in the document's back-matter or another object
                     that is within the scope of the containing OSCAL document.If an internet resource
                     is used, the href value will be an absolute or relative URI pointing to the location
                     of the referenced resource. A relative URI will be resolved relative to the location
                     of the document containing the link.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/links/href">/profile/metadata/links/href</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                     <p class="path">/profile/metadata/links/href</p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                           that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                        <p>If a local reference using a fragment is used, this will be indicated by a fragment
                           "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                        <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                           resource. A relative URI will be resolved relative to the location of the document
                           containing the link.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/links/rel" class="toc4 head">rel</h4>RelationDescribes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.
                     
                     Reference
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/links/rel">/profile/metadata/links/rel</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                     <p class="path">/profile/metadata/links/rel</p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/links/media-type" class="toc4 head">media-type</h4>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                     (IANA) Media Types Registry. 
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/links/media-type">/profile/metadata/links/media-type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                     <p class="path">/profile/metadata/links/media-type</p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/links/text" class="toc4 head">text</h4>Link TextA textual label to associate with the link, which may be used for presentation
                     in a tool.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/link/text"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/links/text">/profile/metadata/links/text</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                     <p class="path">/profile/metadata/links/text</p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/roles" class="toc3 head">roles</h3>
                  <p>An array of Role objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Role</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>roles</code>.</p>
                        <p class="path">/profile/metadata/roles</p>
                     </div>
                     <p class="description">Defines a function assumed or expected to be assumed by a party in a specific situation.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Permissible values to be determined closer to the application (e.g. by a receiving
                              authority).</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/roles">/profile/metadata/roles</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>roles</code>.</p>
                  <p class="path">/profile/metadata/roles</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/roles/id" class="toc4 head">id</h4>Role IdentifierA unique identifier for a specific role instance. This identifier's
                     uniqueness is document scoped and is intended to be consistent for the same role across
                     minor revisions of the document.OSCAL has defined a set of standardized roles for
                     consistent use in OSCAL documents. This allows tools consuming OSCAL content to infer
                     specific semantics when these roles are used. These roles are documented in the specific
                     contexts of their use (e.g., responsible-party, responsible-role). When using such
                     a role, it is necessary to define these roles in this list, which will then allow
                     such a role to be referenced.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/@id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/roles/id">/profile/metadata/roles/id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                     <p class="path">/profile/metadata/roles/id</p>
                  </div>
                  <p class="description">A unique identifier for a specific role instance. This identifier's uniqueness is
                     document scoped and is intended to be consistent for the same role across minor revisions
                     of the document.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>OSCAL has defined a set of standardized roles for consistent use in OSCAL documents.
                           This allows tools consuming OSCAL content to infer specific semantics when these roles
                           are used. These roles are documented in the specific contexts of their use (e.g.,
                           responsible-party, responsible-role). When using such a role, it is necessary to define
                           these roles in this list, which will then allow such a role to be referenced.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/roles/title" class="toc4 head">title</h4>Role TitleA name given to the role, which may be used by a tool for display and navigation.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/roles/title">/profile/metadata/roles/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Title</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/profile/metadata/roles/title</p>
                  </div>
                  <p class="description">A name given to the role, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/roles/short-name" class="toc4 head">short-name</h4>Role Short NameA short common name, abbreviation, or acronym for the role.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/short-name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/roles/short-name">/profile/metadata/roles/short-name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Short Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>short-name</code>.</p>
                     <p class="path">/profile/metadata/roles/short-name</p>
                  </div>
                  <p class="description">A short common name, abbreviation, or acronym for the role.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/roles/description" class="toc4 head">description</h4>Role DescriptionA summary of the role's purpose and associated responsibilities.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/description"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/roles/description">/profile/metadata/roles/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/profile/metadata/roles/description</p>
                  </div>
                  <p class="description">A summary of the role's purpose and associated responsibilities.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/roles/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/profile/metadata/roles/props</p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/roles/props">/profile/metadata/roles/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/profile/metadata/roles/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/props/name">/profile/metadata/roles/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/profile/metadata/roles/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/props/uuid">/profile/metadata/roles/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/profile/metadata/roles/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/props/ns">/profile/metadata/roles/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/profile/metadata/roles/props/ns</p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/props/value">/profile/metadata/roles/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/profile/metadata/roles/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/props/class">/profile/metadata/roles/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/profile/metadata/roles/props/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/props/remarks">/profile/metadata/roles/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/profile/metadata/roles/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/roles/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/profile/metadata/roles/links</p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/roles/links">/profile/metadata/roles/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/profile/metadata/roles/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/links/href">/profile/metadata/roles/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/profile/metadata/roles/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/links/rel">/profile/metadata/roles/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/profile/metadata/roles/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/links/media-type">/profile/metadata/roles/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/profile/metadata/roles/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/roles/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/roles/links/text">/profile/metadata/roles/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/profile/metadata/roles/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/roles/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/role/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/roles/remarks">/profile/metadata/roles/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/profile/metadata/roles/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/locations" class="toc3 head">locations</h3>
                  <p>An array of Location objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Location</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>locations</code>.</p>
                        <p class="path">/profile/metadata/locations</p>
                     </div>
                     <p class="description">A location, with associated metadata that can be referenced.</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/locations">/profile/metadata/locations</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>locations</code>.</p>
                  <p class="path">/profile/metadata/locations</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/uuid" class="toc4 head">uuid</h4>Location Universally Unique IdentifierA unique identifier that can be used to reference
                     this defined location elsewhere in an OSCAL document. A UUID should be consistently
                     used for a given location across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/uuid">/profile/metadata/locations/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Location Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/profile/metadata/locations/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this defined location elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given location across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/title" class="toc4 head">title</h4>Location TitleA name given to the location, which may be used by a tool for display
                     and navigation.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/title">/profile/metadata/locations/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Location Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/profile/metadata/locations/title</p>
                  </div>
                  <p class="description">A name given to the location, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/address" class="toc4 head">address</h4>AddressA postal address for the location.Address TypeIndicates the type of address.
                     
                     A home address.
                     A work address.
                     
                     
                     <p>An array of Address line strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Address line</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> member of array <code>addr-lines</code>.</p>
                           <p class="path">/profile/metadata/locations/address/addr-lines</p>
                        </div>
                        <p class="description">A single line of an address.</p>
                     </div>CityCity, town or geographical region for the mailing address.StateState, province
                     or analogous geographical region for mailing addressPostal CodePostal or ZIP code
                     for mailing addressCountry CodeThe ISO 3166-1 alpha-2 country code for the mailing
                     address.
                     
                     Typically, the physical address of the location will be used here. If this information
                     is sensitive, then a mailing address can be used instead.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/address"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/address">/profile/metadata/locations/address</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Address</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An object  with key <code>address</code>.</p>
                     <p class="path">/profile/metadata/locations/address</p>
                  </div>
                  <p class="description">A postal address for the location.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>Typically, the physical address of the location will be used here. If this information
                           is sensitive, then a mailing address can be used instead.</p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/address/type" class="toc5 head">type</h5>Address TypeIndicates the type of address.
                        
                        A home address.
                        A work address.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/address/@type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/address/type">/profile/metadata/locations/address/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>type</code>.</p>
                        <p class="path">/profile/metadata/locations/address/type</p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/address/addr-lines" class="toc5 head">addr-lines</h5>
                        <p>An array of Address line strings</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Address line</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> member of array <code>addr-lines</code>.</p>
                              <p class="path">/profile/metadata/locations/address/addr-lines</p>
                           </div>
                           <p class="description">A single line of an address.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/address/addr-line"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/address/addr-lines">/profile/metadata/locations/address/addr-lines</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>addr-lines</code>.</p>
                        <p class="path">/profile/metadata/locations/address/addr-lines</p>
                     </div>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/address/city" class="toc5 head">city</h5>CityCity, town or geographical region for the mailing address.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/address/city"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/address/city">/profile/metadata/locations/address/city</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string City</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>city</code>.</p>
                        <p class="path">/profile/metadata/locations/address/city</p>
                     </div>
                     <p class="description">City, town or geographical region for the mailing address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/address/state" class="toc5 head">state</h5>StateState, province or analogous geographical region for mailing address
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/address/state"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/address/state">/profile/metadata/locations/address/state</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string State</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>state</code>.</p>
                        <p class="path">/profile/metadata/locations/address/state</p>
                     </div>
                     <p class="description">State, province or analogous geographical region for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/address/postal-code" class="toc5 head">postal-code</h5>Postal CodePostal or ZIP code for mailing address
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/address/postal-code"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/address/postal-code">/profile/metadata/locations/address/postal-code</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Postal Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>postal-code</code>.</p>
                        <p class="path">/profile/metadata/locations/address/postal-code</p>
                     </div>
                     <p class="description">Postal or ZIP code for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/address/country" class="toc5 head">country</h5>Country CodeThe ISO 3166-1 alpha-2 country code for the mailing address.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/address/country"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/address/country">/profile/metadata/locations/address/country</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Country Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>country</code>.</p>
                        <p class="path">/profile/metadata/locations/address/country</p>
                     </div>
                     <p class="description">The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/email-addresses" class="toc4 head">email-addresses</h4>
                     <p>An array of Email Address strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Email Address</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.email">email</a> member of array <code>email-addresses</code>.</p>
                           <p class="path">/profile/metadata/locations/email-addresses</p>
                        </div>
                        <p class="description">An email address as defined by <a>RFC 5322 Section 3.4.1</a>. </p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>This is a contact email associated with the location.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/email-address"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/email-addresses">/profile/metadata/locations/email-addresses</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>email-addresses</code>.</p>
                     <p class="path">/profile/metadata/locations/email-addresses</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/telephone-numbers" class="toc4 head">telephone-numbers</h4>
                     <p>An array of Telephone Number objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Telephone Number</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An object of type <a href="link.to.string">string</a> member of array <code>telephone-numbers</code>.</p>
                           <p class="path">/profile/metadata/locations/telephone-numbers</p>
                        </div>
                        <p class="description">Contact number by telephone.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>A phone number used to contact the location.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/telephone-number"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/telephone-numbers">/profile/metadata/locations/telephone-numbers</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>telephone-numbers</code>.</p>
                     <p class="path">/profile/metadata/locations/telephone-numbers</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/telephone-numbers/type" class="toc5 head">type</h5>type flagIndicates the type of phone number.
                        
                        A home phone number.
                        An office phone number.
                        A mobile phone number.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/telephone-number/@type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/telephone-numbers/type">/profile/metadata/locations/telephone-numbers/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                        <p class="path">/profile/metadata/locations/telephone-numbers/type</p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/telephone-numbers/number" class="toc5 head">number</h5>
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/telephone-number/number"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/telephone-numbers/number">/profile/metadata/locations/telephone-numbers/number</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>number</code>.</p>
                        <p class="path">/profile/metadata/locations/telephone-numbers/number</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/urls" class="toc4 head">urls</h4>
                     <p>An array of Location URL strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Location URL</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> member of array <code>urls</code>.</p>
                           <p class="path">/profile/metadata/locations/urls</p>
                        </div>
                        <p class="description">The uniform resource locator (URL) for a web site or Internet presence associated
                           with the location.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/url"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/urls">/profile/metadata/locations/urls</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>urls</code>.</p>
                     <p class="path">/profile/metadata/locations/urls</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/profile/metadata/locations/props</p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/props">/profile/metadata/locations/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/profile/metadata/locations/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/props/name">/profile/metadata/locations/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/profile/metadata/locations/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/props/uuid">/profile/metadata/locations/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/profile/metadata/locations/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/props/ns">/profile/metadata/locations/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/profile/metadata/locations/props/ns</p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/props/value">/profile/metadata/locations/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/profile/metadata/locations/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/props/class">/profile/metadata/locations/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/profile/metadata/locations/props/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/props/remarks">/profile/metadata/locations/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/profile/metadata/locations/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/profile/metadata/locations/links</p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/links">/profile/metadata/locations/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/profile/metadata/locations/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/links/href">/profile/metadata/locations/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/profile/metadata/locations/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/links/rel">/profile/metadata/locations/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/profile/metadata/locations/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/links/media-type">/profile/metadata/locations/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/profile/metadata/locations/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/locations/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/locations/links/text">/profile/metadata/locations/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/profile/metadata/locations/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/locations/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/location/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/locations/remarks">/profile/metadata/locations/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/profile/metadata/locations/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/parties" class="toc3 head">parties</h3>
                  <p>An array of Party (organization or person) objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Party (organization or person)</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>parties</code>.</p>
                        <p class="path">/profile/metadata/parties</p>
                     </div>
                     <p class="description">A responsible entity which is either a person or an organization.</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/parties">/profile/metadata/parties</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>parties</code>.</p>
                  <p class="path">/profile/metadata/parties</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/uuid" class="toc4 head">uuid</h4>Party Universally Unique IdentifierA unique identifier that can be used to reference
                     this defined location elsewhere in an OSCAL document. A UUID should be consistently
                     used for a given party across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/uuid">/profile/metadata/parties/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/profile/metadata/parties/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this defined location elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given party across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/type" class="toc4 head">type</h4>Party TypeA category describing the kind of party the object describes.
                     
                     An individual.
                     A group of individuals formed for a specific purpose.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/@type"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/type">/profile/metadata/parties/type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Type</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                     <p class="path">/profile/metadata/parties/type</p>
                  </div>
                  <p class="description">A category describing the kind of party the object describes.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/name" class="toc4 head">name</h4>Party NameThe full name of the party. This is typically the legal name associated
                     with the party.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/name">/profile/metadata/parties/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>name</code>.</p>
                     <p class="path">/profile/metadata/parties/name</p>
                  </div>
                  <p class="description">The full name of the party. This is typically the legal name associated with the party.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/short-name" class="toc4 head">short-name</h4>Party Short NameA short common name, abbreviation, or acronym for the party.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/short-name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/short-name">/profile/metadata/parties/short-name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Short Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>short-name</code>.</p>
                     <p class="path">/profile/metadata/parties/short-name</p>
                  </div>
                  <p class="description">A short common name, abbreviation, or acronym for the party.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/external-ids" class="toc4 head">external-ids</h4>
                     <p>An array of Party External Identifier objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Party External Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An object of type <a href="link.to.string">string</a> member of array <code>external-ids</code>.</p>
                           <p class="path">/profile/metadata/parties/external-ids</p>
                        </div>
                        <p class="description">An identifier for a person or organization using a designated scheme. e.g. an Open
                           Researcher and Contributor ID (ORCID)</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/external-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/external-ids">/profile/metadata/parties/external-ids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>external-ids</code>.</p>
                     <p class="path">/profile/metadata/parties/external-ids</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/external-ids/scheme" class="toc5 head">scheme</h5>External Identifier SchemaIndicates the type of external identifier.
                        
                        The identifier is Open Researcher and Contributor ID (ORCID).
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/external-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/external-ids/scheme">/profile/metadata/parties/external-ids/scheme</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string External Identifier Schema</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                        <p class="path">/profile/metadata/parties/external-ids/scheme</p>
                     </div>
                     <p class="description">Indicates the type of external identifier.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/external-ids/id" class="toc5 head">id</h5>
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/external-id/id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/external-ids/id">/profile/metadata/parties/external-ids/id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>id</code>.</p>
                        <p class="path">/profile/metadata/parties/external-ids/id</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/profile/metadata/parties/props</p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/props">/profile/metadata/parties/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/profile/metadata/parties/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/props/name">/profile/metadata/parties/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/profile/metadata/parties/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/props/uuid">/profile/metadata/parties/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/profile/metadata/parties/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/props/ns">/profile/metadata/parties/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/profile/metadata/parties/props/ns</p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/props/value">/profile/metadata/parties/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/profile/metadata/parties/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/props/class">/profile/metadata/parties/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/profile/metadata/parties/props/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/props/remarks">/profile/metadata/parties/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/profile/metadata/parties/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/profile/metadata/parties/links</p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/links">/profile/metadata/parties/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/profile/metadata/parties/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/links/href">/profile/metadata/parties/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/profile/metadata/parties/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/links/rel">/profile/metadata/parties/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/profile/metadata/parties/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/links/media-type">/profile/metadata/parties/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/profile/metadata/parties/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/links/text">/profile/metadata/parties/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/profile/metadata/parties/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/email-addresses" class="toc4 head">email-addresses</h4>
                     <p>An array of Email Address strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Email Address</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.email">email</a> member of array <code>email-addresses</code>.</p>
                           <p class="path">/profile/metadata/parties/email-addresses</p>
                        </div>
                        <p class="description">An email address as defined by <a>RFC 5322 Section 3.4.1</a>. </p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>This is a contact email associated with the party.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/email-address"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/email-addresses">/profile/metadata/parties/email-addresses</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>email-addresses</code>.</p>
                     <p class="path">/profile/metadata/parties/email-addresses</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/telephone-numbers" class="toc4 head">telephone-numbers</h4>
                     <p>An array of Telephone Number objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Telephone Number</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An object of type <a href="link.to.string">string</a> member of array <code>telephone-numbers</code>.</p>
                           <p class="path">/profile/metadata/parties/telephone-numbers</p>
                        </div>
                        <p class="description">Contact number by telephone.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>A phone number used to contact the party.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/telephone-number"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/telephone-numbers">/profile/metadata/parties/telephone-numbers</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>telephone-numbers</code>.</p>
                     <p class="path">/profile/metadata/parties/telephone-numbers</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/telephone-numbers/type" class="toc5 head">type</h5>type flagIndicates the type of phone number.
                        
                        A home phone number.
                        An office phone number.
                        A mobile phone number.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/telephone-number/@type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/telephone-numbers/type">/profile/metadata/parties/telephone-numbers/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                        <p class="path">/profile/metadata/parties/telephone-numbers/type</p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/telephone-numbers/number" class="toc5 head">number</h5>
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/telephone-number/number"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/telephone-numbers/number">/profile/metadata/parties/telephone-numbers/number</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>number</code>.</p>
                        <p class="path">/profile/metadata/parties/telephone-numbers/number</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/addresses" class="toc4 head">addresses</h4>
                     <p>An array of Address objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Address</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>addresses</code>.</p>
                           <p class="path">/profile/metadata/parties/addresses</p>
                        </div>
                        <p class="description">A postal address for the location.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/address"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/addresses">/profile/metadata/parties/addresses</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>addresses</code>.</p>
                     <p class="path">/profile/metadata/parties/addresses</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/addresses/type" class="toc5 head">type</h5>Address TypeIndicates the type of address.
                        
                        A home address.
                        A work address.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/address/@type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/addresses/type">/profile/metadata/parties/addresses/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>type</code>.</p>
                        <p class="path">/profile/metadata/parties/addresses/type</p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/addresses/addr-lines" class="toc5 head">addr-lines</h5>
                        <p>An array of Address line strings</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Address line</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> member of array <code>addr-lines</code>.</p>
                              <p class="path">/profile/metadata/parties/addresses/addr-lines</p>
                           </div>
                           <p class="description">A single line of an address.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/address/addr-line"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/addresses/addr-lines">/profile/metadata/parties/addresses/addr-lines</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>addr-lines</code>.</p>
                        <p class="path">/profile/metadata/parties/addresses/addr-lines</p>
                     </div>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/addresses/city" class="toc5 head">city</h5>CityCity, town or geographical region for the mailing address.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/address/city"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/addresses/city">/profile/metadata/parties/addresses/city</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string City</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>city</code>.</p>
                        <p class="path">/profile/metadata/parties/addresses/city</p>
                     </div>
                     <p class="description">City, town or geographical region for the mailing address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/addresses/state" class="toc5 head">state</h5>StateState, province or analogous geographical region for mailing address
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/address/state"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/addresses/state">/profile/metadata/parties/addresses/state</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string State</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>state</code>.</p>
                        <p class="path">/profile/metadata/parties/addresses/state</p>
                     </div>
                     <p class="description">State, province or analogous geographical region for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/addresses/postal-code" class="toc5 head">postal-code</h5>Postal CodePostal or ZIP code for mailing address
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/address/postal-code"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/addresses/postal-code">/profile/metadata/parties/addresses/postal-code</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Postal Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>postal-code</code>.</p>
                        <p class="path">/profile/metadata/parties/addresses/postal-code</p>
                     </div>
                     <p class="description">Postal or ZIP code for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/parties/addresses/country" class="toc5 head">country</h5>Country CodeThe ISO 3166-1 alpha-2 country code for the mailing address.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/address/country"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/parties/addresses/country">/profile/metadata/parties/addresses/country</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Country Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>country</code>.</p>
                        <p class="path">/profile/metadata/parties/addresses/country</p>
                     </div>
                     <p class="description">The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/location-uuids" class="toc4 head">location-uuids</h4>
                     <p>An array of Location Reference strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Location Reference</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>location-uuids</code>.</p>
                           <p class="path">/profile/metadata/parties/location-uuids</p>
                        </div>
                        <p class="description">References a <code>location</code> defined in <code>metadata</code>. </p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/location-uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/location-uuids">/profile/metadata/parties/location-uuids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>location-uuids</code>.</p>
                     <p class="path">/profile/metadata/parties/location-uuids</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/member-of-organizations" class="toc4 head">member-of-organizations</h4>
                     <p>An array of Organizational Affiliation strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Organizational Affiliation</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>member-of-organizations</code>.</p>
                           <p class="path">/profile/metadata/parties/member-of-organizations</p>
                        </div>
                        <p class="description">Identifies that the party object is a member of the organization associated with the
                           provided UUID.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Parties of both the <code>person</code> or <code>organization</code> type can be associated with an organization using the <code>member-of-organization</code>. </p>
                           </div>
                           <div class="remarks">
                              <p>Parties of both the <code>person</code> or <code>organization</code> type can be associated with an organization using the <code>member-of-organization</code>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/member-of-organization"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/member-of-organizations">/profile/metadata/parties/member-of-organizations</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>member-of-organizations</code>.</p>
                     <p class="path">/profile/metadata/parties/member-of-organizations</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/parties/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/party/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/parties/remarks">/profile/metadata/parties/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/profile/metadata/parties/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/responsible-parties" class="toc3 head">responsible-parties</h3>
                  <p>An array of Responsible Party objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Responsible Party</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>responsible-parties</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties</p>
                     </div>
                     <p class="description">A reference to a set of organizations or persons that have responsibility for performing
                        a referenced role in the context of the containing object.</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/responsible-parties">/profile/metadata/responsible-parties</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>responsible-parties</code>.</p>
                  <p class="path">/profile/metadata/responsible-parties</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/responsible-parties/role-id" class="toc4 head">role-id</h4>Responsible RoleThe role that the party is responsible for.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/@role-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/role-id">/profile/metadata/responsible-parties/role-id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Responsible Role</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>role-id</code>.</p>
                     <p class="path">/profile/metadata/responsible-parties/role-id</p>
                  </div>
                  <p class="description">The role that the party is responsible for.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/responsible-parties/party-uuids" class="toc4 head">party-uuids</h4>
                     <p>An array of Party Reference strings</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Party Reference</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>party-uuids</code>.</p>
                           <p class="path">/profile/metadata/responsible-parties/party-uuids</p>
                        </div>
                        <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>Specifies one or more parties that are responsible for performing the associated <code>role</code>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/party-uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/party-uuids">/profile/metadata/responsible-parties/party-uuids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An array  with key <code>party-uuids</code>.</p>
                     <p class="path">/profile/metadata/responsible-parties/party-uuids</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/responsible-parties/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/profile/metadata/responsible-parties/props</p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/props">/profile/metadata/responsible-parties/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/profile/metadata/responsible-parties/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/props/name">/profile/metadata/responsible-parties/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/props/uuid">/profile/metadata/responsible-parties/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/props/ns">/profile/metadata/responsible-parties/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/props/ns</p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/props/value">/profile/metadata/responsible-parties/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/props/class">/profile/metadata/responsible-parties/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/props/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/props/remarks">/profile/metadata/responsible-parties/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/responsible-parties/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/profile/metadata/responsible-parties/links</p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/links">/profile/metadata/responsible-parties/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/profile/metadata/responsible-parties/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/links/href">/profile/metadata/responsible-parties/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/links/rel">/profile/metadata/responsible-parties/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/links/media-type">/profile/metadata/responsible-parties/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/metadata/responsible-parties/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/links/text">/profile/metadata/responsible-parties/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/profile/metadata/responsible-parties/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/metadata/responsible-parties/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/metadata/responsible-party/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/metadata/responsible-parties/remarks">/profile/metadata/responsible-parties/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/profile/metadata/responsible-parties/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/metadata/remarks" class="toc3 head">remarks</h3>RemarksAdditional commentary on the containing object.
                  <div class="crosslink"><a href="../xml-reference/#/profile/metadata/remarks"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/metadata/remarks">/profile/metadata/remarks</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                  <p class="path">/profile/metadata/remarks</p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
            </div>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/profile/imports" class="toc2 head">imports</h2>
               <p>An array of Import resource objects</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Import resource</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>imports</code>.</p>
                     <p class="path">/profile/imports</p>
                  </div>
                  <p class="description">The <code>import</code> designates a catalog, profile, or other resource to be included (referenced and potentially
                     modified) by this profile. The import also identifies which controls to select using
                     the <code>include-all</code>, <code>include-controls</code>, and <code>exclude-controls</code> directives.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A profile must be based on an existing OSCAL catalog or another OSCAL profile. An
                           <code>import</code> indicates such a source whose controls are to be included (referenced and modified)
                           in a profile. This source will either be a catalog whose controls are given (<q>by value</q>), or a profile with its own control imports.</p>
                        <p>The contents of the <code>import</code> element indicate which controls from the source will be included. Controls from the
                           source catalog or profile may be either selected, using the <code>include-all</code> or <code>include-controls</code> directives, or de-selected (using an <code>exclude-controls</code> directive).</p>
                     </div>
                  </details>
               </div>
               <div class="crosslink"><a href="../xml-reference/#/profile/import"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/profile/imports">/profile/imports</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">array </p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An array  with key <code>imports</code>.</p>
               <p class="path">/profile/imports</p>
            </div>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/imports/href" class="toc3 head">href</h3>Catalog or Profile ReferenceA resolvable URL reference to the base catalog or profile
                  that this profile is tailoring.The value of the href can be an internet resource,
                  or a local reference using a fragment e.g. #fragment that points to a back-matter
                  resource in the same document.If a local reference using a fragment is used, this
                  will be indicated by a fragment "#" followed by an identifier which references an
                  identified resource in the document's back-matter or another object that is within
                  the scope of the containing OSCAL document.If an internet resource is used, the href
                  value will be an absolute or relative URL pointing to the location of the referenced
                  resource. A relative URL will be resolved relative to the location of the document
                  containing the link.
                  <div class="crosslink"><a href="../xml-reference/#/profile/import/@href"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/imports/href">/profile/imports/href</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Catalog or Profile Reference</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                  <p class="path">/profile/imports/href</p>
               </div>
               <p class="description">A resolvable URL reference to the base catalog or profile that this profile is tailoring.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                     <p>If a local reference using a fragment is used, this will be indicated by a fragment
                        "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                     <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URL pointing to the location of the referenced
                        resource. A relative URL will be resolved relative to the location of the document
                        containing the link.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/imports/include-all" class="toc3 head">include-all</h3>Insert AllInsert all controls from the imported catalog or profile resources identified
                  in the import directive.Identifies that all controls are to be included from the imported
                  catalog or profile.This element provides an alternative to calling controls individually
                  from a catalog.
                  <div class="crosslink"><a href="../xml-reference/#/profile/import/include-all"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/imports/include-all">/profile/imports/include-all</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Insert All</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An object of type <a href="link.to.empty">empty</a> with key <code>include-all</code>.</p>
                  <p class="path">/profile/imports/include-all</p>
               </div>
               <p class="description">Insert all controls from the imported catalog or profile resources identified in the
                  <code>import</code> directive.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks in-use">
                     <p class="nb">(In use)</p>
                     <p>Identifies that all controls are to be included from the imported catalog or profile.</p>
                  </div>
                  <div class="remarks">
                     <p>This element provides an alternative to calling controls individually from a catalog.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/imports/include-controls" class="toc3 head">include-controls</h3>
                  <p>An array of Call objects</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Call</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>include-controls</code>.</p>
                        <p class="path">/profile/imports/include-controls</p>
                     </div>
                     <p class="description">Call a control by its ID</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks in-use">
                           <p class="nb">(In use)</p>
                           <p>Identifies a subset of controls to import from the referenced catalog or profile by
                              control identifier or match pattern.</p>
                        </div>
                        <div class="remarks">
                           <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                              this is how control enhancements are represented (as controls within controls), this
                              provides a way to include controls with all their dependent controls (enhancements)
                              without having to call them individually.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/import/include-controls"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/imports/include-controls">/profile/imports/include-controls</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An array  with key <code>include-controls</code>.</p>
                  <p class="path">/profile/imports/include-controls</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/imports/include-controls/with-child-controls" class="toc4 head">with-child-controls</h4>Include contained controls with controlWhen a control is included, whether its child
                     (dependent) controls are also included.
                     
                     Include child controls with an included control.
                     When importing a control, only include child controls that are also explicitly called.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/profile/import/include-controls/@with-child-controls"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/imports/include-controls/with-child-controls">/profile/imports/include-controls/with-child-controls</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Include contained controls with control</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>with-child-controls</code>.</p>
                     <p class="path">/profile/imports/include-controls/with-child-controls</p>
                  </div>
                  <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/imports/include-controls/with-ids" class="toc4 head">with-ids</h4>
                     <p>An array of Match Controls by Identifier strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Match Controls by Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> member of array <code>with-ids</code>.</p>
                           <p class="path">/profile/imports/include-controls/with-ids</p>
                        </div>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/import/include-controls/with-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/imports/include-controls/with-ids">/profile/imports/include-controls/with-ids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>with-ids</code>.</p>
                     <p class="path">/profile/imports/include-controls/with-ids</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/imports/include-controls/matching" class="toc4 head">matching</h4>
                     <p>An array of Match Controls by Pattern objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Match Controls by Pattern</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object of type <a href="link.to.empty">empty</a> member of array <code>matching</code>.</p>
                           <p class="path">/profile/imports/include-controls/matching</p>
                        </div>
                        <p class="description">Select controls by (regular expression) match on ID</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/import/include-controls/matching"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/imports/include-controls/matching">/profile/imports/include-controls/matching</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>matching</code>.</p>
                     <p class="path">/profile/imports/include-controls/matching</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/imports/include-controls/matching/pattern" class="toc5 head">pattern</h5>PatternA glob expression matching the IDs of one or more controls to be selected.
                        <div class="crosslink"><a href="../xml-reference/#/profile/import/include-controls/matching/@pattern"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/imports/include-controls/matching/pattern">/profile/imports/include-controls/matching/pattern</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Pattern</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>pattern</code>.</p>
                        <p class="path">/profile/imports/include-controls/matching/pattern</p>
                     </div>
                     <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                  </div>
               </section>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/imports/exclude-controls" class="toc3 head">exclude-controls</h3>
                  <p>An array of Call objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Call</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>exclude-controls</code>.</p>
                        <p class="path">/profile/imports/exclude-controls</p>
                     </div>
                     <p class="description">Call a control by its ID</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks in-use">
                           <p class="nb">(In use)</p>
                           <p>Identifies which controls to exclude, or eliminate, from the set of included controls
                              by control identifier or match pattern.</p>
                        </div>
                        <div class="remarks">
                           <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                              this is how control enhancements are represented (as controls within controls), this
                              provides a way to include controls with all their dependent controls (enhancements)
                              without having to call them individually.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/import/exclude-controls"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/imports/exclude-controls">/profile/imports/exclude-controls</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>exclude-controls</code>.</p>
                  <p class="path">/profile/imports/exclude-controls</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/imports/exclude-controls/with-child-controls" class="toc4 head">with-child-controls</h4>Include contained controls with controlWhen a control is included, whether its child
                     (dependent) controls are also included.
                     
                     Include child controls with an included control.
                     When importing a control, only include child controls that are also explicitly called.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/profile/import/exclude-controls/@with-child-controls"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/imports/exclude-controls/with-child-controls">/profile/imports/exclude-controls/with-child-controls</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Include contained controls with control</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>with-child-controls</code>.</p>
                     <p class="path">/profile/imports/exclude-controls/with-child-controls</p>
                  </div>
                  <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/imports/exclude-controls/with-ids" class="toc4 head">with-ids</h4>
                     <p>An array of Match Controls by Identifier strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Match Controls by Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> member of array <code>with-ids</code>.</p>
                           <p class="path">/profile/imports/exclude-controls/with-ids</p>
                        </div>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/import/exclude-controls/with-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/imports/exclude-controls/with-ids">/profile/imports/exclude-controls/with-ids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>with-ids</code>.</p>
                     <p class="path">/profile/imports/exclude-controls/with-ids</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/imports/exclude-controls/matching" class="toc4 head">matching</h4>
                     <p>An array of Match Controls by Pattern objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Match Controls by Pattern</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object of type <a href="link.to.empty">empty</a> member of array <code>matching</code>.</p>
                           <p class="path">/profile/imports/exclude-controls/matching</p>
                        </div>
                        <p class="description">Select controls by (regular expression) match on ID</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/import/exclude-controls/matching"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/imports/exclude-controls/matching">/profile/imports/exclude-controls/matching</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>matching</code>.</p>
                     <p class="path">/profile/imports/exclude-controls/matching</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/imports/exclude-controls/matching/pattern" class="toc5 head">pattern</h5>PatternA glob expression matching the IDs of one or more controls to be selected.
                        <div class="crosslink"><a href="../xml-reference/#/profile/import/exclude-controls/matching/@pattern"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/imports/exclude-controls/matching/pattern">/profile/imports/exclude-controls/matching/pattern</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Pattern</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>pattern</code>.</p>
                        <p class="path">/profile/imports/exclude-controls/matching/pattern</p>
                     </div>
                     <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                  </div>
               </section>
            </section>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/profile/merge" class="toc2 head">merge</h2>Merge controlsA Merge element merges controls in resolution.Combination ruleA Combine
               element defines whether and how to combine multiple (competing) versions of the same
               controlCombination methodHow clashing controls should be handled
               
               Use the first definition - the first control with a given ID is used; subsequent ones
               are discarded
               Merge - controls with the same ID are combined
               Keep - controls with the same ID are kept, retaining the clash
               
               Whenever combining controls from multiple (import) pathways, an issue arises of what
               to do with clashing invocations (multiple competing versions of a control). This setting
               permits a profile designer to apply a rule for the resolution of such cases. In a
               well-designed profile, such collisions would ordinarily be avoided, but this setting
               can be useful for defining what to do when it occurs.As isAn As-is element indicates
               that the controls should be structured in resolution as they are structured in their
               source catalogs. It does not contain any elements or attributes.Custom groupingA Custom
               element frames a structure for embedding represented controls in resolution.
               <p>An array of Control group objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Control group</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>groups</code>.</p>
                     <p class="path">/profile/merge/custom/groups</p>
                  </div>
                  <p class="description">A group of (selected) controls or of groups of controls</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>This construct mirrors the same construct that exists in an OSCAL catalog.</p>
                     </div>
                  </details>
               </div>
               <p>An array of Select controls objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Select controls</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>insert-controls</code>.</p>
                     <p class="path">/profile/merge/custom/insert-controls</p>
                  </div>
                  <p class="description">Specifies which controls to use in the containing context.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To be schema-valid, this element must contain either (but not both) a single <code>include-all</code> directive, or a sequence of <code>include-controls</code> directives.</p>
                        <p>If this directive is not provided, then no controls are to be inserted; i.e., all
                           controls are included explicitly.</p>
                     </div>
                  </details>
               </div>The custom element represents a custom arrangement or organization of controls in
               the resolution of a catalog.While the as-is element provides for a restitution of
               a control set's organization (in one or more source catalogs), this element permits
               the definition of an entirely different structure.The contents of the merge element
               may be used to reorder or restructure controls by indicating an order and/or structure
               in resolution.Implicitly, a merge element is also a filter: controls that are included
               in a profile, but not included (implicitly or explicitly) in the scope of a merge
               element, will not be merged into (will be dropped) in the resulting resolution.
               <div class="crosslink"><a href="../xml-reference/#/profile/merge"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/profile/merge">/profile/merge</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Merge controls</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An object  with key <code>merge</code>.</p>
               <p class="path">/profile/merge</p>
            </div>
            <p class="description">A Merge element merges controls in resolution.</p>
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
               <div class="remarks">
                  <p>The contents of the <code>merge</code> element may be used to <q>reorder</q> or <q>restructure</q> controls by indicating an order and/or structure in resolution.</p>
                  <p>Implicitly, a <code>merge</code> element is also a filter: controls that are included in a profile, but not included
                     (implicitly or explicitly) in the scope of a <code>merge</code> element, will not be merged into (will be dropped) in the resulting resolution.</p>
               </div>
            </details>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/merge/combine" class="toc3 head">combine</h3>Combination ruleA Combine element defines whether and how to combine multiple (competing)
                  versions of the same controlCombination methodHow clashing controls should be handled
                  
                  Use the first definition - the first control with a given ID is used; subsequent ones
                  are discarded
                  Merge - controls with the same ID are combined
                  Keep - controls with the same ID are kept, retaining the clash
                  
                  Whenever combining controls from multiple (import) pathways, an issue arises of what
                  to do with clashing invocations (multiple competing versions of a control). This setting
                  permits a profile designer to apply a rule for the resolution of such cases. In a
                  well-designed profile, such collisions would ordinarily be avoided, but this setting
                  can be useful for defining what to do when it occurs.
                  <div class="crosslink"><a href="../xml-reference/#/profile/merge/combine"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/merge/combine">/profile/merge/combine</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Combination rule</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An object of type <a href="link.to.empty">empty</a> with key <code>combine</code>.</p>
                  <p class="path">/profile/merge/combine</p>
               </div>
               <p class="description">A Combine element defines whether and how to combine multiple (competing) versions
                  of the same control</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Whenever combining controls from multiple (import) pathways, an issue arises of what
                        to do with clashing invocations (multiple competing versions of a control). </p>
                     <p>This setting permits a profile designer to apply a rule for the resolution of such
                        cases. In a well-designed profile, such collisions would ordinarily be avoided, but
                        this setting can be useful for defining what to do when it occurs.</p>
                  </div>
               </details>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/merge/combine/method" class="toc4 head">method</h4>Combination methodHow clashing controls should be handled
                     
                     Use the first definition - the first control with a given ID is used; subsequent ones
                     are discarded
                     Merge - controls with the same ID are combined
                     Keep - controls with the same ID are kept, retaining the clash
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/profile/merge/combine/@method"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/merge/combine/method">/profile/merge/combine/method</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Combination method</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>method</code>.</p>
                     <p class="path">/profile/merge/combine/method</p>
                  </div>
                  <p class="description">How clashing controls should be handled</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/merge/as-is" class="toc3 head">as-is</h3>As isAn As-is element indicates that the controls should be structured in resolution
                  as they are structured in their source catalogs. It does not contain any elements
                  or attributes.
                  <div class="crosslink"><a href="../xml-reference/#/profile/merge/as-is"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/merge/as-is">/profile/merge/as-is</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string As is</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.boolean">boolean</a> with key <code>as-is</code>.</p>
                  <p class="path">/profile/merge/as-is</p>
               </div>
               <p class="description">An As-is element indicates that the controls should be structured in resolution as
                  they are structured in their source catalogs. It does not contain any elements or
                  attributes.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/merge/custom" class="toc3 head">custom</h3>Custom groupingA Custom element frames a structure for embedding represented controls
                  in resolution.
                  <p>An array of Control group objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Control group</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>groups</code>.</p>
                        <p class="path">/profile/merge/custom/groups</p>
                     </div>
                     <p class="description">A group of (selected) controls or of groups of controls</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>This construct mirrors the same construct that exists in an OSCAL catalog.</p>
                        </div>
                     </details>
                  </div>
                  <p>An array of Select controls objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Select controls</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>insert-controls</code>.</p>
                        <p class="path">/profile/merge/custom/insert-controls</p>
                     </div>
                     <p class="description">Specifies which controls to use in the containing context.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>To be schema-valid, this element must contain either (but not both) a single <code>include-all</code> directive, or a sequence of <code>include-controls</code> directives.</p>
                           <p>If this directive is not provided, then no controls are to be inserted; i.e., all
                              controls are included explicitly.</p>
                        </div>
                     </details>
                  </div>The custom element represents a custom arrangement or organization of controls in
                  the resolution of a catalog.While the as-is element provides for a restitution of
                  a control set's organization (in one or more source catalogs), this element permits
                  the definition of an entirely different structure.
                  <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/merge/custom">/profile/merge/custom</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Custom grouping</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An object  with key <code>custom</code>.</p>
                  <p class="path">/profile/merge/custom</p>
               </div>
               <p class="description">A Custom element frames a structure for embedding represented controls in resolution.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>The <code>custom</code> element represents a custom arrangement or organization of controls in the resolution
                        of a catalog.</p>
                     <p>While the <code>as-is</code> element provides for a restitution of a control set's organization (in one or more
                        source catalogs), this element permits the definition of an entirely different structure.</p>
                  </div>
               </details>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/merge/custom/groups" class="toc4 head">groups</h4>
                     <p>An array of Control group objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Control group</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>groups</code>.</p>
                           <p class="path">/profile/merge/custom/groups</p>
                        </div>
                        <p class="description">A group of (selected) controls or of groups of controls</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>This construct mirrors the same construct that exists in an OSCAL catalog.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/merge/custom/groups">/profile/merge/custom/groups</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>groups</code>.</p>
                     <p class="path">/profile/merge/custom/groups</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/id" class="toc5 head">id</h5>Group IdentifierA unique identifier for a specific group instance that can be used
                        to reference the group within this and in other OSCAL documents. This identifier's
                        uniqueness is document scoped and is intended to be consistent for the same group
                        across minor revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/@id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/id">/profile/merge/custom/groups/id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Group Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                        <p class="path">/profile/merge/custom/groups/id</p>
                     </div>
                     <p class="description">A unique identifier for a specific group instance that can be used to reference the
                        group within this and in other OSCAL documents. This identifier's uniqueness is document
                        scoped and is intended to be consistent for the same group across minor revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/class" class="toc5 head">class</h5>Group ClassA textual label that provides a sub-type or characterization of the group.A
                        class can be used in validation rules to express extra constraints over named items
                        of a specific class value.A class can also be used in an OSCAL profile as a means
                        to target an alteration to control content.
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/class">/profile/merge/custom/groups/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Group Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/profile/merge/custom/groups/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the group.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                           <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                              content.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/title" class="toc5 head">title</h5>Group TitleA name given to the group, which may be used by a tool for display and
                        navigation.
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/title"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/title">/profile/merge/custom/groups/title</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Group Title</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                        <p class="path">/profile/merge/custom/groups/title</p>
                     </div>
                     <p class="description">A name given to the group, which may be used by a tool for display and navigation.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/params" class="toc5 head">params</h5>
                        <p>An array of Parameter objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Parameter</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>params</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params</p>
                           </div>
                           <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>In a catalog, a parameter is typically used as a placeholder for the future assignment
                                    of a parameter value, although the OSCAL model allows for the direct assignment of
                                    a value if desired by the control author. The <code>value</code> may be optionally used to specify one or more values. If no value is provided, then
                                    it is expected that the value will be provided at the Profile or Implementation layer.</p>
                                 <p>A parameter can include a variety of metadata options that support the future solicitation
                                    of one or more values. A <code>label</code> provides a textual placeholder that can be used in a tool to solicit parameter value
                                    input, or to display in catalog documentation. The <code>desc</code> provides a short description of what the parameter is used for, which can be used
                                    in tooling to help a user understand how to use the parameter. A <code>constraint</code> can be used to provide criteria for the allowed values. A <code>guideline</code> provides a recommendation for the use of a parameter.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/params">/profile/merge/custom/groups/params</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>params</code>.</p>
                        <p class="path">/profile/merge/custom/groups/params</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/id" class="toc6 head">id</h6>Parameter IdentifierA unique identifier for a specific parameter instance. This identifier's
                           uniqueness is document scoped and is intended to be consistent for the same parameter
                           across minor revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/@id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/id">/profile/merge/custom/groups/params/id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Identifier</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/id</p>
                        </div>
                        <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                           is document scoped and is intended to be consistent for the same parameter across
                           minor revisions of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/class" class="toc6 head">class</h6>Parameter ClassA textual label that provides a characterization of the parameter.A
                           class can be used in validation rules to express extra constraints over named items
                           of a specific class value.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/class">/profile/merge/custom/groups/params/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/class</p>
                        </div>
                        <p class="description">A textual label that provides a characterization of the parameter.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/depends-on" class="toc6 head">depends-on</h6>Depends onAnother parameter invoking this one
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/@depends-on"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/depends-on">/profile/merge/custom/groups/params/depends-on</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Depends on</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>depends-on</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/depends-on</p>
                        </div>
                        <p class="description">Another parameter invoking this one</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/props" class="toc6 head">props</h6>
                           <p>An array of Property objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Property</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>props</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/params/props</p>
                              </div>
                              <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                                 qualified name/value pair. The value of a property is a simple scalar value, which
                                 may be expressed as a list of values.</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>Properties permit the deployment and management of arbitrary controlled values, within
                                       OSCAL objects. A property can be included for any purpose useful to an application
                                       or implementation. Typically, properties will be used to sort, filter, select, order,
                                       and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                       an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                       lexical composition of properties may be constrained by external processes to ensure
                                       consistency.</p>
                                    <p>Property allows for associated remarks that describe why the specific property value
                                       was applied to the containing object, or the significance of the value in the context
                                       of the containing object.</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/prop"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/props">/profile/merge/custom/groups/params/props</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>props</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/props</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/props/name" class="toc7 head">name</h7>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                              or quality of the property's containing object.
                              
                              A label or descriptor that is tied to a sensitivity or classification marking system.
                              An optional class can be used to define the specific marking system used for the associated
                              value.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/props/name">/profile/merge/custom/groups/params/props/name</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/props/name</p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/props/uuid" class="toc7 head">uuid</h7>Property Universally Unique IdentifierA unique identifier that can be used to reference
                              this property elsewhere in an OSCAL document. A UUID should be consistently used for
                              a given location across revisions of the document.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/props/uuid">/profile/merge/custom/groups/params/props/uuid</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/props/uuid</p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/props/ns" class="toc7 head">ns</h7>Property NamespaceA namespace qualifying the property's name. This allows different
                              organizations to associate distinct semantics with the same name.Provides a means
                              to segment the value space for the name, so that different organizations and individuals
                              can assert control over the allowed names and associated values used in a property.
                              This allows the semantics associated with a given name/value pair to be defined on
                              an organization-by-organization basis.An organization MUST use a URI that they have
                              control over. e.g., a domain registered to the organization in a URI, a registered
                              uniform resource names (URN) namespace.When a ns is not provided, its value should
                              be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                              by the associated OSCAL model.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/props/ns">/profile/merge/custom/groups/params/props/ns</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/props/ns</p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                    names and associated values used in a property. This allows the semantics associated
                                    with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                 <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                    to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                 <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/props/value" class="toc7 head">value</h7>Property ValueIndicates the value of the attribute, characteristic, or quality.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/props/value">/profile/merge/custom/groups/params/props/value</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/props/value</p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/props/class" class="toc7 head">class</h7>Property ClassA textual label that provides a sub-type or characterization of the
                              property's name. This can be used to further distinguish or discriminate between the
                              semantics of multiple properties of the same object with the same name and ns. A class
                              can be used in validation rules to express extra constraints over named items of a
                              specific class value.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/props/class">/profile/merge/custom/groups/params/props/class</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/props/class</p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                    a specific <code>class</code> value.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/props/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/props/remarks">/profile/merge/custom/groups/params/props/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/props/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/links" class="toc6 head">links</h6>
                           <p>An array of Link objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Link</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>links</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/params/links</p>
                              </div>
                              <p class="description">A reference to a local or remote resource</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                       a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                    <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/link"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/links">/profile/merge/custom/groups/params/links</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>links</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/links</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/links/href" class="toc7 head">href</h7>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                              can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a back-matter resource in the same document.If a local reference using
                              a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                              which references an identified resource in the document's back-matter or another object
                              that is within the scope of the containing OSCAL document.If an internet resource
                              is used, the href value will be an absolute or relative URI pointing to the location
                              of the referenced resource. A relative URI will be resolved relative to the location
                              of the document containing the link.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/links/href">/profile/merge/custom/groups/params/links/href</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/links/href</p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                    that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                 <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                    "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                 <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                    resource. A relative URI will be resolved relative to the location of the document
                                    containing the link.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/links/rel" class="toc7 head">rel</h7>RelationDescribes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.
                              
                              Reference
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/links/rel">/profile/merge/custom/groups/params/links/rel</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/links/rel</p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/links/media-type" class="toc7 head">media-type</h7>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                              (IANA) Media Types Registry. 
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/links/media-type">/profile/merge/custom/groups/params/links/media-type</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/links/media-type</p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/links/text" class="toc7 head">text</h7>Link TextA textual label to associate with the link, which may be used for presentation
                              in a tool.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/link/text"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/links/text">/profile/merge/custom/groups/params/links/text</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/links/text</p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/label" class="toc6 head">label</h6>Parameter LabelA short, placeholder name for the parameter, which can be used as a
                           substitute for a value if no value is assigned.The label value should be suitable
                           for inline display in a rendered catalog.The label value should be suitable for inline
                           display in a rendered catalog.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/label"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/label">/profile/merge/custom/groups/params/label</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Label</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>label</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/label</p>
                        </div>
                        <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                           a <code>value</code> if no value is assigned.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>The label value should be suitable for inline display in a rendered catalog.</p>
                           </div>
                           <div class="remarks">
                              <p>The label value should be suitable for inline display in a rendered catalog.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/usage" class="toc6 head">usage</h6>Parameter Usage DescriptionDescribes the purpose and use of a parameter
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/usage"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/usage">/profile/merge/custom/groups/params/usage</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Usage Description</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>usage</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/usage</p>
                        </div>
                        <p class="description">Describes the purpose and use of a parameter</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/constraints" class="toc6 head">constraints</h6>
                           <p>An array of Constraint objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Constraint</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>constraints</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/params/constraints</p>
                              </div>
                              <p class="description">A formal or informal expression of a constraint or test</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/constraint"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/constraints">/profile/merge/custom/groups/params/constraints</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>constraints</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/constraints</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/constraints/description" class="toc7 head">description</h7>Constraint DescriptionA textual summary of the constraint to be applied.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/constraint/description"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/constraints/description">/profile/merge/custom/groups/params/constraints/description</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Constraint Description</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/constraints/description</p>
                           </div>
                           <p class="description">A textual summary of the constraint to be applied.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/constraints/tests" class="toc7 head">tests</h7>
                              <p>An array of Constraint Test objects</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">object Constraint Test</p>
                                    <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                    <p>An object  member of array <code>tests</code>.</p>
                                    <p class="path">/profile/merge/custom/groups/params/constraints/tests</p>
                                 </div>
                                 <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/constraint/test"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/constraints/tests">/profile/merge/custom/groups/params/constraints/tests</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>tests</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/constraints/tests</p>
                           </div>
                        </div>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/profile/merge/custom/groups/params/constraints/tests/expression" class="toc8 head">expression</h8>Constraint testA formal (executable) expression of a constraint
                                 <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/constraint/test/expression"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/constraints/tests/expression">/profile/merge/custom/groups/params/constraints/tests/expression</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Constraint test</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> with key <code>expression</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/params/constraints/tests/expression</p>
                              </div>
                              <p class="description">A formal (executable) expression of a constraint</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/profile/merge/custom/groups/params/constraints/tests/remarks" class="toc8 head">remarks</h8>RemarksAdditional commentary on the containing object.
                                 <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/constraint/test/remarks"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/constraints/tests/remarks">/profile/merge/custom/groups/params/constraints/tests/remarks</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Remarks</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/params/constraints/tests/remarks</p>
                              </div>
                              <p class="description">Additional commentary on the containing object.</p>
                           </div>
                        </section>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/guidelines" class="toc6 head">guidelines</h6>
                           <p>An array of Guideline objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Guideline</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>guidelines</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/params/guidelines</p>
                              </div>
                              <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/guidelines">/profile/merge/custom/groups/params/guidelines</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>guidelines</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/guidelines</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/guidelines/prose" class="toc7 head">prose</h7>Guideline TextProse permits multiple paragraphs, lists, tables etc.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/guidelines/prose">/profile/merge/custom/groups/params/guidelines/prose</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Guideline Text</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/guidelines/prose</p>
                           </div>
                           <p class="description">Prose permits multiple paragraphs, lists, tables etc.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/values" class="toc6 head">values</h6>
                           <p>An array of Parameter Value strings</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Parameter Value</p>
                                 <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/params/values</p>
                              </div>
                              <p class="description">A parameter value or set of values.</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks in-use">
                                    <p class="nb">(In use)</p>
                                    <p>A set of values provided in a catalog can be redefined at any higher layer of OSCAL
                                       (e.g., Profile).</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/values">/profile/merge/custom/groups/params/values</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>values</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/values</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/select" class="toc6 head">select</h6>SelectionPresenting a choice among alternativesParameter CardinalityDescribes the
                           number of selections that must occur.
                           <p>An array of Choice strings</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Choice</p>
                                 <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/params/select/choice</p>
                              </div>
                              <p class="description">A value selection among several such options</p>
                           </div>A set of parameter value choices, that may be picked from to set the parameter value.A
                           set of parameter value choices, that may be picked from to set the parameter value.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/select"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/select">/profile/merge/custom/groups/params/select</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Selection</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An object  with key <code>select</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/select</p>
                        </div>
                        <p class="description">Presenting a choice among alternatives</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                           </div>
                           <div class="remarks">
                              <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                           </div>
                        </details>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/select/how-many" class="toc7 head">how-many</h7>Parameter CardinalityDescribes the number of selections that must occur.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/select/@how-many"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/select/how-many">/profile/merge/custom/groups/params/select/how-many</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Parameter Cardinality</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>how-many</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/select/how-many</p>
                           </div>
                           <p class="description">Describes the number of selections that must occur.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/params/select/choice" class="toc7 head">choice</h7>
                              <p>An array of Choice strings</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">string Choice</p>
                                    <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                    <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                                    <p class="path">/profile/merge/custom/groups/params/select/choice</p>
                                 </div>
                                 <p class="description">A value selection among several such options</p>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/select/choice"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/select/choice">/profile/merge/custom/groups/params/select/choice</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>choice</code>.</p>
                              <p class="path">/profile/merge/custom/groups/params/select/choice</p>
                           </div>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/params/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/param/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/params/remarks">/profile/merge/custom/groups/params/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/profile/merge/custom/groups/params/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/props" class="toc5 head">props</h5>
                        <p>An array of Property objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Property</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>props</code>.</p>
                              <p class="path">/profile/merge/custom/groups/props</p>
                           </div>
                           <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                              qualified name/value pair. The value of a property is a simple scalar value, which
                              may be expressed as a list of values.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Properties permit the deployment and management of arbitrary controlled values, within
                                    OSCAL objects. A property can be included for any purpose useful to an application
                                    or implementation. Typically, properties will be used to sort, filter, select, order,
                                    and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                    an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                    lexical composition of properties may be constrained by external processes to ensure
                                    consistency.</p>
                                 <p>Property allows for associated remarks that describe why the specific property value
                                    was applied to the containing object, or the significance of the value in the context
                                    of the containing object.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/prop"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/props">/profile/merge/custom/groups/props</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>props</code>.</p>
                        <p class="path">/profile/merge/custom/groups/props</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/props/name" class="toc6 head">name</h6>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                           or quality of the property's containing object.
                           
                           A label or descriptor that is tied to a sensitivity or classification marking system.
                           An optional class can be used to define the specific marking system used for the associated
                           value.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/props/name">/profile/merge/custom/groups/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/profile/merge/custom/groups/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/props/uuid" class="toc6 head">uuid</h6>Property Universally Unique IdentifierA unique identifier that can be used to reference
                           this property elsewhere in an OSCAL document. A UUID should be consistently used for
                           a given location across revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/props/uuid">/profile/merge/custom/groups/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/profile/merge/custom/groups/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/props/ns" class="toc6 head">ns</h6>Property NamespaceA namespace qualifying the property's name. This allows different
                           organizations to associate distinct semantics with the same name.Provides a means
                           to segment the value space for the name, so that different organizations and individuals
                           can assert control over the allowed names and associated values used in a property.
                           This allows the semantics associated with a given name/value pair to be defined on
                           an organization-by-organization basis.An organization MUST use a URI that they have
                           control over. e.g., a domain registered to the organization in a URI, a registered
                           uniform resource names (URN) namespace.When a ns is not provided, its value should
                           be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                           by the associated OSCAL model.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/props/ns">/profile/merge/custom/groups/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/profile/merge/custom/groups/props/ns</p>
                        </div>
                        <p class="description">A namespace qualifying the property's name. This allows different organizations to
                           associate distinct semantics with the same name.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated values used in a property. This allows the semantics associated
                                 with a given name/value pair to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/props/value" class="toc6 head">value</h6>Property ValueIndicates the value of the attribute, characteristic, or quality.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/props/value">/profile/merge/custom/groups/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/profile/merge/custom/groups/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/props/class" class="toc6 head">class</h6>Property ClassA textual label that provides a sub-type or characterization of the
                           property's name. This can be used to further distinguish or discriminate between the
                           semantics of multiple properties of the same object with the same name and ns. A class
                           can be used in validation rules to express extra constraints over named items of a
                           specific class value.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/props/class">/profile/merge/custom/groups/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/profile/merge/custom/groups/props/class</p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/props/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/props/remarks">/profile/merge/custom/groups/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/profile/merge/custom/groups/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/links" class="toc5 head">links</h5>
                        <p>An array of Link objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Link</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>links</code>.</p>
                              <p class="path">/profile/merge/custom/groups/links</p>
                           </div>
                           <p class="description">A reference to a local or remote resource</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                    a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                 <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/link"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/links">/profile/merge/custom/groups/links</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>links</code>.</p>
                        <p class="path">/profile/merge/custom/groups/links</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/links/href" class="toc6 head">href</h6>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                           can be an internet resource, or a local reference using a fragment e.g. #fragment
                           that points to a back-matter resource in the same document.If a local reference using
                           a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                           which references an identified resource in the document's back-matter or another object
                           that is within the scope of the containing OSCAL document.If an internet resource
                           is used, the href value will be an absolute or relative URI pointing to the location
                           of the referenced resource. A relative URI will be resolved relative to the location
                           of the document containing the link.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/links/href">/profile/merge/custom/groups/links/href</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                           <p class="path">/profile/merge/custom/groups/links/href</p>
                        </div>
                        <p class="description">A resolvable URL reference to a resource.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                 that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                              <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                 "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                              <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                 resource. A relative URI will be resolved relative to the location of the document
                                 containing the link.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/links/rel" class="toc6 head">rel</h6>RelationDescribes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.
                           
                           Reference
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/links/rel">/profile/merge/custom/groups/links/rel</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                           <p class="path">/profile/merge/custom/groups/links/rel</p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/links/media-type" class="toc6 head">media-type</h6>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                           (IANA) Media Types Registry. 
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/links/media-type">/profile/merge/custom/groups/links/media-type</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                           <p class="path">/profile/merge/custom/groups/links/media-type</p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/links/text" class="toc6 head">text</h6>Link TextA textual label to associate with the link, which may be used for presentation
                           in a tool.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/link/text"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/links/text">/profile/merge/custom/groups/links/text</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                           <p class="path">/profile/merge/custom/groups/links/text</p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/parts" class="toc5 head">parts</h5>
                        <p>An array of Part objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Part</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>parts</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts</p>
                           </div>
                           <p class="description">A partition of a control's definition or a child of another part.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                                    (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                                    hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                                 <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                                    within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                                    a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                                 <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                                    <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                                    Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                                    Each organization is responsible for governance of their own extensions, and is strongly
                                    encouraged to publish their extensions as standards to their user community. If no
                                    <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                                 <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                                    DNS or other globally defined organization name should be used. For example, if FedRAMP
                                    and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                                 <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                                    extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                                    extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts">/profile/merge/custom/groups/parts</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>parts</code>.</p>
                        <p class="path">/profile/merge/custom/groups/parts</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/id" class="toc6 head">id</h6>Part IdentifierA unique identifier for a specific part instance. This identifier's
                           uniqueness is document scoped and is intended to be consistent for the same part across
                           minor revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/@id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/id">/profile/merge/custom/groups/parts/id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/id</p>
                        </div>
                        <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                           document scoped and is intended to be consistent for the same part across minor revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/name" class="toc6 head">name</h6>Part NameA textual label that uniquely identifies the part's semantic type.
                           
                           
                           An introduction to a control or a group of controls.
                           A set of control implementation requirements.
                           An individual item within a control statement.
                           Additional information to consider when selecting, implementing, assessing, and monitoring
                           a control.
                           Describes a set of assessment objectives.
                           Describes a method-based assessment over a set of assessment objects.
                           Provides a list of assessment objects.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/@name"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/name">/profile/merge/custom/groups/parts/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/ns" class="toc6 head">ns</h6>Part NamespaceA namespace qualifying the part's name. This allows different organizations
                           to associate distinct semantics with the same name.Provides a means to segment the
                           value space for the name, so that different organizations and individuals can assert
                           control over the allowed names and associated text used in a part. This allows the
                           semantics associated with a given name to be defined on an organization-by-organization
                           basis.An organization MUST use a URI that they have control over. e.g., a domain registered
                           to the organization in a URI, a registered uniform resource names (URN) namespace.When
                           a ns is not provided, its value should be assumed to be http://csrc.nist.gov/ns/oscal
                           and the name should be a name defined by the associated OSCAL model.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/ns">/profile/merge/custom/groups/parts/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/ns</p>
                        </div>
                        <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                           distinct semantics with the same name.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated text used in a part. This allows the semantics associated with
                                 a given name to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/class" class="toc6 head">class</h6>Part ClassA textual label that provides a sub-type or characterization of the part's
                           name. This can be used to further distinguish or discriminate between the semantics
                           of multiple parts of the same control with the same name and ns. A class can be used
                           in validation rules to express extra constraints over named items of a specific class
                           value.A class can also be used in an OSCAL profile as a means to target an alteration
                           to control content.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/class">/profile/merge/custom/groups/parts/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/class</p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                              <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                                 content.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/title" class="toc6 head">title</h6>Part TitleA name given to the part, which may be used by a tool for display and navigation.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/title"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/title">/profile/merge/custom/groups/parts/title</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Title</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/title</p>
                        </div>
                        <p class="description">A name given to the part, which may be used by a tool for display and navigation.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/props" class="toc6 head">props</h6>
                           <p>An array of Property objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Property</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>props</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/parts/props</p>
                              </div>
                              <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                                 qualified name/value pair. The value of a property is a simple scalar value, which
                                 may be expressed as a list of values.</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>Properties permit the deployment and management of arbitrary controlled values, within
                                       OSCAL objects. A property can be included for any purpose useful to an application
                                       or implementation. Typically, properties will be used to sort, filter, select, order,
                                       and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                       an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                       lexical composition of properties may be constrained by external processes to ensure
                                       consistency.</p>
                                    <p>Property allows for associated remarks that describe why the specific property value
                                       was applied to the containing object, or the significance of the value in the context
                                       of the containing object.</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/prop"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/props">/profile/merge/custom/groups/parts/props</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>props</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/props</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/props/name" class="toc7 head">name</h7>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                              or quality of the property's containing object.
                              
                              A label or descriptor that is tied to a sensitivity or classification marking system.
                              An optional class can be used to define the specific marking system used for the associated
                              value.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/props/name">/profile/merge/custom/groups/parts/props/name</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/props/name</p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/props/uuid" class="toc7 head">uuid</h7>Property Universally Unique IdentifierA unique identifier that can be used to reference
                              this property elsewhere in an OSCAL document. A UUID should be consistently used for
                              a given location across revisions of the document.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/props/uuid">/profile/merge/custom/groups/parts/props/uuid</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/props/uuid</p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/props/ns" class="toc7 head">ns</h7>Property NamespaceA namespace qualifying the property's name. This allows different
                              organizations to associate distinct semantics with the same name.Provides a means
                              to segment the value space for the name, so that different organizations and individuals
                              can assert control over the allowed names and associated values used in a property.
                              This allows the semantics associated with a given name/value pair to be defined on
                              an organization-by-organization basis.An organization MUST use a URI that they have
                              control over. e.g., a domain registered to the organization in a URI, a registered
                              uniform resource names (URN) namespace.When a ns is not provided, its value should
                              be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                              by the associated OSCAL model.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/props/ns">/profile/merge/custom/groups/parts/props/ns</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/props/ns</p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                    names and associated values used in a property. This allows the semantics associated
                                    with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                 <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                    to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                 <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/props/value" class="toc7 head">value</h7>Property ValueIndicates the value of the attribute, characteristic, or quality.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/props/value">/profile/merge/custom/groups/parts/props/value</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/props/value</p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/props/class" class="toc7 head">class</h7>Property ClassA textual label that provides a sub-type or characterization of the
                              property's name. This can be used to further distinguish or discriminate between the
                              semantics of multiple properties of the same object with the same name and ns. A class
                              can be used in validation rules to express extra constraints over named items of a
                              specific class value.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/props/class">/profile/merge/custom/groups/parts/props/class</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/props/class</p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                    a specific <code>class</code> value.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/props/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/props/remarks">/profile/merge/custom/groups/parts/props/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/props/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/prose" class="toc6 head">prose</h6>Part TextPermits multiple paragraphs, lists, tables etc.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/prose">/profile/merge/custom/groups/parts/prose</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/prose</p>
                        </div>
                        <p class="description">Permits multiple paragraphs, lists, tables etc.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/parts" class="toc6 head">parts</h6>
                           <p>An array of Part objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Part</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>parts</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/parts/parts</p>
                              </div>
                              <p class="description">A partition of a control's definition or a child of another part.</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                                       (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                                       hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                                    <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                                       within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                                       a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                                    <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                                       <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                                       Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                                       Each organization is responsible for governance of their own extensions, and is strongly
                                       encouraged to publish their extensions as standards to their user community. If no
                                       <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                                    <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                                       DNS or other globally defined organization name should be used. For example, if FedRAMP
                                       and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                                    <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                                       extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                                       extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/part"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/parts">/profile/merge/custom/groups/parts/parts</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>parts</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/parts</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/parts/links" class="toc6 head">links</h6>
                           <p>An array of Link objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Link</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>links</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/parts/links</p>
                              </div>
                              <p class="description">A reference to a local or remote resource</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                       a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                    <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/link"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/links">/profile/merge/custom/groups/parts/links</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>links</code>.</p>
                           <p class="path">/profile/merge/custom/groups/parts/links</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/links/href" class="toc7 head">href</h7>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                              can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a back-matter resource in the same document.If a local reference using
                              a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                              which references an identified resource in the document's back-matter or another object
                              that is within the scope of the containing OSCAL document.If an internet resource
                              is used, the href value will be an absolute or relative URI pointing to the location
                              of the referenced resource. A relative URI will be resolved relative to the location
                              of the document containing the link.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/links/href">/profile/merge/custom/groups/parts/links/href</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/links/href</p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                    that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                 <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                    "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                 <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                    resource. A relative URI will be resolved relative to the location of the document
                                    containing the link.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/links/rel" class="toc7 head">rel</h7>RelationDescribes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.
                              
                              Reference
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/links/rel">/profile/merge/custom/groups/parts/links/rel</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/links/rel</p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/links/media-type" class="toc7 head">media-type</h7>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                              (IANA) Media Types Registry. 
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/links/media-type">/profile/merge/custom/groups/parts/links/media-type</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/links/media-type</p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/parts/links/text" class="toc7 head">text</h7>Link TextA textual label to associate with the link, which may be used for presentation
                              in a tool.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/part/link/text"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/parts/links/text">/profile/merge/custom/groups/parts/links/text</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                              <p class="path">/profile/merge/custom/groups/parts/links/text</p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                        </div>
                     </section>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/groups" class="toc5 head">groups</h5>
                        <p>An array of Control group objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Control group</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>groups</code>.</p>
                              <p class="path">/profile/merge/custom/groups/groups</p>
                           </div>
                           <p class="description">A group of (selected) controls or of groups of controls</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>This construct mirrors the same construct that exists in an OSCAL catalog.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/group"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/groups">/profile/merge/custom/groups/groups</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>groups</code>.</p>
                        <p class="path">/profile/merge/custom/groups/groups</p>
                     </div>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/groups/insert-controls" class="toc5 head">insert-controls</h5>
                        <p>An array of Select controls objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Select controls</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>insert-controls</code>.</p>
                              <p class="path">/profile/merge/custom/groups/insert-controls</p>
                           </div>
                           <p class="description">Specifies which controls to use in the containing context.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>To be schema-valid, this element must contain either (but not both) a single <code>include-all</code> directive, or a sequence of <code>include-controls</code> directives.</p>
                                 <p>If this directive is not provided, then no controls are to be inserted; i.e., all
                                    controls are included explicitly.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls">/profile/merge/custom/groups/insert-controls</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>insert-controls</code>.</p>
                        <p class="path">/profile/merge/custom/groups/insert-controls</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/insert-controls/order" class="toc6 head">order</h6>OrderA designation of how a selection of controls in a profile is to be ordered.
                           
                           
                           
                           
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/@order"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/order">/profile/merge/custom/groups/insert-controls/order</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Order</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>order</code>.</p>
                           <p class="path">/profile/merge/custom/groups/insert-controls/order</p>
                        </div>
                        <p class="description">A designation of how a selection of controls in a profile is to be ordered.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/insert-controls/include-all" class="toc6 head">include-all</h6>Insert AllInsert all controls from the imported catalog or profile resources identified
                           in the import directive.This element provides an alternative to calling controls individually
                           from a catalog.
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/include-all"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/include-all">/profile/merge/custom/groups/insert-controls/include-all</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Insert All</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An object of type <a href="link.to.empty">empty</a> with key <code>include-all</code>.</p>
                           <p class="path">/profile/merge/custom/groups/insert-controls/include-all</p>
                        </div>
                        <p class="description">Insert all controls from the imported catalog or profile resources identified in the
                           <code>import</code> directive.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>This element provides an alternative to calling controls individually from a catalog.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/insert-controls/include-controls" class="toc6 head">include-controls</h6>
                           <p>An array of Call objects</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Call</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>include-controls</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/insert-controls/include-controls</p>
                              </div>
                              <p class="description">Call a control by its ID</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                                       this is how control enhancements are represented (as controls within controls), this
                                       provides a way to include controls with all their dependent controls (enhancements)
                                       without having to call them individually.</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/include-controls"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/include-controls">/profile/merge/custom/groups/insert-controls/include-controls</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An array  with key <code>include-controls</code>.</p>
                           <p class="path">/profile/merge/custom/groups/insert-controls/include-controls</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/insert-controls/include-controls/with-child-controls" class="toc7 head">with-child-controls</h7>Include contained controls with controlWhen a control is included, whether its child
                              (dependent) controls are also included.
                              
                              Include child controls with an included control.
                              When importing a control, only include child controls that are also explicitly called.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/include-controls/@with-child-controls"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/include-controls/with-child-controls">/profile/merge/custom/groups/insert-controls/include-controls/with-child-controls</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Include contained controls with control</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>with-child-controls</code>.</p>
                              <p class="path">/profile/merge/custom/groups/insert-controls/include-controls/with-child-controls</p>
                           </div>
                           <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/insert-controls/include-controls/with-ids" class="toc7 head">with-ids</h7>
                              <p>An array of Match Controls by Identifier strings</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">string Match Controls by Identifier</p>
                                    <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                    <p>A string of type <a href="link.to.NCName">NCName</a> member of array <code>with-ids</code>.</p>
                                    <p class="path">/profile/merge/custom/groups/insert-controls/include-controls/with-ids</p>
                                 </div>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/include-controls/with-id"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/include-controls/with-ids">/profile/merge/custom/groups/insert-controls/include-controls/with-ids</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>with-ids</code>.</p>
                              <p class="path">/profile/merge/custom/groups/insert-controls/include-controls/with-ids</p>
                           </div>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/insert-controls/include-controls/matching" class="toc7 head">matching</h7>
                              <p>An array of Match Controls by Pattern objects</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">object Match Controls by Pattern</p>
                                    <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                    <p>An object of type <a href="link.to.empty">empty</a> member of array <code>matching</code>.</p>
                                    <p class="path">/profile/merge/custom/groups/insert-controls/include-controls/matching</p>
                                 </div>
                                 <p class="description">Select controls by (regular expression) match on ID</p>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/include-controls/matching"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/include-controls/matching">/profile/merge/custom/groups/insert-controls/include-controls/matching</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>matching</code>.</p>
                              <p class="path">/profile/merge/custom/groups/insert-controls/include-controls/matching</p>
                           </div>
                        </div>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/profile/merge/custom/groups/insert-controls/include-controls/matching/pattern" class="toc8 head">pattern</h8>PatternA glob expression matching the IDs of one or more controls to be selected.
                                 <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/include-controls/matching/@pattern"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/include-controls/matching/pattern">/profile/merge/custom/groups/insert-controls/include-controls/matching/pattern</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Pattern</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> with key <code>pattern</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/insert-controls/include-controls/matching/pattern</p>
                              </div>
                              <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                           </div>
                        </section>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/groups/insert-controls/exclude-controls" class="toc6 head">exclude-controls</h6>
                           <p>An array of Call objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Call</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>exclude-controls</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/insert-controls/exclude-controls</p>
                              </div>
                              <p class="description">Call a control by its ID</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks in-use">
                                    <p class="nb">(In use)</p>
                                    <p>Identifies which controls to exclude, or eliminate, from the set of matching includes.</p>
                                 </div>
                                 <div class="remarks">
                                    <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                                       this is how control enhancements are represented (as controls within controls), this
                                       provides a way to include controls with all their dependent controls (enhancements)
                                       without having to call them individually.</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/exclude-controls"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/exclude-controls">/profile/merge/custom/groups/insert-controls/exclude-controls</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>exclude-controls</code>.</p>
                           <p class="path">/profile/merge/custom/groups/insert-controls/exclude-controls</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/insert-controls/exclude-controls/with-child-controls" class="toc7 head">with-child-controls</h7>Include contained controls with controlWhen a control is included, whether its child
                              (dependent) controls are also included.
                              
                              Include child controls with an included control.
                              When importing a control, only include child controls that are also explicitly called.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/exclude-controls/@with-child-controls"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/exclude-controls/with-child-controls">/profile/merge/custom/groups/insert-controls/exclude-controls/with-child-controls</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Include contained controls with control</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>with-child-controls</code>.</p>
                              <p class="path">/profile/merge/custom/groups/insert-controls/exclude-controls/with-child-controls</p>
                           </div>
                           <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/insert-controls/exclude-controls/with-ids" class="toc7 head">with-ids</h7>
                              <p>An array of Match Controls by Identifier strings</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">string Match Controls by Identifier</p>
                                    <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                    <p>A string of type <a href="link.to.NCName">NCName</a> member of array <code>with-ids</code>.</p>
                                    <p class="path">/profile/merge/custom/groups/insert-controls/exclude-controls/with-ids</p>
                                 </div>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/exclude-controls/with-id"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/exclude-controls/with-ids">/profile/merge/custom/groups/insert-controls/exclude-controls/with-ids</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>with-ids</code>.</p>
                              <p class="path">/profile/merge/custom/groups/insert-controls/exclude-controls/with-ids</p>
                           </div>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/groups/insert-controls/exclude-controls/matching" class="toc7 head">matching</h7>
                              <p>An array of Match Controls by Pattern objects</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">object Match Controls by Pattern</p>
                                    <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                    <p>An object of type <a href="link.to.empty">empty</a> member of array <code>matching</code>.</p>
                                    <p class="path">/profile/merge/custom/groups/insert-controls/exclude-controls/matching</p>
                                 </div>
                                 <p class="description">Select controls by (regular expression) match on ID</p>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/exclude-controls/matching"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/exclude-controls/matching">/profile/merge/custom/groups/insert-controls/exclude-controls/matching</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>matching</code>.</p>
                              <p class="path">/profile/merge/custom/groups/insert-controls/exclude-controls/matching</p>
                           </div>
                        </div>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/profile/merge/custom/groups/insert-controls/exclude-controls/matching/pattern" class="toc8 head">pattern</h8>PatternA glob expression matching the IDs of one or more controls to be selected.
                                 <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/group/insert-controls/exclude-controls/matching/@pattern"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/profile/merge/custom/groups/insert-controls/exclude-controls/matching/pattern">/profile/merge/custom/groups/insert-controls/exclude-controls/matching/pattern</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Pattern</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> with key <code>pattern</code>.</p>
                                 <p class="path">/profile/merge/custom/groups/insert-controls/exclude-controls/matching/pattern</p>
                              </div>
                              <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                           </div>
                        </section>
                     </section>
                  </section>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/merge/custom/insert-controls" class="toc4 head">insert-controls</h4>
                     <p>An array of Select controls objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Select controls</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>insert-controls</code>.</p>
                           <p class="path">/profile/merge/custom/insert-controls</p>
                        </div>
                        <p class="description">Specifies which controls to use in the containing context.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To be schema-valid, this element must contain either (but not both) a single <code>include-all</code> directive, or a sequence of <code>include-controls</code> directives.</p>
                              <p>If this directive is not provided, then no controls are to be inserted; i.e., all
                                 controls are included explicitly.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls">/profile/merge/custom/insert-controls</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>insert-controls</code>.</p>
                     <p class="path">/profile/merge/custom/insert-controls</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/insert-controls/order" class="toc5 head">order</h5>OrderA designation of how a selection of controls in a profile is to be ordered.
                        
                        
                        
                        
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/@order"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/order">/profile/merge/custom/insert-controls/order</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Order</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>order</code>.</p>
                        <p class="path">/profile/merge/custom/insert-controls/order</p>
                     </div>
                     <p class="description">A designation of how a selection of controls in a profile is to be ordered.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/insert-controls/include-all" class="toc5 head">include-all</h5>Insert AllInsert all controls from the imported catalog or profile resources identified
                        in the import directive.This element provides an alternative to calling controls individually
                        from a catalog.
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/include-all"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/include-all">/profile/merge/custom/insert-controls/include-all</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Insert All</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An object of type <a href="link.to.empty">empty</a> with key <code>include-all</code>.</p>
                        <p class="path">/profile/merge/custom/insert-controls/include-all</p>
                     </div>
                     <p class="description">Insert all controls from the imported catalog or profile resources identified in the
                        <code>import</code> directive.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>This element provides an alternative to calling controls individually from a catalog.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/insert-controls/include-controls" class="toc5 head">include-controls</h5>
                        <p>An array of Call objects</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Call</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>include-controls</code>.</p>
                              <p class="path">/profile/merge/custom/insert-controls/include-controls</p>
                           </div>
                           <p class="description">Call a control by its ID</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                                    this is how control enhancements are represented (as controls within controls), this
                                    provides a way to include controls with all their dependent controls (enhancements)
                                    without having to call them individually.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/include-controls"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/include-controls">/profile/merge/custom/insert-controls/include-controls</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An array  with key <code>include-controls</code>.</p>
                        <p class="path">/profile/merge/custom/insert-controls/include-controls</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/insert-controls/include-controls/with-child-controls" class="toc6 head">with-child-controls</h6>Include contained controls with controlWhen a control is included, whether its child
                           (dependent) controls are also included.
                           
                           Include child controls with an included control.
                           When importing a control, only include child controls that are also explicitly called.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/include-controls/@with-child-controls"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/include-controls/with-child-controls">/profile/merge/custom/insert-controls/include-controls/with-child-controls</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Include contained controls with control</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>with-child-controls</code>.</p>
                           <p class="path">/profile/merge/custom/insert-controls/include-controls/with-child-controls</p>
                        </div>
                        <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/insert-controls/include-controls/with-ids" class="toc6 head">with-ids</h6>
                           <p>An array of Match Controls by Identifier strings</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Match Controls by Identifier</p>
                                 <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.NCName">NCName</a> member of array <code>with-ids</code>.</p>
                                 <p class="path">/profile/merge/custom/insert-controls/include-controls/with-ids</p>
                              </div>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/include-controls/with-id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/include-controls/with-ids">/profile/merge/custom/insert-controls/include-controls/with-ids</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>with-ids</code>.</p>
                           <p class="path">/profile/merge/custom/insert-controls/include-controls/with-ids</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/insert-controls/include-controls/matching" class="toc6 head">matching</h6>
                           <p>An array of Match Controls by Pattern objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Match Controls by Pattern</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object of type <a href="link.to.empty">empty</a> member of array <code>matching</code>.</p>
                                 <p class="path">/profile/merge/custom/insert-controls/include-controls/matching</p>
                              </div>
                              <p class="description">Select controls by (regular expression) match on ID</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/include-controls/matching"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/include-controls/matching">/profile/merge/custom/insert-controls/include-controls/matching</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>matching</code>.</p>
                           <p class="path">/profile/merge/custom/insert-controls/include-controls/matching</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/insert-controls/include-controls/matching/pattern" class="toc7 head">pattern</h7>PatternA glob expression matching the IDs of one or more controls to be selected.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/include-controls/matching/@pattern"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/include-controls/matching/pattern">/profile/merge/custom/insert-controls/include-controls/matching/pattern</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Pattern</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>pattern</code>.</p>
                              <p class="path">/profile/merge/custom/insert-controls/include-controls/matching/pattern</p>
                           </div>
                           <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                        </div>
                     </section>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/merge/custom/insert-controls/exclude-controls" class="toc5 head">exclude-controls</h5>
                        <p>An array of Call objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Call</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>exclude-controls</code>.</p>
                              <p class="path">/profile/merge/custom/insert-controls/exclude-controls</p>
                           </div>
                           <p class="description">Call a control by its ID</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks in-use">
                                 <p class="nb">(In use)</p>
                                 <p>Identifies which controls to exclude, or eliminate, from the set of matching includes.</p>
                              </div>
                              <div class="remarks">
                                 <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                                    this is how control enhancements are represented (as controls within controls), this
                                    provides a way to include controls with all their dependent controls (enhancements)
                                    without having to call them individually.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/exclude-controls"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/exclude-controls">/profile/merge/custom/insert-controls/exclude-controls</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>exclude-controls</code>.</p>
                        <p class="path">/profile/merge/custom/insert-controls/exclude-controls</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/insert-controls/exclude-controls/with-child-controls" class="toc6 head">with-child-controls</h6>Include contained controls with controlWhen a control is included, whether its child
                           (dependent) controls are also included.
                           
                           Include child controls with an included control.
                           When importing a control, only include child controls that are also explicitly called.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/exclude-controls/@with-child-controls"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/exclude-controls/with-child-controls">/profile/merge/custom/insert-controls/exclude-controls/with-child-controls</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Include contained controls with control</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>with-child-controls</code>.</p>
                           <p class="path">/profile/merge/custom/insert-controls/exclude-controls/with-child-controls</p>
                        </div>
                        <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/insert-controls/exclude-controls/with-ids" class="toc6 head">with-ids</h6>
                           <p>An array of Match Controls by Identifier strings</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Match Controls by Identifier</p>
                                 <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.NCName">NCName</a> member of array <code>with-ids</code>.</p>
                                 <p class="path">/profile/merge/custom/insert-controls/exclude-controls/with-ids</p>
                              </div>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/exclude-controls/with-id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/exclude-controls/with-ids">/profile/merge/custom/insert-controls/exclude-controls/with-ids</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>with-ids</code>.</p>
                           <p class="path">/profile/merge/custom/insert-controls/exclude-controls/with-ids</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/merge/custom/insert-controls/exclude-controls/matching" class="toc6 head">matching</h6>
                           <p>An array of Match Controls by Pattern objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Match Controls by Pattern</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object of type <a href="link.to.empty">empty</a> member of array <code>matching</code>.</p>
                                 <p class="path">/profile/merge/custom/insert-controls/exclude-controls/matching</p>
                              </div>
                              <p class="description">Select controls by (regular expression) match on ID</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/exclude-controls/matching"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/exclude-controls/matching">/profile/merge/custom/insert-controls/exclude-controls/matching</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>matching</code>.</p>
                           <p class="path">/profile/merge/custom/insert-controls/exclude-controls/matching</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/merge/custom/insert-controls/exclude-controls/matching/pattern" class="toc7 head">pattern</h7>PatternA glob expression matching the IDs of one or more controls to be selected.
                              <div class="crosslink"><a href="../xml-reference/#/profile/merge/custom/insert-controls/exclude-controls/matching/@pattern"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/merge/custom/insert-controls/exclude-controls/matching/pattern">/profile/merge/custom/insert-controls/exclude-controls/matching/pattern</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Pattern</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>pattern</code>.</p>
                              <p class="path">/profile/merge/custom/insert-controls/exclude-controls/matching/pattern</p>
                           </div>
                           <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                        </div>
                     </section>
                  </section>
               </section>
            </section>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/profile/modify" class="toc2 head">modify</h2>Modify controlsSet parameters or amend controls in resolution
               <p>An array of Parameter Setting objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Parameter Setting</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>set-parameters</code>.</p>
                     <p class="path">/profile/modify/set-parameters</p>
                  </div>
                  <p class="description">A parameter setting, to be propagated to points of insertion</p>
               </div>
               <p>An array of Alteration objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Alteration</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>alters</code>.</p>
                     <p class="path">/profile/modify/alters</p>
                  </div>
                  <p class="description">An Alter element specifies changes to be made to an included control when a profile
                     is resolved.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Use <code>@control-id</code> to indicate the scope of alteration.</p>
                        <p>It is an error for two <code>alter</code> elements to apply to the same control. In practice, multiple alterations can be applied
                           (together), but it creates confusion.</p>
                        <p>At present, no provision is made for altering many controls at once (for example,
                           to systematically remove properties or add global properties); extending this element
                           to match multiple control IDs could provide for this.</p>
                     </div>
                  </details>
               </div>
               <div class="crosslink"><a href="../xml-reference/#/profile/modify"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/profile/modify">/profile/modify</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Modify controls</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An object  with key <code>modify</code>.</p>
               <p class="path">/profile/modify</p>
            </div>
            <p class="description">Set parameters or amend controls in resolution</p>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/modify/set-parameters" class="toc3 head">set-parameters</h3>
                  <p>An array of Parameter Setting objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Parameter Setting</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>set-parameters</code>.</p>
                        <p class="path">/profile/modify/set-parameters</p>
                     </div>
                     <p class="description">A parameter setting, to be propagated to points of insertion</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/modify/set-parameters">/profile/modify/set-parameters</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>set-parameters</code>.</p>
                  <p class="path">/profile/modify/set-parameters</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/param-id" class="toc4 head">param-id</h4>Parameter IDIndicates the value of the 'id' flag on a target parameter; i.e. which
                     parameter to set
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/@param-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/param-id">/profile/modify/set-parameters/param-id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter ID</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>param-id</code>.</p>
                     <p class="path">/profile/modify/set-parameters/param-id</p>
                  </div>
                  <p class="description">Indicates the value of the 'id' flag on a target parameter; i.e. which parameter to
                     set</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/class" class="toc4 head">class</h4>Parameter ClassA textual label that provides a characterization of the parameter.A
                     class can be used in validation rules to express extra constraints over named items
                     of a specific class value.
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/@class"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/class">/profile/modify/set-parameters/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/profile/modify/set-parameters/class</p>
                  </div>
                  <p class="description">A textual label that provides a characterization of the parameter.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                           a specific <code>class</code> value.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/depends-on" class="toc4 head">depends-on</h4>Depends onAnother parameter invoking this one
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/@depends-on"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/depends-on">/profile/modify/set-parameters/depends-on</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Depends on</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>depends-on</code>.</p>
                     <p class="path">/profile/modify/set-parameters/depends-on</p>
                  </div>
                  <p class="description">Another parameter invoking this one</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/profile/modify/set-parameters/props</p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/props">/profile/modify/set-parameters/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/profile/modify/set-parameters/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/props/name">/profile/modify/set-parameters/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/profile/modify/set-parameters/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/props/uuid">/profile/modify/set-parameters/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/profile/modify/set-parameters/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/props/ns">/profile/modify/set-parameters/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/profile/modify/set-parameters/props/ns</p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/props/value">/profile/modify/set-parameters/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/profile/modify/set-parameters/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/props/class">/profile/modify/set-parameters/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/profile/modify/set-parameters/props/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/props/remarks">/profile/modify/set-parameters/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/profile/modify/set-parameters/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/profile/modify/set-parameters/links</p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/links">/profile/modify/set-parameters/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/profile/modify/set-parameters/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/links/href">/profile/modify/set-parameters/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/profile/modify/set-parameters/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/links/rel">/profile/modify/set-parameters/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/profile/modify/set-parameters/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/links/media-type">/profile/modify/set-parameters/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/profile/modify/set-parameters/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/links/text">/profile/modify/set-parameters/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/profile/modify/set-parameters/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/label" class="toc4 head">label</h4>Parameter LabelA short, placeholder name for the parameter, which can be used as a
                     substitute for a value if no value is assigned.The label value should be suitable
                     for inline display in a rendered catalog.The label value should be suitable for inline
                     display in a rendered catalog.
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/label"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/label">/profile/modify/set-parameters/label</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Label</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>label</code>.</p>
                     <p class="path">/profile/modify/set-parameters/label</p>
                  </div>
                  <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                     a <code>value</code> if no value is assigned.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The label value should be suitable for inline display in a rendered catalog.</p>
                     </div>
                     <div class="remarks">
                        <p>The label value should be suitable for inline display in a rendered catalog.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/usage" class="toc4 head">usage</h4>Parameter Usage DescriptionDescribes the purpose and use of a parameter
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/usage"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/usage">/profile/modify/set-parameters/usage</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Usage Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>usage</code>.</p>
                     <p class="path">/profile/modify/set-parameters/usage</p>
                  </div>
                  <p class="description">Describes the purpose and use of a parameter</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/constraints" class="toc4 head">constraints</h4>
                     <p>An array of Constraint objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Constraint</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>constraints</code>.</p>
                           <p class="path">/profile/modify/set-parameters/constraints</p>
                        </div>
                        <p class="description">A formal or informal expression of a constraint or test</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/constraint"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/constraints">/profile/modify/set-parameters/constraints</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>constraints</code>.</p>
                     <p class="path">/profile/modify/set-parameters/constraints</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/constraints/description" class="toc5 head">description</h5>Constraint DescriptionA textual summary of the constraint to be applied.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/constraint/description"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/constraints/description">/profile/modify/set-parameters/constraints/description</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Constraint Description</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                        <p class="path">/profile/modify/set-parameters/constraints/description</p>
                     </div>
                     <p class="description">A textual summary of the constraint to be applied.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/constraints/tests" class="toc5 head">tests</h5>
                        <p>An array of Constraint Test objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Constraint Test</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>tests</code>.</p>
                              <p class="path">/profile/modify/set-parameters/constraints/tests</p>
                           </div>
                           <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/constraint/test"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/constraints/tests">/profile/modify/set-parameters/constraints/tests</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>tests</code>.</p>
                        <p class="path">/profile/modify/set-parameters/constraints/tests</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/set-parameters/constraints/tests/expression" class="toc6 head">expression</h6>Constraint testA formal (executable) expression of a constraint
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/constraint/test/expression"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/set-parameters/constraints/tests/expression">/profile/modify/set-parameters/constraints/tests/expression</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Constraint test</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>expression</code>.</p>
                           <p class="path">/profile/modify/set-parameters/constraints/tests/expression</p>
                        </div>
                        <p class="description">A formal (executable) expression of a constraint</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/set-parameters/constraints/tests/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/constraint/test/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/set-parameters/constraints/tests/remarks">/profile/modify/set-parameters/constraints/tests/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/profile/modify/set-parameters/constraints/tests/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/guidelines" class="toc4 head">guidelines</h4>
                     <p>An array of Guideline objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Guideline</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>guidelines</code>.</p>
                           <p class="path">/profile/modify/set-parameters/guidelines</p>
                        </div>
                        <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/guideline"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/guidelines">/profile/modify/set-parameters/guidelines</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>guidelines</code>.</p>
                     <p class="path">/profile/modify/set-parameters/guidelines</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/guidelines/prose" class="toc5 head">prose</h5>Guideline TextProse permits multiple paragraphs, lists, tables etc.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/guideline"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/guidelines/prose">/profile/modify/set-parameters/guidelines/prose</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Guideline Text</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                        <p class="path">/profile/modify/set-parameters/guidelines/prose</p>
                     </div>
                     <p class="description">Prose permits multiple paragraphs, lists, tables etc.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/values" class="toc4 head">values</h4>
                     <p>An array of Parameter Value strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Value</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                           <p class="path">/profile/modify/set-parameters/values</p>
                        </div>
                        <p class="description">A parameter value or set of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>Used to (re)define a parameter value.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/value"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/values">/profile/modify/set-parameters/values</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>values</code>.</p>
                     <p class="path">/profile/modify/set-parameters/values</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/set-parameters/select" class="toc4 head">select</h4>SelectionPresenting a choice among alternativesParameter CardinalityDescribes the
                     number of selections that must occur.
                     <p>An array of Choice strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Choice</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                           <p class="path">/profile/modify/set-parameters/select/choice</p>
                        </div>
                        <p class="description">A value selection among several such options</p>
                     </div>A set of parameter value choices, that may be picked from to set the parameter value.
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/select"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/set-parameters/select">/profile/modify/set-parameters/select</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Selection</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object  with key <code>select</code>.</p>
                     <p class="path">/profile/modify/set-parameters/select</p>
                  </div>
                  <p class="description">Presenting a choice among alternatives</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/select/how-many" class="toc5 head">how-many</h5>Parameter CardinalityDescribes the number of selections that must occur.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/select/@how-many"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/select/how-many">/profile/modify/set-parameters/select/how-many</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter Cardinality</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>how-many</code>.</p>
                        <p class="path">/profile/modify/set-parameters/select/how-many</p>
                     </div>
                     <p class="description">Describes the number of selections that must occur.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/set-parameters/select/choice" class="toc5 head">choice</h5>
                        <p>An array of Choice strings</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Choice</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                              <p class="path">/profile/modify/set-parameters/select/choice</p>
                           </div>
                           <p class="description">A value selection among several such options</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/set-parameter/select/choice"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/set-parameters/select/choice">/profile/modify/set-parameters/select/choice</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>choice</code>.</p>
                        <p class="path">/profile/modify/set-parameters/select/choice</p>
                     </div>
                  </div>
               </section>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/modify/alters" class="toc3 head">alters</h3>
                  <p>An array of Alteration objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Alteration</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>alters</code>.</p>
                        <p class="path">/profile/modify/alters</p>
                     </div>
                     <p class="description">An Alter element specifies changes to be made to an included control when a profile
                        is resolved.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Use <code>@control-id</code> to indicate the scope of alteration.</p>
                           <p>It is an error for two <code>alter</code> elements to apply to the same control. In practice, multiple alterations can be applied
                              (together), but it creates confusion.</p>
                           <p>At present, no provision is made for altering many controls at once (for example,
                              to systematically remove properties or add global properties); extending this element
                              to match multiple control IDs could provide for this.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/modify/alters">/profile/modify/alters</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>alters</code>.</p>
                  <p class="path">/profile/modify/alters</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/alters/control-id" class="toc4 head">control-id</h4>Control Identifier ReferenceA reference to a control with a corresponding id value.
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/@control-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/alters/control-id">/profile/modify/alters/control-id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Control Identifier Reference</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>control-id</code>.</p>
                     <p class="path">/profile/modify/alters/control-id</p>
                  </div>
                  <p class="description">A reference to a control with a corresponding <code>id</code> value.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/alters/removes" class="toc4 head">removes</h4>
                     <p>An array of Removal objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Removal</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object of type <a href="link.to.empty">empty</a> member of array <code>removes</code>.</p>
                           <p class="path">/profile/modify/alters/removes</p>
                        </div>
                        <p class="description">Specifies objects to be removed from a control based on specific aspects of the object
                           that must all match.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Use <code>name-ref</code>, <code>class-ref</code>, <code>id-ref</code> or <code>generic-identifier</code> to indicate class tokens or ID reference, or the formal name, of the component to
                                 be removed or erased from a control, when a catalog is resolved. The control affected
                                 is indicated by the pointer on the removal's parent (containing) <code>alter</code> element.</p>
                              <p>To change an element, use <code>remove</code> to remove the element, then <code>add</code> to add it back again with changes.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/remove"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/alters/removes">/profile/modify/alters/removes</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>removes</code>.</p>
                     <p class="path">/profile/modify/alters/removes</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/removes/by-name" class="toc5 head">by-name</h5>Reference by (assigned) nameIdentify items to remove by matching their assigned name
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/remove/@by-name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/removes/by-name">/profile/modify/alters/removes/by-name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Reference by (assigned) name</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>by-name</code>.</p>
                        <p class="path">/profile/modify/alters/removes/by-name</p>
                     </div>
                     <p class="description">Identify items to remove by matching their assigned name</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/removes/by-class" class="toc5 head">by-class</h5>Reference by classIdentify items to remove by matching their class.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/remove/@by-class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/removes/by-class">/profile/modify/alters/removes/by-class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Reference by class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>by-class</code>.</p>
                        <p class="path">/profile/modify/alters/removes/by-class</p>
                     </div>
                     <p class="description">Identify items to remove by matching their <code>class</code>.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/removes/by-id" class="toc5 head">by-id</h5>Reference by IDIdentify items to remove indicated by their id.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/remove/@by-id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/removes/by-id">/profile/modify/alters/removes/by-id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Reference by ID</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>by-id</code>.</p>
                        <p class="path">/profile/modify/alters/removes/by-id</p>
                     </div>
                     <p class="description">Identify items to remove indicated by their <code>id</code>.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/removes/by-item-name" class="toc5 head">by-item-name</h5>Item Name ReferenceIdentify items to remove by the name of the item's information
                        element name, e.g. title or prop
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/remove/@by-item-name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/removes/by-item-name">/profile/modify/alters/removes/by-item-name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Item Name Reference</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>by-item-name</code>.</p>
                        <p class="path">/profile/modify/alters/removes/by-item-name</p>
                     </div>
                     <p class="description">Identify items to remove by the name of the item's information element name, e.g.
                        <code>title</code> or <code>prop</code></p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/removes/by-ns" class="toc5 head">by-ns</h5>Item Namespace ReferenceIdentify items to remove by the item's ns, which is the namespace
                        associated with a part, or prop.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/remove/@by-ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/removes/by-ns">/profile/modify/alters/removes/by-ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Item Namespace Reference</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>by-ns</code>.</p>
                        <p class="path">/profile/modify/alters/removes/by-ns</p>
                     </div>
                     <p class="description">Identify items to remove by the item's <code>ns</code>, which is the namespace associated with a <code>part</code>, or <code>prop</code>.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/modify/alters/adds" class="toc4 head">adds</h4>
                     <p>An array of Addition objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Addition</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>adds</code>.</p>
                           <p class="path">/profile/modify/alters/adds</p>
                        </div>
                        <p class="description">Specifies contents to be added into controls, in resolution</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>When no <code>id-ref</code> is given, the addition is inserted into the control targeted by the alteration at
                                 the start or end as indicated by <code>position</code>. Only <code>position</code> values of "starting" or "ending" are permitted when there is no <code>id-ref</code>.</p>
                              <p><code>id-ref</code>, when given, should indicate, by its ID, an element inside the control to serve as
                                 the anchor point for the addition. In this case, <code>position</code> value may be any of the permitted values.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/modify/alters/adds">/profile/modify/alters/adds</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>adds</code>.</p>
                     <p class="path">/profile/modify/alters/adds</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/adds/position" class="toc5 head">position</h5>PositionWhere to add the new content with respect to the targeted element (beside
                        it or inside it)
                        
                        Preceding the id-ref target
                        Following the id-ref target
                        Inside the control or id-ref target, at the start
                        Inside the control or id-ref target, at the end
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/@position"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/adds/position">/profile/modify/alters/adds/position</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Position</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>position</code>.</p>
                        <p class="path">/profile/modify/alters/adds/position</p>
                     </div>
                     <p class="description">Where to add the new content with respect to the targeted element (beside it or inside
                        it)</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/adds/by-id" class="toc5 head">by-id</h5>Reference by IDTarget location of the addition.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/@by-id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/adds/by-id">/profile/modify/alters/adds/by-id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Reference by ID</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>by-id</code>.</p>
                        <p class="path">/profile/modify/alters/adds/by-id</p>
                     </div>
                     <p class="description">Target location of the addition.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/adds/title" class="toc5 head">title</h5>Title ChangeA name given to the control, which may be used by a tool for display and
                        navigation.
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/title"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/adds/title">/profile/modify/alters/adds/title</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Title Change</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                        <p class="path">/profile/modify/alters/adds/title</p>
                     </div>
                     <p class="description">A name given to the control, which may be used by a tool for display and navigation.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/adds/params" class="toc5 head">params</h5>
                        <p>An array of Parameter objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Parameter</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>params</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params</p>
                           </div>
                           <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>In a catalog, a parameter is typically used as a placeholder for the future assignment
                                    of a parameter value, although the OSCAL model allows for the direct assignment of
                                    a value if desired by the control author. The <code>value</code> may be optionally used to specify one or more values. If no value is provided, then
                                    it is expected that the value will be provided at the Profile or Implementation layer.</p>
                                 <p>A parameter can include a variety of metadata options that support the future solicitation
                                    of one or more values. A <code>label</code> provides a textual placeholder that can be used in a tool to solicit parameter value
                                    input, or to display in catalog documentation. The <code>desc</code> provides a short description of what the parameter is used for, which can be used
                                    in tooling to help a user understand how to use the parameter. A <code>constraint</code> can be used to provide criteria for the allowed values. A <code>guideline</code> provides a recommendation for the use of a parameter.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/adds/params">/profile/modify/alters/adds/params</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>params</code>.</p>
                        <p class="path">/profile/modify/alters/adds/params</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/id" class="toc6 head">id</h6>Parameter IdentifierA unique identifier for a specific parameter instance. This identifier's
                           uniqueness is document scoped and is intended to be consistent for the same parameter
                           across minor revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/@id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/id">/profile/modify/alters/adds/params/id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Identifier</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/id</p>
                        </div>
                        <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                           is document scoped and is intended to be consistent for the same parameter across
                           minor revisions of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/class" class="toc6 head">class</h6>Parameter ClassA textual label that provides a characterization of the parameter.A
                           class can be used in validation rules to express extra constraints over named items
                           of a specific class value.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/class">/profile/modify/alters/adds/params/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/class</p>
                        </div>
                        <p class="description">A textual label that provides a characterization of the parameter.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/depends-on" class="toc6 head">depends-on</h6>Depends onAnother parameter invoking this one
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/@depends-on"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/depends-on">/profile/modify/alters/adds/params/depends-on</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Depends on</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>depends-on</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/depends-on</p>
                        </div>
                        <p class="description">Another parameter invoking this one</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/props" class="toc6 head">props</h6>
                           <p>An array of Property objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Property</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>props</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/params/props</p>
                              </div>
                              <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                                 qualified name/value pair. The value of a property is a simple scalar value, which
                                 may be expressed as a list of values.</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>Properties permit the deployment and management of arbitrary controlled values, within
                                       OSCAL objects. A property can be included for any purpose useful to an application
                                       or implementation. Typically, properties will be used to sort, filter, select, order,
                                       and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                       an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                       lexical composition of properties may be constrained by external processes to ensure
                                       consistency.</p>
                                    <p>Property allows for associated remarks that describe why the specific property value
                                       was applied to the containing object, or the significance of the value in the context
                                       of the containing object.</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/prop"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/props">/profile/modify/alters/adds/params/props</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>props</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/props</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/props/name" class="toc7 head">name</h7>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                              or quality of the property's containing object.
                              
                              A label or descriptor that is tied to a sensitivity or classification marking system.
                              An optional class can be used to define the specific marking system used for the associated
                              value.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/props/name">/profile/modify/alters/adds/params/props/name</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/props/name</p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/props/uuid" class="toc7 head">uuid</h7>Property Universally Unique IdentifierA unique identifier that can be used to reference
                              this property elsewhere in an OSCAL document. A UUID should be consistently used for
                              a given location across revisions of the document.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/props/uuid">/profile/modify/alters/adds/params/props/uuid</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/props/uuid</p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/props/ns" class="toc7 head">ns</h7>Property NamespaceA namespace qualifying the property's name. This allows different
                              organizations to associate distinct semantics with the same name.Provides a means
                              to segment the value space for the name, so that different organizations and individuals
                              can assert control over the allowed names and associated values used in a property.
                              This allows the semantics associated with a given name/value pair to be defined on
                              an organization-by-organization basis.An organization MUST use a URI that they have
                              control over. e.g., a domain registered to the organization in a URI, a registered
                              uniform resource names (URN) namespace.When a ns is not provided, its value should
                              be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                              by the associated OSCAL model.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/props/ns">/profile/modify/alters/adds/params/props/ns</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/props/ns</p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                    names and associated values used in a property. This allows the semantics associated
                                    with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                 <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                    to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                 <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/props/value" class="toc7 head">value</h7>Property ValueIndicates the value of the attribute, characteristic, or quality.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/props/value">/profile/modify/alters/adds/params/props/value</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/props/value</p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/props/class" class="toc7 head">class</h7>Property ClassA textual label that provides a sub-type or characterization of the
                              property's name. This can be used to further distinguish or discriminate between the
                              semantics of multiple properties of the same object with the same name and ns. A class
                              can be used in validation rules to express extra constraints over named items of a
                              specific class value.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/props/class">/profile/modify/alters/adds/params/props/class</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/props/class</p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                    a specific <code>class</code> value.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/props/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/props/remarks">/profile/modify/alters/adds/params/props/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/props/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/links" class="toc6 head">links</h6>
                           <p>An array of Link objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Link</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>links</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/params/links</p>
                              </div>
                              <p class="description">A reference to a local or remote resource</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                       a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                    <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/link"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/links">/profile/modify/alters/adds/params/links</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>links</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/links</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/links/href" class="toc7 head">href</h7>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                              can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a back-matter resource in the same document.If a local reference using
                              a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                              which references an identified resource in the document's back-matter or another object
                              that is within the scope of the containing OSCAL document.If an internet resource
                              is used, the href value will be an absolute or relative URI pointing to the location
                              of the referenced resource. A relative URI will be resolved relative to the location
                              of the document containing the link.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/links/href">/profile/modify/alters/adds/params/links/href</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/links/href</p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                    that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                 <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                    "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                 <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                    resource. A relative URI will be resolved relative to the location of the document
                                    containing the link.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/links/rel" class="toc7 head">rel</h7>RelationDescribes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.
                              
                              Reference
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/links/rel">/profile/modify/alters/adds/params/links/rel</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/links/rel</p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/links/media-type" class="toc7 head">media-type</h7>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                              (IANA) Media Types Registry. 
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/links/media-type">/profile/modify/alters/adds/params/links/media-type</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/links/media-type</p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/links/text" class="toc7 head">text</h7>Link TextA textual label to associate with the link, which may be used for presentation
                              in a tool.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/link/text"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/links/text">/profile/modify/alters/adds/params/links/text</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/links/text</p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/label" class="toc6 head">label</h6>Parameter LabelA short, placeholder name for the parameter, which can be used as a
                           substitute for a value if no value is assigned.The label value should be suitable
                           for inline display in a rendered catalog.The label value should be suitable for inline
                           display in a rendered catalog.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/label"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/label">/profile/modify/alters/adds/params/label</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Label</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>label</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/label</p>
                        </div>
                        <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                           a <code>value</code> if no value is assigned.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>The label value should be suitable for inline display in a rendered catalog.</p>
                           </div>
                           <div class="remarks">
                              <p>The label value should be suitable for inline display in a rendered catalog.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/usage" class="toc6 head">usage</h6>Parameter Usage DescriptionDescribes the purpose and use of a parameter
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/usage"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/usage">/profile/modify/alters/adds/params/usage</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Usage Description</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>usage</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/usage</p>
                        </div>
                        <p class="description">Describes the purpose and use of a parameter</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/constraints" class="toc6 head">constraints</h6>
                           <p>An array of Constraint objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Constraint</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>constraints</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/params/constraints</p>
                              </div>
                              <p class="description">A formal or informal expression of a constraint or test</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/constraint"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/constraints">/profile/modify/alters/adds/params/constraints</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>constraints</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/constraints</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/constraints/description" class="toc7 head">description</h7>Constraint DescriptionA textual summary of the constraint to be applied.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/constraint/description"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/constraints/description">/profile/modify/alters/adds/params/constraints/description</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Constraint Description</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/constraints/description</p>
                           </div>
                           <p class="description">A textual summary of the constraint to be applied.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/constraints/tests" class="toc7 head">tests</h7>
                              <p>An array of Constraint Test objects</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">object Constraint Test</p>
                                    <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                    <p>An object  member of array <code>tests</code>.</p>
                                    <p class="path">/profile/modify/alters/adds/params/constraints/tests</p>
                                 </div>
                                 <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/constraint/test"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/constraints/tests">/profile/modify/alters/adds/params/constraints/tests</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>tests</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/constraints/tests</p>
                           </div>
                        </div>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/profile/modify/alters/adds/params/constraints/tests/expression" class="toc8 head">expression</h8>Constraint testA formal (executable) expression of a constraint
                                 <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/constraint/test/expression"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/constraints/tests/expression">/profile/modify/alters/adds/params/constraints/tests/expression</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Constraint test</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> with key <code>expression</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/params/constraints/tests/expression</p>
                              </div>
                              <p class="description">A formal (executable) expression of a constraint</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/profile/modify/alters/adds/params/constraints/tests/remarks" class="toc8 head">remarks</h8>RemarksAdditional commentary on the containing object.
                                 <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/constraint/test/remarks"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/constraints/tests/remarks">/profile/modify/alters/adds/params/constraints/tests/remarks</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Remarks</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/params/constraints/tests/remarks</p>
                              </div>
                              <p class="description">Additional commentary on the containing object.</p>
                           </div>
                        </section>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/guidelines" class="toc6 head">guidelines</h6>
                           <p>An array of Guideline objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Guideline</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>guidelines</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/params/guidelines</p>
                              </div>
                              <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/guidelines">/profile/modify/alters/adds/params/guidelines</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>guidelines</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/guidelines</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/guidelines/prose" class="toc7 head">prose</h7>Guideline TextProse permits multiple paragraphs, lists, tables etc.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/guidelines/prose">/profile/modify/alters/adds/params/guidelines/prose</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Guideline Text</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/guidelines/prose</p>
                           </div>
                           <p class="description">Prose permits multiple paragraphs, lists, tables etc.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/values" class="toc6 head">values</h6>
                           <p>An array of Parameter Value strings</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Parameter Value</p>
                                 <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/params/values</p>
                              </div>
                              <p class="description">A parameter value or set of values.</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks in-use">
                                    <p class="nb">(In use)</p>
                                    <p>A set of values provided in a catalog can be redefined at any higher layer of OSCAL
                                       (e.g., Profile).</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/values">/profile/modify/alters/adds/params/values</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>values</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/values</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/select" class="toc6 head">select</h6>SelectionPresenting a choice among alternativesParameter CardinalityDescribes the
                           number of selections that must occur.
                           <p>An array of Choice strings</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Choice</p>
                                 <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/params/select/choice</p>
                              </div>
                              <p class="description">A value selection among several such options</p>
                           </div>A set of parameter value choices, that may be picked from to set the parameter value.A
                           set of parameter value choices, that may be picked from to set the parameter value.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/select"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/select">/profile/modify/alters/adds/params/select</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Selection</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An object  with key <code>select</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/select</p>
                        </div>
                        <p class="description">Presenting a choice among alternatives</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                           </div>
                           <div class="remarks">
                              <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                           </div>
                        </details>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/select/how-many" class="toc7 head">how-many</h7>Parameter CardinalityDescribes the number of selections that must occur.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/select/@how-many"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/select/how-many">/profile/modify/alters/adds/params/select/how-many</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Parameter Cardinality</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>how-many</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/select/how-many</p>
                           </div>
                           <p class="description">Describes the number of selections that must occur.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/params/select/choice" class="toc7 head">choice</h7>
                              <p>An array of Choice strings</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">string Choice</p>
                                    <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                    <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                                    <p class="path">/profile/modify/alters/adds/params/select/choice</p>
                                 </div>
                                 <p class="description">A value selection among several such options</p>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/select/choice"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/select/choice">/profile/modify/alters/adds/params/select/choice</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>choice</code>.</p>
                              <p class="path">/profile/modify/alters/adds/params/select/choice</p>
                           </div>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/params/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/param/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/params/remarks">/profile/modify/alters/adds/params/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/profile/modify/alters/adds/params/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/adds/props" class="toc5 head">props</h5>
                        <p>An array of Property objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Property</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>props</code>.</p>
                              <p class="path">/profile/modify/alters/adds/props</p>
                           </div>
                           <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                              qualified name/value pair. The value of a property is a simple scalar value, which
                              may be expressed as a list of values.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Properties permit the deployment and management of arbitrary controlled values, within
                                    OSCAL objects. A property can be included for any purpose useful to an application
                                    or implementation. Typically, properties will be used to sort, filter, select, order,
                                    and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                    an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                    lexical composition of properties may be constrained by external processes to ensure
                                    consistency.</p>
                                 <p>Property allows for associated remarks that describe why the specific property value
                                    was applied to the containing object, or the significance of the value in the context
                                    of the containing object.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/prop"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/adds/props">/profile/modify/alters/adds/props</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>props</code>.</p>
                        <p class="path">/profile/modify/alters/adds/props</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/props/name" class="toc6 head">name</h6>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                           or quality of the property's containing object.
                           
                           A label or descriptor that is tied to a sensitivity or classification marking system.
                           An optional class can be used to define the specific marking system used for the associated
                           value.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/props/name">/profile/modify/alters/adds/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/profile/modify/alters/adds/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/props/uuid" class="toc6 head">uuid</h6>Property Universally Unique IdentifierA unique identifier that can be used to reference
                           this property elsewhere in an OSCAL document. A UUID should be consistently used for
                           a given location across revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/props/uuid">/profile/modify/alters/adds/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/profile/modify/alters/adds/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/props/ns" class="toc6 head">ns</h6>Property NamespaceA namespace qualifying the property's name. This allows different
                           organizations to associate distinct semantics with the same name.Provides a means
                           to segment the value space for the name, so that different organizations and individuals
                           can assert control over the allowed names and associated values used in a property.
                           This allows the semantics associated with a given name/value pair to be defined on
                           an organization-by-organization basis.An organization MUST use a URI that they have
                           control over. e.g., a domain registered to the organization in a URI, a registered
                           uniform resource names (URN) namespace.When a ns is not provided, its value should
                           be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                           by the associated OSCAL model.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/props/ns">/profile/modify/alters/adds/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/profile/modify/alters/adds/props/ns</p>
                        </div>
                        <p class="description">A namespace qualifying the property's name. This allows different organizations to
                           associate distinct semantics with the same name.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated values used in a property. This allows the semantics associated
                                 with a given name/value pair to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/props/value" class="toc6 head">value</h6>Property ValueIndicates the value of the attribute, characteristic, or quality.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/props/value">/profile/modify/alters/adds/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/profile/modify/alters/adds/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/props/class" class="toc6 head">class</h6>Property ClassA textual label that provides a sub-type or characterization of the
                           property's name. This can be used to further distinguish or discriminate between the
                           semantics of multiple properties of the same object with the same name and ns. A class
                           can be used in validation rules to express extra constraints over named items of a
                           specific class value.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/props/class">/profile/modify/alters/adds/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/profile/modify/alters/adds/props/class</p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/props/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/props/remarks">/profile/modify/alters/adds/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/profile/modify/alters/adds/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/adds/links" class="toc5 head">links</h5>
                        <p>An array of Link objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Link</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>links</code>.</p>
                              <p class="path">/profile/modify/alters/adds/links</p>
                           </div>
                           <p class="description">A reference to a local or remote resource</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                    a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                 <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/link"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/adds/links">/profile/modify/alters/adds/links</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>links</code>.</p>
                        <p class="path">/profile/modify/alters/adds/links</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/links/href" class="toc6 head">href</h6>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                           can be an internet resource, or a local reference using a fragment e.g. #fragment
                           that points to a back-matter resource in the same document.If a local reference using
                           a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                           which references an identified resource in the document's back-matter or another object
                           that is within the scope of the containing OSCAL document.If an internet resource
                           is used, the href value will be an absolute or relative URI pointing to the location
                           of the referenced resource. A relative URI will be resolved relative to the location
                           of the document containing the link.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/links/href">/profile/modify/alters/adds/links/href</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                           <p class="path">/profile/modify/alters/adds/links/href</p>
                        </div>
                        <p class="description">A resolvable URL reference to a resource.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                 that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                              <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                 "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                              <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                 resource. A relative URI will be resolved relative to the location of the document
                                 containing the link.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/links/rel" class="toc6 head">rel</h6>RelationDescribes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.
                           
                           Reference
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/links/rel">/profile/modify/alters/adds/links/rel</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                           <p class="path">/profile/modify/alters/adds/links/rel</p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/links/media-type" class="toc6 head">media-type</h6>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                           (IANA) Media Types Registry. 
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/links/media-type">/profile/modify/alters/adds/links/media-type</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                           <p class="path">/profile/modify/alters/adds/links/media-type</p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/links/text" class="toc6 head">text</h6>Link TextA textual label to associate with the link, which may be used for presentation
                           in a tool.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/link/text"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/links/text">/profile/modify/alters/adds/links/text</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                           <p class="path">/profile/modify/alters/adds/links/text</p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/modify/alters/adds/parts" class="toc5 head">parts</h5>
                        <p>An array of Part objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Part</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>parts</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts</p>
                           </div>
                           <p class="description">A partition of a control's definition or a child of another part.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                                    (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                                    hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                                 <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                                    within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                                    a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                                 <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                                    <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                                    Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                                    Each organization is responsible for governance of their own extensions, and is strongly
                                    encouraged to publish their extensions as standards to their user community. If no
                                    <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                                 <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                                    DNS or other globally defined organization name should be used. For example, if FedRAMP
                                    and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                                 <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                                    extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                                    extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts">/profile/modify/alters/adds/parts</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>parts</code>.</p>
                        <p class="path">/profile/modify/alters/adds/parts</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/id" class="toc6 head">id</h6>Part IdentifierA unique identifier for a specific part instance. This identifier's
                           uniqueness is document scoped and is intended to be consistent for the same part across
                           minor revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/@id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/id">/profile/modify/alters/adds/parts/id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/id</p>
                        </div>
                        <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                           document scoped and is intended to be consistent for the same part across minor revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/name" class="toc6 head">name</h6>Part NameA textual label that uniquely identifies the part's semantic type.
                           
                           
                           An introduction to a control or a group of controls.
                           A set of control implementation requirements.
                           An individual item within a control statement.
                           Additional information to consider when selecting, implementing, assessing, and monitoring
                           a control.
                           Describes a set of assessment objectives.
                           Describes a method-based assessment over a set of assessment objects.
                           Provides a list of assessment objects.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/@name"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/name">/profile/modify/alters/adds/parts/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/ns" class="toc6 head">ns</h6>Part NamespaceA namespace qualifying the part's name. This allows different organizations
                           to associate distinct semantics with the same name.Provides a means to segment the
                           value space for the name, so that different organizations and individuals can assert
                           control over the allowed names and associated text used in a part. This allows the
                           semantics associated with a given name to be defined on an organization-by-organization
                           basis.An organization MUST use a URI that they have control over. e.g., a domain registered
                           to the organization in a URI, a registered uniform resource names (URN) namespace.When
                           a ns is not provided, its value should be assumed to be http://csrc.nist.gov/ns/oscal
                           and the name should be a name defined by the associated OSCAL model.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/ns">/profile/modify/alters/adds/parts/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/ns</p>
                        </div>
                        <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                           distinct semantics with the same name.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated text used in a part. This allows the semantics associated with
                                 a given name to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/class" class="toc6 head">class</h6>Part ClassA textual label that provides a sub-type or characterization of the part's
                           name. This can be used to further distinguish or discriminate between the semantics
                           of multiple parts of the same control with the same name and ns. A class can be used
                           in validation rules to express extra constraints over named items of a specific class
                           value.A class can also be used in an OSCAL profile as a means to target an alteration
                           to control content.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/class">/profile/modify/alters/adds/parts/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/class</p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                              <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                                 content.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/title" class="toc6 head">title</h6>Part TitleA name given to the part, which may be used by a tool for display and navigation.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/title"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/title">/profile/modify/alters/adds/parts/title</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Title</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/title</p>
                        </div>
                        <p class="description">A name given to the part, which may be used by a tool for display and navigation.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/props" class="toc6 head">props</h6>
                           <p>An array of Property objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Property</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>props</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/parts/props</p>
                              </div>
                              <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                                 qualified name/value pair. The value of a property is a simple scalar value, which
                                 may be expressed as a list of values.</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>Properties permit the deployment and management of arbitrary controlled values, within
                                       OSCAL objects. A property can be included for any purpose useful to an application
                                       or implementation. Typically, properties will be used to sort, filter, select, order,
                                       and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                       an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                       lexical composition of properties may be constrained by external processes to ensure
                                       consistency.</p>
                                    <p>Property allows for associated remarks that describe why the specific property value
                                       was applied to the containing object, or the significance of the value in the context
                                       of the containing object.</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/prop"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/props">/profile/modify/alters/adds/parts/props</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>props</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/props</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/props/name" class="toc7 head">name</h7>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                              or quality of the property's containing object.
                              
                              A label or descriptor that is tied to a sensitivity or classification marking system.
                              An optional class can be used to define the specific marking system used for the associated
                              value.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/props/name">/profile/modify/alters/adds/parts/props/name</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/props/name</p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/props/uuid" class="toc7 head">uuid</h7>Property Universally Unique IdentifierA unique identifier that can be used to reference
                              this property elsewhere in an OSCAL document. A UUID should be consistently used for
                              a given location across revisions of the document.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/props/uuid">/profile/modify/alters/adds/parts/props/uuid</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/props/uuid</p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/props/ns" class="toc7 head">ns</h7>Property NamespaceA namespace qualifying the property's name. This allows different
                              organizations to associate distinct semantics with the same name.Provides a means
                              to segment the value space for the name, so that different organizations and individuals
                              can assert control over the allowed names and associated values used in a property.
                              This allows the semantics associated with a given name/value pair to be defined on
                              an organization-by-organization basis.An organization MUST use a URI that they have
                              control over. e.g., a domain registered to the organization in a URI, a registered
                              uniform resource names (URN) namespace.When a ns is not provided, its value should
                              be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                              by the associated OSCAL model.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/props/ns">/profile/modify/alters/adds/parts/props/ns</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/props/ns</p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                    names and associated values used in a property. This allows the semantics associated
                                    with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                 <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                    to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                 <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/props/value" class="toc7 head">value</h7>Property ValueIndicates the value of the attribute, characteristic, or quality.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/props/value">/profile/modify/alters/adds/parts/props/value</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/props/value</p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/props/class" class="toc7 head">class</h7>Property ClassA textual label that provides a sub-type or characterization of the
                              property's name. This can be used to further distinguish or discriminate between the
                              semantics of multiple properties of the same object with the same name and ns. A class
                              can be used in validation rules to express extra constraints over named items of a
                              specific class value.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/props/class">/profile/modify/alters/adds/parts/props/class</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/props/class</p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                    a specific <code>class</code> value.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/props/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/props/remarks">/profile/modify/alters/adds/parts/props/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/props/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/prose" class="toc6 head">prose</h6>Part TextPermits multiple paragraphs, lists, tables etc.
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/prose">/profile/modify/alters/adds/parts/prose</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Part Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/prose</p>
                        </div>
                        <p class="description">Permits multiple paragraphs, lists, tables etc.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/parts" class="toc6 head">parts</h6>
                           <p>An array of Part objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Part</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>parts</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/parts/parts</p>
                              </div>
                              <p class="description">A partition of a control's definition or a child of another part.</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                                       (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                                       hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                                    <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                                       within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                                       a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                                    <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                                       <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                                       Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                                       Each organization is responsible for governance of their own extensions, and is strongly
                                       encouraged to publish their extensions as standards to their user community. If no
                                       <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                                    <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                                       DNS or other globally defined organization name should be used. For example, if FedRAMP
                                       and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                                    <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                                       extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                                       extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/part"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/parts">/profile/modify/alters/adds/parts/parts</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>parts</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/parts</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/modify/alters/adds/parts/links" class="toc6 head">links</h6>
                           <p>An array of Link objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Link</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>links</code>.</p>
                                 <p class="path">/profile/modify/alters/adds/parts/links</p>
                              </div>
                              <p class="description">A reference to a local or remote resource</p>
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                       a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                    <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                                 </div>
                              </details>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/link"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/links">/profile/modify/alters/adds/parts/links</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>links</code>.</p>
                           <p class="path">/profile/modify/alters/adds/parts/links</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/links/href" class="toc7 head">href</h7>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                              can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a back-matter resource in the same document.If a local reference using
                              a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                              which references an identified resource in the document's back-matter or another object
                              that is within the scope of the containing OSCAL document.If an internet resource
                              is used, the href value will be an absolute or relative URI pointing to the location
                              of the referenced resource. A relative URI will be resolved relative to the location
                              of the document containing the link.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/links/href">/profile/modify/alters/adds/parts/links/href</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/links/href</p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                    that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                 <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                    "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                 <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                    resource. A relative URI will be resolved relative to the location of the document
                                    containing the link.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/links/rel" class="toc7 head">rel</h7>RelationDescribes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.
                              
                              Reference
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/links/rel">/profile/modify/alters/adds/parts/links/rel</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/links/rel</p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/links/media-type" class="toc7 head">media-type</h7>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                              (IANA) Media Types Registry. 
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/links/media-type">/profile/modify/alters/adds/parts/links/media-type</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/links/media-type</p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/profile/modify/alters/adds/parts/links/text" class="toc7 head">text</h7>Link TextA textual label to associate with the link, which may be used for presentation
                              in a tool.
                              <div class="crosslink"><a href="../xml-reference/#/profile/modify/alter/add/part/link/text"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/profile/modify/alters/adds/parts/links/text">/profile/modify/alters/adds/parts/links/text</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                              <p class="path">/profile/modify/alters/adds/parts/links/text</p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                        </div>
                     </section>
                  </section>
               </section>
            </section>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/profile/back-matter" class="toc2 head">back-matter</h2>Back matterA collection of resources, which may be included directly or by reference.
               <p>An array of Resource objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Resource</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>resources</code>.</p>
                     <p class="path">/profile/back-matter/resources</p>
                  </div>
                  <p class="description">A resource associated with content in the containing document. A resource may be directly
                     included in the document base64 encoded or may point to one or more equivalent internet
                     resources.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                           resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                           for the same resource. Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                           the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                           This allows the document consumer to choose a preferred item to process based on a
                           the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                           in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                           from any of the available formats indicated by the items.</p>
                        <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                     </div>
                     <div class="remarks">
                        <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                           resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                           for the same resource. Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                           the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                           This allows the document consumer to choose a preferred item to process based on a
                           the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                           in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                           from any of the available formats indicated by the items.</p>
                        <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                     </div>
                  </details>
               </div>
               
               
               
               Provides a collection of identified resource objects that can be referenced by a link
               with a rel value of "reference" and an href value that is a fragment "#" followed
               by a reference to a reference identifier. Other specialized link "rel" values also
               use this pattern when indicated in that context of use.
               <div class="crosslink"><a href="../xml-reference/#/profile/back-matter"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/profile/back-matter">/profile/back-matter</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Back matter</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An object  with key <code>back-matter</code>.</p>
               <p class="path">/profile/back-matter</p>
            </div>
            <p class="description">A collection of resources, which may be included directly or by reference.</p>
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
               <div class="remarks">
                  <p>Provides a collection of identified <code>resource</code> objects that can be referenced by a <code>link</code> with a <code>rel</code> value of "reference" and an <code>href</code> value that is a fragment "#" followed by a reference to a reference identifier. Other
                     specialized link "rel" values also use this pattern when indicated in that context
                     of use.</p>
               </div>
            </details>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/profile/back-matter/resources" class="toc3 head">resources</h3>
                  <p>An array of Resource objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Resource</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>resources</code>.</p>
                        <p class="path">/profile/back-matter/resources</p>
                     </div>
                     <p class="description">A resource associated with content in the containing document. A resource may be directly
                        included in the document base64 encoded or may point to one or more equivalent internet
                        resources.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                              resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                              for the same resource. Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                              the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                              This allows the document consumer to choose a preferred item to process based on a
                              the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                              in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                              from any of the available formats indicated by the items.</p>
                           <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                        </div>
                        <div class="remarks">
                           <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                              resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                              for the same resource. Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                              the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                              This allows the document consumer to choose a preferred item to process based on a
                              the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                              in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                              from any of the available formats indicated by the items.</p>
                           <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/profile/back-matter/resources">/profile/back-matter/resources</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>resources</code>.</p>
                  <p class="path">/profile/back-matter/resources</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/uuid" class="toc4 head">uuid</h4>Resource Universally Unique IdentifierA globally unique identifier that can be used
                     to reference this defined resource elsewhere in an OSCAL document. A UUID should be
                     consistently used for a given resource across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/uuid">/profile/back-matter/resources/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/profile/back-matter/resources/uuid</p>
                  </div>
                  <p class="description">A globally unique identifier that can be used to reference this defined resource elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given resource across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/title" class="toc4 head">title</h4>Resource TitleA name given to the resource, which may be used by a tool for display
                     and navigation.
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/title">/profile/back-matter/resources/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/profile/back-matter/resources/title</p>
                  </div>
                  <p class="description">A name given to the resource, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/description" class="toc4 head">description</h4>Resource DescriptionA short summary of the resource used to indicate the purpose of
                     the resource.
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/description"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/description">/profile/back-matter/resources/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/profile/back-matter/resources/description</p>
                  </div>
                  <p class="description">A short summary of the resource used to indicate the purpose of the resource.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/profile/back-matter/resources/props</p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/props">/profile/back-matter/resources/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/profile/back-matter/resources/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/props/name">/profile/back-matter/resources/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/profile/back-matter/resources/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/props/uuid">/profile/back-matter/resources/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/profile/back-matter/resources/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/props/ns">/profile/back-matter/resources/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/profile/back-matter/resources/props/ns</p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/props/value">/profile/back-matter/resources/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/profile/back-matter/resources/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/props/class">/profile/back-matter/resources/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/profile/back-matter/resources/props/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/props/remarks">/profile/back-matter/resources/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/profile/back-matter/resources/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/document-ids" class="toc4 head">document-ids</h4>
                     <p>An array of Document Identifier objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Document Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An object of type <a href="link.to.string">string</a> member of array <code>document-ids</code>.</p>
                           <p class="path">/profile/back-matter/resources/document-ids</p>
                        </div>
                        <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
                           that are to be treated as different versions of the same document. If this element
                           does not appear, or if the value of this element is empty, the value of "document-id"
                           is equal to the value of the "uuid" flag of the top-level root element.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>This element is optional, but it will always have a valid value, as if it is missing
                                 the value of "document-id" is assumed to be equal to the UUID of the root. This requirement
                                 allows for document creators to retroactively link an update to the original version,
                                 by providing a document-id on the new document that is equal to the uuid of the original
                                 document.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/document-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/document-ids">/profile/back-matter/resources/document-ids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>document-ids</code>.</p>
                     <p class="path">/profile/back-matter/resources/document-ids</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/document-ids/scheme" class="toc5 head">scheme</h5>Document Identification SchemeQualifies the kind of document identifier using a URI.
                        If the scheme is not provided the value of the element will be interpreted as a string
                        of characters. 
                        
                        A Digital Object Identifier (DOI); use is preferred, since this allows for retrieval
                        of a full bibliographic record.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/document-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/document-ids/scheme">/profile/back-matter/resources/document-ids/scheme</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Document Identification Scheme</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                        <p class="path">/profile/back-matter/resources/document-ids/scheme</p>
                     </div>
                     <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                        the value of the element will be interpreted as a string of characters. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/document-ids/identifier" class="toc5 head">identifier</h5>
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/document-id/identifier"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/document-ids/identifier">/profile/back-matter/resources/document-ids/identifier</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>identifier</code>.</p>
                        <p class="path">/profile/back-matter/resources/document-ids/identifier</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/citation" class="toc4 head">citation</h4>CitationA citation consisting of end note text and optional structured bibliographic
                     data.Citation TextA line of citation text.
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/profile/back-matter/resources/citation/props</p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>Bibliographic DefinitionA container for structured bibliographic information. The
                     model of this information is undefined by OSCAL.The text is used to define the endnote
                     text, without any required bibliographic structure. If structured bibliographic data
                     is needed, then the biblio can be used for this purpose.A biblio can be used to capture
                     a structured bibliographical citation in an appropriate format.The text is used to
                     define the endnote text, without any required bibliographic structure. If structured
                     bibliographic data is needed, then the biblio can be used for this purpose.A biblio
                     can be used to capture a structured bibliographical citation in an appropriate format.
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/citation">/profile/back-matter/resources/citation</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Citation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object  with key <code>citation</code>.</p>
                     <p class="path">/profile/back-matter/resources/citation</p>
                  </div>
                  <p class="description">A citation consisting of end note text and optional structured bibliographic data.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The <code>text</code> is used to define the endnote text, without any required bibliographic structure.
                           If structured bibliographic data is needed, then the <code>biblio</code> can be used for this purpose.</p>
                        <p>A <code>biblio</code> can be used to capture a structured bibliographical citation in an appropriate format.</p>
                     </div>
                     <div class="remarks">
                        <p>The <code>text</code> is used to define the endnote text, without any required bibliographic structure.
                           If structured bibliographic data is needed, then the <code>biblio</code> can be used for this purpose.</p>
                        <p>A <code>biblio</code> can be used to capture a structured bibliographical citation in an appropriate format.</p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/citation/text" class="toc5 head">text</h5>Citation TextA line of citation text.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/text">/profile/back-matter/resources/citation/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Citation Text</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/profile/back-matter/resources/citation/text</p>
                     </div>
                     <p class="description">A line of citation text.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/citation/props" class="toc5 head">props</h5>
                        <p>An array of Property objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Property</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>props</code>.</p>
                              <p class="path">/profile/back-matter/resources/citation/props</p>
                           </div>
                           <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                              qualified name/value pair. The value of a property is a simple scalar value, which
                              may be expressed as a list of values.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Properties permit the deployment and management of arbitrary controlled values, within
                                    OSCAL objects. A property can be included for any purpose useful to an application
                                    or implementation. Typically, properties will be used to sort, filter, select, order,
                                    and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                    an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                    lexical composition of properties may be constrained by external processes to ensure
                                    consistency.</p>
                                 <p>Property allows for associated remarks that describe why the specific property value
                                    was applied to the containing object, or the significance of the value in the context
                                    of the containing object.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/prop"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/props">/profile/back-matter/resources/citation/props</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>props</code>.</p>
                        <p class="path">/profile/back-matter/resources/citation/props</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/back-matter/resources/citation/props/name" class="toc6 head">name</h6>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                           or quality of the property's containing object.
                           
                           A label or descriptor that is tied to a sensitivity or classification marking system.
                           An optional class can be used to define the specific marking system used for the associated
                           value.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/props/name">/profile/back-matter/resources/citation/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/profile/back-matter/resources/citation/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/back-matter/resources/citation/props/uuid" class="toc6 head">uuid</h6>Property Universally Unique IdentifierA unique identifier that can be used to reference
                           this property elsewhere in an OSCAL document. A UUID should be consistently used for
                           a given location across revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/props/uuid">/profile/back-matter/resources/citation/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/profile/back-matter/resources/citation/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/back-matter/resources/citation/props/ns" class="toc6 head">ns</h6>Property NamespaceA namespace qualifying the property's name. This allows different
                           organizations to associate distinct semantics with the same name.Provides a means
                           to segment the value space for the name, so that different organizations and individuals
                           can assert control over the allowed names and associated values used in a property.
                           This allows the semantics associated with a given name/value pair to be defined on
                           an organization-by-organization basis.An organization MUST use a URI that they have
                           control over. e.g., a domain registered to the organization in a URI, a registered
                           uniform resource names (URN) namespace.When a ns is not provided, its value should
                           be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                           by the associated OSCAL model.
                           <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/props/ns">/profile/back-matter/resources/citation/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/profile/back-matter/resources/citation/props/ns</p>
                        </div>
                        <p class="description">A namespace qualifying the property's name. This allows different organizations to
                           associate distinct semantics with the same name.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated values used in a property. This allows the semantics associated
                                 with a given name/value pair to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/back-matter/resources/citation/props/value" class="toc6 head">value</h6>Property ValueIndicates the value of the attribute, characteristic, or quality.
                           <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/props/value">/profile/back-matter/resources/citation/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/profile/back-matter/resources/citation/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/back-matter/resources/citation/props/class" class="toc6 head">class</h6>Property ClassA textual label that provides a sub-type or characterization of the
                           property's name. This can be used to further distinguish or discriminate between the
                           semantics of multiple properties of the same object with the same name and ns. A class
                           can be used in validation rules to express extra constraints over named items of a
                           specific class value.
                           <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/props/class">/profile/back-matter/resources/citation/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/profile/back-matter/resources/citation/props/class</p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/back-matter/resources/citation/props/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/props/remarks">/profile/back-matter/resources/citation/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/profile/back-matter/resources/citation/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/citation/biblio" class="toc5 head">biblio</h5>Bibliographic DefinitionA container for structured bibliographic information. The
                        model of this information is undefined by OSCAL.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/citation/biblio"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/citation/biblio">/profile/back-matter/resources/citation/biblio</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Bibliographic Definition</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An object  with key <code>biblio</code>.</p>
                        <p class="path">/profile/back-matter/resources/citation/biblio</p>
                     </div>
                     <p class="description">A container for structured bibliographic information. The model of this information
                        is undefined by OSCAL.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/rlinks" class="toc4 head">rlinks</h4>
                     <p>An array of Resource link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Resource link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>rlinks</code>.</p>
                           <p class="path">/profile/back-matter/resources/rlinks</p>
                        </div>
                        <p class="description">A pointer to an external resource with an optional hash for verification and change
                           detection.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>This construct is different from <code>link</code>, which makes no provision for a hash or formal title.</p>
                              <p>Multiple <code>rlink</code> can be included for a resource. In such a case, all provided <code>rlink</code> items are intended to be equivalent in content, but may differ in structure. A <code>media-type</code> is used to identify the format of a given rlink, and can be used to differentiate
                                 a items in a collection of rlinks. The <code>media-type</code> also provides a hint to the OSCAL document consumer about the structure of the resource
                                 referenced by the <code>rlink</code>. </p>
                           </div>
                           <div class="remarks">
                              <p>This construct is different from <code>link</code>, which makes no provision for a hash or formal title.</p>
                              <p>Multiple <code>rlink</code> can be included for a resource. In such a case, all provided <code>rlink</code> items are intended to be equivalent in content, but may differ in structure. A <code>media-type</code> is used to identify the format of a given rlink, and can be used to differentiate
                                 a items in a collection of rlinks. The <code>media-type</code> also provides a hint to the OSCAL document consumer about the structure of the resource
                                 referenced by the <code>rlink</code>. </p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/rlink"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/rlinks">/profile/back-matter/resources/rlinks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>rlinks</code>.</p>
                     <p class="path">/profile/back-matter/resources/rlinks</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/rlinks/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URI reference to a resource.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/rlink/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/rlinks/href">/profile/back-matter/resources/rlinks/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/profile/back-matter/resources/rlinks/href</p>
                     </div>
                     <p class="description">A resolvable URI reference to a resource.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/rlinks/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/rlink/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/rlinks/media-type">/profile/back-matter/resources/rlinks/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/profile/back-matter/resources/rlinks/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/rlinks/hashes" class="toc5 head">hashes</h5>
                        <p>An array of Hash objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Hash</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An object of type <a href="link.to.string">string</a> member of array <code>hashes</code>.</p>
                              <p class="path">/profile/back-matter/resources/rlinks/hashes</p>
                           </div>
                           <p class="description">A representation of a cryptographic digest generated over a resource using a specified
                              hash algorithm.</p>
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks in-use">
                                 <p class="nb">(In use)</p>
                                 <p>When appearing as part of a <code>resource/rlink</code>, the hash applies to the resource referenced by the <code>href</code>. </p>
                              </div>
                              <div class="remarks">
                                 <p>A hash value can be used to authenticate that a referenced resource is the same resources
                                    as was pointed to by the author of the reference.</p>
                              </div>
                           </details>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/rlink/hash"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/rlinks/hashes">/profile/back-matter/resources/rlinks/hashes</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>hashes</code>.</p>
                        <p class="path">/profile/back-matter/resources/rlinks/hashes</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/back-matter/resources/rlinks/hashes/algorithm" class="toc6 head">algorithm</h6>Hash algorithmMethod by which a hash is derived
                           
                           The SHA-224 algorithm as defined by NIST FIPS 180-4.
                           
                           The SHA-256 algorithm as defined by NIST FIPS 180-4.
                           
                           The SHA-384 algorithm as defined by NIST FIPS 180-4.
                           
                           The SHA-512 algorithm as defined by NIST FIPS 180-4.
                           
                           The SHA3-224 algorithm as defined by NIST FIPS 202.
                           
                           The SHA3-256 algorithm as defined by NIST FIPS 202.
                           
                           The SHA3-384 algorithm as defined by NIST FIPS 202.
                           
                           The SHA3-512 algorithm as defined by NIST FIPS 202.
                           
                           
                           Any other value used MUST be a value defined in the W3C XML Security Algorithm Cross-Reference
                           Digest Methods (W3C, April 2013) or RFC 6931 Section 2.1.5 New SHA Functions.
                           <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/rlink/hash/@algorithm"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/back-matter/resources/rlinks/hashes/algorithm">/profile/back-matter/resources/rlinks/hashes/algorithm</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hash algorithm</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>algorithm</code>.</p>
                           <p class="path">/profile/back-matter/resources/rlinks/hashes/algorithm</p>
                        </div>
                        <p class="description">Method by which a hash is derived</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Any other value used MUST be a value defined in the W3C <a>XML Security Algorithm Cross-Reference</a> Digest Methods (W3C, April 2013) or <a>RFC 6931 Section 2.1.5</a> New SHA Functions.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/profile/back-matter/resources/rlinks/hashes/value" class="toc6 head">value</h6>
                           <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/rlink/hash/value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/profile/back-matter/resources/rlinks/hashes/value">/profile/back-matter/resources/rlinks/hashes/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/profile/back-matter/resources/rlinks/hashes/value</p>
                        </div>
                     </div>
                  </section>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/base64" class="toc4 head">base64</h4>Base64The Base64 alphabet in RFC 2045 - aligned with XSD.File NameName of the file
                     before it was encoded as Base64 to be embedded in a resource. This is the name that
                     will be assigned to the file when the file is decoded.Media TypeSpecifies a media
                     type as defined by the Internet Assigned Numbers Authority (IANA) Media Types Registry.
                     
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/base64"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/base64">/profile/back-matter/resources/base64</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Base64</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object of type <a href="link.to.base64Binary">base64Binary</a> with key <code>base64</code>.</p>
                     <p class="path">/profile/back-matter/resources/base64</p>
                  </div>
                  <p class="description">The Base64 alphabet in RFC 2045 - aligned with XSD.</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/base64/filename" class="toc5 head">filename</h5>File NameName of the file before it was encoded as Base64 to be embedded in a resource.
                        This is the name that will be assigned to the file when the file is decoded.
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/base64/@filename"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/base64/filename">/profile/back-matter/resources/base64/filename</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string File Name</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>filename</code>.</p>
                        <p class="path">/profile/back-matter/resources/base64/filename</p>
                     </div>
                     <p class="description">Name of the file before it was encoded as Base64 to be embedded in a <code>resource</code>. This is the name that will be assigned to the file when the file is decoded.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/base64/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/base64/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/base64/media-type">/profile/back-matter/resources/base64/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/profile/back-matter/resources/base64/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/profile/back-matter/resources/base64/value" class="toc5 head">value</h5>
                        <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/base64/value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/profile/back-matter/resources/base64/value">/profile/back-matter/resources/base64/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.base64Binary">base64Binary</a> with key <code>value</code>.</p>
                        <p class="path">/profile/back-matter/resources/base64/value</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/profile/back-matter/resources/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/profile/back-matter/resource/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/profile/back-matter/resources/remarks">/profile/back-matter/resources/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/profile/back-matter/resources/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
      </section>
   </section>
</div>