---
title: "Component Definition Model JSON Format Reference"
heading: "OSCAL Component Definition Model JSON Format Reference"
description: A reference for the OSCAL Component Definition model JSON format.
weight: 20
sidenav:
  title: JSON Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
aliases:
  - /docs/schemas/oscal-component-json/
  - /documentation/schema/component/json-schema/
  - /documentation/schema/implementation-layer/component/json-schema/
---

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml" class="json-reference">
   <p><span class="usa-tag">Schema version:</span> 1.0.0-rc1</p>
   <section class="json-obj">
      <div class="header">
         <div>
            <h1 id="/component-definition" class="toc1 head">component-definition</h1>Component DefinitionA collection of component descriptions, which may optionally be
            grouped by capability.Component Definition Universally Unique IdentifierA globally
            unique identifier for this component definition instance. This UUID should be changed
            when this document is revised.Publication metadataProvides information about the publication
            and availability of the containing document.Document TitleA name given to the document,
            which may be used by a tool for display and navigation.Publication TimestampThe date
            and time the document was published. The date-time value must be formatted according
            to RFC 3339 with full time and time zone included.This value represents the point
            in time when the OSCAL document was published. Typically, this date value will be
            machine generated at the time the containing document is published.In some cases,
            an OSCAL document may be derived from some source material in a different format.
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
                  <p class="path">/component-definition/metadata/revisions</p>
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
                  <p class="path">/component-definition/metadata/document-ids</p>
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
                  <p class="path">/component-definition/metadata/props</p>
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
                  <p class="path">/component-definition/metadata/links</p>
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
                  <p class="path">/component-definition/metadata/roles</p>
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
                  <p class="path">/component-definition/metadata/locations</p>
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
                  <p class="path">/component-definition/metadata/parties</p>
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
                  <p class="path">/component-definition/metadata/responsible-parties</p>
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
            
            
            <p>An array of Import Component Definition objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Import Component Definition</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object of type <a href="link.to.empty">empty</a> member of array <code>import-component-definitions</code>.</p>
                  <p class="path">/component-definition/import-component-definitions</p>
               </div>
               <p class="description">Loads a component definition from another resource.</p>
            </div>
            <p>An array of Component objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Component</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>components</code>.</p>
                  <p class="path">/component-definition/components</p>
               </div>
               <p class="description">A defined component that can be part of an implemented system.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Components may be products, services, APIs, policies, processes, plans, guidance,
                        standards, or other tangible items that enable security and/or privacy.</p>
                     <p>The <code>type</code> indicates which of these component types is represented.</p>
                     <p>A group of components may be aggregated into a <code>capability</code>. For example, an account management capability that consists of an account management
                        process, and a Lightweight Directory Access Protocol (LDAP) software implementation.</p>
                     <p>Capabilities are expressed by combining one or more components.</p>
                  </div>
               </details>
            </div>
            <p>An array of Capability objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Capability</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>capabilities</code>.</p>
                  <p class="path">/component-definition/capabilities</p>
               </div>
               <p class="description">A grouping of other components and/or capabilities.</p>
            </div>Back matterA collection of resources, which may be included directly or by reference.
            <p>An array of Resource objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Resource</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>resources</code>.</p>
                  <p class="path">/component-definition/back-matter/resources</p>
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
            
            
            Since multiple component entries can be provided, each component must have a unique
            uuid.
            
            
            
            A given component must not be referenced more than once within the same capability.
            
            
            <div class="crosslink"><a href="../xml-reference/#/component-definition"><button class="schema-link">Switch to XML</button></a></div>
         </div>
      </div>
      <p>See <a href="../json-outline/#/component-definition">/component-definition</a> in the object map.</p>
      <div class="obj-desc">
         <div class="obj-matrix">
            <p class="obj-name">object Component Definition</p>
            <p class="occurrence"><span class="cardinality">[1]</span></p>
            <p>An object  with key <code>component-definition</code>.</p>
            <p class="path">/component-definition</p>
         </div>
         <p class="description">A collection of component descriptions, which may optionally be grouped by capability.</p>
      </div>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/component-definition/uuid" class="toc2 head">uuid</h2>Component Definition Universally Unique IdentifierA globally unique identifier for
               this component definition instance. This UUID should be changed when this document
               is revised.
               <div class="crosslink"><a href="../xml-reference/#/component-definition/@uuid"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/component-definition/uuid">/component-definition/uuid</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">string Component Definition Universally Unique Identifier</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
               <p class="path">/component-definition/uuid</p>
            </div>
            <p class="description">A globally unique identifier for this component definition instance. This UUID should
               be changed when this document is revised.</p>
         </div>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/component-definition/metadata" class="toc2 head">metadata</h2>Publication metadataProvides information about the publication and availability of
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
                     <p class="path">/component-definition/metadata/revisions</p>
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
                     <p class="path">/component-definition/metadata/document-ids</p>
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
                     <p class="path">/component-definition/metadata/props</p>
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
                     <p class="path">/component-definition/metadata/links</p>
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
                     <p class="path">/component-definition/metadata/roles</p>
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
                     <p class="path">/component-definition/metadata/locations</p>
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
                     <p class="path">/component-definition/metadata/parties</p>
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
                     <p class="path">/component-definition/metadata/responsible-parties</p>
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
               
               
               <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/component-definition/metadata">/component-definition/metadata</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Publication metadata</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An object  with key <code>metadata</code>.</p>
               <p class="path">/component-definition/metadata</p>
            </div>
            <p class="description">Provides information about the publication and availability of the containing document.</p>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/title" class="toc3 head">title</h3>Document TitleA name given to the document, which may be used by a tool for display
                  and navigation.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/title"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/title">/component-definition/metadata/title</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Document Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                  <p class="path">/component-definition/metadata/title</p>
               </div>
               <p class="description">A name given to the document, which may be used by a tool for display and navigation.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/published" class="toc3 head">published</h3>Publication TimestampThe date and time the document was published. The date-time value
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/published"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/published">/component-definition/metadata/published</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Publication Timestamp</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>published</code>.</p>
                  <p class="path">/component-definition/metadata/published</p>
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
                  <h3 id="/component-definition/metadata/last-modified" class="toc3 head">last-modified</h3>Last Modified TimestampThe date and time the document was last modified. The date-time
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/last-modified"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/last-modified">/component-definition/metadata/last-modified</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Last Modified Timestamp</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>last-modified</code>.</p>
                  <p class="path">/component-definition/metadata/last-modified</p>
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
                  <h3 id="/component-definition/metadata/version" class="toc3 head">version</h3>Document VersionA string used to distinguish the current version of the document from
                  other previous (and future) versions.A version string may be a release number, sequence
                  number, date, or other identifier suffcient to distinguish between different document
                  versions. This version is typically set by the document owner or by the tool used
                  to maintain the content.While not required, it is recommended that OSCAL content authors
                  use Semantic Versioning as a format for version strings. This allows for the easy
                  identification of a version tree consisting of major, minor, and patch numbers.A publisher
                  of OSCAL content can use this data point along with its siblings published and last-modified
                  to establish a sequence of successive revisions of a given OSCAL-based publication.
                  The metadata for previous revisions can be represented as a revision in this object.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/version"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/version">/component-definition/metadata/version</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Document Version</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> with key <code>version</code>.</p>
                  <p class="path">/component-definition/metadata/version</p>
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
                  <h3 id="/component-definition/metadata/oscal-version" class="toc3 head">oscal-version</h3>OSCAL versionThe OSCAL model version the document was authored against.Indicates the
                  version of the OSCAL model to which this data set conforms, for example 1.1.0 or 1.0.0-M1.
                  That can be used as a hint by a tool to indicate which version of the OSCAL XML or
                  JSON schema to use for validation.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/oscal-version"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/oscal-version">/component-definition/metadata/oscal-version</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string OSCAL version</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> with key <code>oscal-version</code>.</p>
                  <p class="path">/component-definition/metadata/oscal-version</p>
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
                  <h3 id="/component-definition/metadata/revisions" class="toc3 head">revisions</h3>
                  <p>An array of Revision History Entry objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Revision History Entry</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>revisions</code>.</p>
                        <p class="path">/component-definition/metadata/revisions</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/revisions">/component-definition/metadata/revisions</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>revisions</code>.</p>
                  <p class="path">/component-definition/metadata/revisions</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/revisions/title" class="toc4 head">title</h4>Document TitleA name given to the document revision, which may be used by a tool for
                     display and navigation.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/revisions/title">/component-definition/metadata/revisions/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/component-definition/metadata/revisions/title</p>
                  </div>
                  <p class="description">A name given to the document revision, which may be used by a tool for display and
                     navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/revisions/published" class="toc4 head">published</h4>Publication TimestampThe date and time the document was published. The date-time value
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/published"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/revisions/published">/component-definition/metadata/revisions/published</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Publication Timestamp</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>published</code>.</p>
                     <p class="path">/component-definition/metadata/revisions/published</p>
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
                     <h4 id="/component-definition/metadata/revisions/last-modified" class="toc4 head">last-modified</h4>Last Modified TimestampThe date and time the document was last modified. The date-time
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/last-modified"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/revisions/last-modified">/component-definition/metadata/revisions/last-modified</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Last Modified Timestamp</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>last-modified</code>.</p>
                     <p class="path">/component-definition/metadata/revisions/last-modified</p>
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
                     <h4 id="/component-definition/metadata/revisions/version" class="toc4 head">version</h4>Document VersionA string used to distinguish the current version of the document from
                     other previous (and future) versions.A version string may be a release number, sequence
                     number, date, or other identifier suffcient to distinguish between different document
                     versions. This version is typically set by the document owner or by the tool used
                     to maintain the content.While not required, it is recommended that OSCAL content authors
                     use Semantic Versioning as a format for version strings. This allows for the easy
                     identification of a version tree consisting of major, minor, and patch numbers.A publisher
                     of OSCAL content can use this data point along with its siblings published and last-modified
                     to establish a sequence of successive revisions of a given OSCAL-based publication.
                     The metadata for previous revisions can be represented as a revision in this object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/version"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/revisions/version">/component-definition/metadata/revisions/version</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Version</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>version</code>.</p>
                     <p class="path">/component-definition/metadata/revisions/version</p>
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
                     <h4 id="/component-definition/metadata/revisions/oscal-version" class="toc4 head">oscal-version</h4>OSCAL versionThe OSCAL model version the document was authored against.Indicates the
                     version of the OSCAL model to which this data set conforms, for example 1.1.0 or 1.0.0-M1.
                     That can be used as a hint by a tool to indicate which version of the OSCAL XML or
                     JSON schema to use for validation.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/oscal-version"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/revisions/oscal-version">/component-definition/metadata/revisions/oscal-version</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string OSCAL version</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>oscal-version</code>.</p>
                     <p class="path">/component-definition/metadata/revisions/oscal-version</p>
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
                     <h4 id="/component-definition/metadata/revisions/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/metadata/revisions/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/revisions/props">/component-definition/metadata/revisions/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/metadata/revisions/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/revisions/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/props/name">/component-definition/metadata/revisions/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/revisions/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/props/uuid">/component-definition/metadata/revisions/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/revisions/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/props/ns">/component-definition/metadata/revisions/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/props/ns</p>
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
                        <h5 id="/component-definition/metadata/revisions/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/props/value">/component-definition/metadata/revisions/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/revisions/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/props/class">/component-definition/metadata/revisions/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/props/class</p>
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
                        <h5 id="/component-definition/metadata/revisions/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/props/remarks">/component-definition/metadata/revisions/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/revisions/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/component-definition/metadata/revisions/links</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/revisions/links">/component-definition/metadata/revisions/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/component-definition/metadata/revisions/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/revisions/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/links/href">/component-definition/metadata/revisions/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/links/href</p>
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
                        <h5 id="/component-definition/metadata/revisions/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/links/rel">/component-definition/metadata/revisions/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/revisions/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/links/media-type">/component-definition/metadata/revisions/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/revisions/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/revisions/links/text">/component-definition/metadata/revisions/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/metadata/revisions/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/revisions/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/revisions/revision/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/revisions/remarks">/component-definition/metadata/revisions/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/metadata/revisions/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/document-ids" class="toc3 head">document-ids</h3>
                  <p>An array of Document Identifier objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Document Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An object of type <a href="link.to.string">string</a> member of array <code>document-ids</code>.</p>
                        <p class="path">/component-definition/metadata/document-ids</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/document-id"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/document-ids">/component-definition/metadata/document-ids</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>document-ids</code>.</p>
                  <p class="path">/component-definition/metadata/document-ids</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/document-ids/scheme" class="toc4 head">scheme</h4>Document Identification SchemeQualifies the kind of document identifier using a URI.
                     If the scheme is not provided the value of the element will be interpreted as a string
                     of characters. 
                     
                     A Digital Object Identifier (DOI); use is preferred, since this allows for retrieval
                     of a full bibliographic record.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/document-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/document-ids/scheme">/component-definition/metadata/document-ids/scheme</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Identification Scheme</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                     <p class="path">/component-definition/metadata/document-ids/scheme</p>
                  </div>
                  <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                     the value of the element will be interpreted as a string of characters. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/document-ids/identifier" class="toc4 head">identifier</h4>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/document-id/identifier"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/document-ids/identifier">/component-definition/metadata/document-ids/identifier</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>identifier</code>.</p>
                     <p class="path">/component-definition/metadata/document-ids/identifier</p>
                  </div>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/props" class="toc3 head">props</h3>
                  <p>An array of Property objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Property</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>props</code>.</p>
                        <p class="path">/component-definition/metadata/props</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/prop"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/props">/component-definition/metadata/props</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>props</code>.</p>
                  <p class="path">/component-definition/metadata/props</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/props/name" class="toc4 head">name</h4>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                     or quality of the property's containing object.
                     
                     A label or descriptor that is tied to a sensitivity or classification marking system.
                     An optional class can be used to define the specific marking system used for the associated
                     value.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/props/name">/component-definition/metadata/props/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/component-definition/metadata/props/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/props/uuid" class="toc4 head">uuid</h4>Property Universally Unique IdentifierA unique identifier that can be used to reference
                     this property elsewhere in an OSCAL document. A UUID should be consistently used for
                     a given location across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/props/uuid">/component-definition/metadata/props/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/metadata/props/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/props/ns" class="toc4 head">ns</h4>Property NamespaceA namespace qualifying the property's name. This allows different
                     organizations to associate distinct semantics with the same name.Provides a means
                     to segment the value space for the name, so that different organizations and individuals
                     can assert control over the allowed names and associated values used in a property.
                     This allows the semantics associated with a given name/value pair to be defined on
                     an organization-by-organization basis.An organization MUST use a URI that they have
                     control over. e.g., a domain registered to the organization in a URI, a registered
                     uniform resource names (URN) namespace.When a ns is not provided, its value should
                     be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                     by the associated OSCAL model.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/props/ns">/component-definition/metadata/props/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/component-definition/metadata/props/ns</p>
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
                     <h4 id="/component-definition/metadata/props/value" class="toc4 head">value</h4>Property ValueIndicates the value of the attribute, characteristic, or quality.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/props/value">/component-definition/metadata/props/value</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                     <p class="path">/component-definition/metadata/props/value</p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/props/class" class="toc4 head">class</h4>Property ClassA textual label that provides a sub-type or characterization of the
                     property's name. This can be used to further distinguish or discriminate between the
                     semantics of multiple properties of the same object with the same name and ns. A class
                     can be used in validation rules to express extra constraints over named items of a
                     specific class value.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/props/class">/component-definition/metadata/props/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/component-definition/metadata/props/class</p>
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
                     <h4 id="/component-definition/metadata/props/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/props/remarks">/component-definition/metadata/props/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/metadata/props/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/links" class="toc3 head">links</h3>
                  <p>An array of Link objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Link</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>links</code>.</p>
                        <p class="path">/component-definition/metadata/links</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/link"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/links">/component-definition/metadata/links</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>links</code>.</p>
                  <p class="path">/component-definition/metadata/links</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/links/href" class="toc4 head">href</h4>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                     can be an internet resource, or a local reference using a fragment e.g. #fragment
                     that points to a back-matter resource in the same document.If a local reference using
                     a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                     which references an identified resource in the document's back-matter or another object
                     that is within the scope of the containing OSCAL document.If an internet resource
                     is used, the href value will be an absolute or relative URI pointing to the location
                     of the referenced resource. A relative URI will be resolved relative to the location
                     of the document containing the link.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/links/href">/component-definition/metadata/links/href</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                     <p class="path">/component-definition/metadata/links/href</p>
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
                     <h4 id="/component-definition/metadata/links/rel" class="toc4 head">rel</h4>RelationDescribes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.
                     
                     Reference
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/links/rel">/component-definition/metadata/links/rel</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                     <p class="path">/component-definition/metadata/links/rel</p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/links/media-type" class="toc4 head">media-type</h4>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                     (IANA) Media Types Registry. 
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/links/media-type">/component-definition/metadata/links/media-type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                     <p class="path">/component-definition/metadata/links/media-type</p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/links/text" class="toc4 head">text</h4>Link TextA textual label to associate with the link, which may be used for presentation
                     in a tool.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/link/text"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/links/text">/component-definition/metadata/links/text</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                     <p class="path">/component-definition/metadata/links/text</p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/roles" class="toc3 head">roles</h3>
                  <p>An array of Role objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Role</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>roles</code>.</p>
                        <p class="path">/component-definition/metadata/roles</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/roles">/component-definition/metadata/roles</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>roles</code>.</p>
                  <p class="path">/component-definition/metadata/roles</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/roles/id" class="toc4 head">id</h4>Role IdentifierA unique identifier for a specific role instance. This identifier's
                     uniqueness is document scoped and is intended to be consistent for the same role across
                     minor revisions of the document.OSCAL has defined a set of standardized roles for
                     consistent use in OSCAL documents. This allows tools consuming OSCAL content to infer
                     specific semantics when these roles are used. These roles are documented in the specific
                     contexts of their use (e.g., responsible-party, responsible-role). When using such
                     a role, it is necessary to define these roles in this list, which will then allow
                     such a role to be referenced.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/@id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/roles/id">/component-definition/metadata/roles/id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                     <p class="path">/component-definition/metadata/roles/id</p>
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
                     <h4 id="/component-definition/metadata/roles/title" class="toc4 head">title</h4>Role TitleA name given to the role, which may be used by a tool for display and navigation.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/roles/title">/component-definition/metadata/roles/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Title</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/component-definition/metadata/roles/title</p>
                  </div>
                  <p class="description">A name given to the role, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/roles/short-name" class="toc4 head">short-name</h4>Role Short NameA short common name, abbreviation, or acronym for the role.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/short-name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/roles/short-name">/component-definition/metadata/roles/short-name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Short Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>short-name</code>.</p>
                     <p class="path">/component-definition/metadata/roles/short-name</p>
                  </div>
                  <p class="description">A short common name, abbreviation, or acronym for the role.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/roles/description" class="toc4 head">description</h4>Role DescriptionA summary of the role's purpose and associated responsibilities.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/description"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/roles/description">/component-definition/metadata/roles/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/component-definition/metadata/roles/description</p>
                  </div>
                  <p class="description">A summary of the role's purpose and associated responsibilities.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/roles/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/metadata/roles/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/roles/props">/component-definition/metadata/roles/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/metadata/roles/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/roles/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/props/name">/component-definition/metadata/roles/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/metadata/roles/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/roles/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/props/uuid">/component-definition/metadata/roles/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/metadata/roles/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/roles/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/props/ns">/component-definition/metadata/roles/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/metadata/roles/props/ns</p>
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
                        <h5 id="/component-definition/metadata/roles/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/props/value">/component-definition/metadata/roles/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/metadata/roles/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/roles/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/props/class">/component-definition/metadata/roles/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/metadata/roles/props/class</p>
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
                        <h5 id="/component-definition/metadata/roles/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/props/remarks">/component-definition/metadata/roles/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/metadata/roles/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/roles/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/component-definition/metadata/roles/links</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/roles/links">/component-definition/metadata/roles/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/component-definition/metadata/roles/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/roles/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/links/href">/component-definition/metadata/roles/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/metadata/roles/links/href</p>
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
                        <h5 id="/component-definition/metadata/roles/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/links/rel">/component-definition/metadata/roles/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/component-definition/metadata/roles/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/roles/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/links/media-type">/component-definition/metadata/roles/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/metadata/roles/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/roles/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/roles/links/text">/component-definition/metadata/roles/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/metadata/roles/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/roles/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/role/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/roles/remarks">/component-definition/metadata/roles/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/metadata/roles/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/locations" class="toc3 head">locations</h3>
                  <p>An array of Location objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Location</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>locations</code>.</p>
                        <p class="path">/component-definition/metadata/locations</p>
                     </div>
                     <p class="description">A location, with associated metadata that can be referenced.</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/locations">/component-definition/metadata/locations</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>locations</code>.</p>
                  <p class="path">/component-definition/metadata/locations</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/uuid" class="toc4 head">uuid</h4>Location Universally Unique IdentifierA unique identifier that can be used to reference
                     this defined location elsewhere in an OSCAL document. A UUID should be consistently
                     used for a given location across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/uuid">/component-definition/metadata/locations/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Location Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/metadata/locations/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this defined location elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given location across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/title" class="toc4 head">title</h4>Location TitleA name given to the location, which may be used by a tool for display
                     and navigation.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/title">/component-definition/metadata/locations/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Location Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/component-definition/metadata/locations/title</p>
                  </div>
                  <p class="description">A name given to the location, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/address" class="toc4 head">address</h4>AddressA postal address for the location.Address TypeIndicates the type of address.
                     
                     A home address.
                     A work address.
                     
                     
                     <p>An array of Address line strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Address line</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> member of array <code>addr-lines</code>.</p>
                           <p class="path">/component-definition/metadata/locations/address/addr-lines</p>
                        </div>
                        <p class="description">A single line of an address.</p>
                     </div>CityCity, town or geographical region for the mailing address.StateState, province
                     or analogous geographical region for mailing addressPostal CodePostal or ZIP code
                     for mailing addressCountry CodeThe ISO 3166-1 alpha-2 country code for the mailing
                     address.
                     
                     Typically, the physical address of the location will be used here. If this information
                     is sensitive, then a mailing address can be used instead.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/address"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/address">/component-definition/metadata/locations/address</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Address</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An object  with key <code>address</code>.</p>
                     <p class="path">/component-definition/metadata/locations/address</p>
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
                        <h5 id="/component-definition/metadata/locations/address/type" class="toc5 head">type</h5>Address TypeIndicates the type of address.
                        
                        A home address.
                        A work address.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/address/@type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/address/type">/component-definition/metadata/locations/address/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>type</code>.</p>
                        <p class="path">/component-definition/metadata/locations/address/type</p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/address/addr-lines" class="toc5 head">addr-lines</h5>
                        <p>An array of Address line strings</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Address line</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> member of array <code>addr-lines</code>.</p>
                              <p class="path">/component-definition/metadata/locations/address/addr-lines</p>
                           </div>
                           <p class="description">A single line of an address.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/address/addr-line"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/address/addr-lines">/component-definition/metadata/locations/address/addr-lines</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>addr-lines</code>.</p>
                        <p class="path">/component-definition/metadata/locations/address/addr-lines</p>
                     </div>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/address/city" class="toc5 head">city</h5>CityCity, town or geographical region for the mailing address.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/address/city"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/address/city">/component-definition/metadata/locations/address/city</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string City</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>city</code>.</p>
                        <p class="path">/component-definition/metadata/locations/address/city</p>
                     </div>
                     <p class="description">City, town or geographical region for the mailing address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/address/state" class="toc5 head">state</h5>StateState, province or analogous geographical region for mailing address
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/address/state"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/address/state">/component-definition/metadata/locations/address/state</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string State</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>state</code>.</p>
                        <p class="path">/component-definition/metadata/locations/address/state</p>
                     </div>
                     <p class="description">State, province or analogous geographical region for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/address/postal-code" class="toc5 head">postal-code</h5>Postal CodePostal or ZIP code for mailing address
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/address/postal-code"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/address/postal-code">/component-definition/metadata/locations/address/postal-code</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Postal Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>postal-code</code>.</p>
                        <p class="path">/component-definition/metadata/locations/address/postal-code</p>
                     </div>
                     <p class="description">Postal or ZIP code for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/address/country" class="toc5 head">country</h5>Country CodeThe ISO 3166-1 alpha-2 country code for the mailing address.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/address/country"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/address/country">/component-definition/metadata/locations/address/country</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Country Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>country</code>.</p>
                        <p class="path">/component-definition/metadata/locations/address/country</p>
                     </div>
                     <p class="description">The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/email-addresses" class="toc4 head">email-addresses</h4>
                     <p>An array of Email Address strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Email Address</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.email">email</a> member of array <code>email-addresses</code>.</p>
                           <p class="path">/component-definition/metadata/locations/email-addresses</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/email-address"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/email-addresses">/component-definition/metadata/locations/email-addresses</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>email-addresses</code>.</p>
                     <p class="path">/component-definition/metadata/locations/email-addresses</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/telephone-numbers" class="toc4 head">telephone-numbers</h4>
                     <p>An array of Telephone Number objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Telephone Number</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An object of type <a href="link.to.string">string</a> member of array <code>telephone-numbers</code>.</p>
                           <p class="path">/component-definition/metadata/locations/telephone-numbers</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/telephone-number"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/telephone-numbers">/component-definition/metadata/locations/telephone-numbers</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>telephone-numbers</code>.</p>
                     <p class="path">/component-definition/metadata/locations/telephone-numbers</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/telephone-numbers/type" class="toc5 head">type</h5>type flagIndicates the type of phone number.
                        
                        A home phone number.
                        An office phone number.
                        A mobile phone number.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/telephone-number/@type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/telephone-numbers/type">/component-definition/metadata/locations/telephone-numbers/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                        <p class="path">/component-definition/metadata/locations/telephone-numbers/type</p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/telephone-numbers/number" class="toc5 head">number</h5>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/telephone-number/number"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/telephone-numbers/number">/component-definition/metadata/locations/telephone-numbers/number</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>number</code>.</p>
                        <p class="path">/component-definition/metadata/locations/telephone-numbers/number</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/urls" class="toc4 head">urls</h4>
                     <p>An array of Location URL strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Location URL</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> member of array <code>urls</code>.</p>
                           <p class="path">/component-definition/metadata/locations/urls</p>
                        </div>
                        <p class="description">The uniform resource locator (URL) for a web site or Internet presence associated
                           with the location.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/url"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/urls">/component-definition/metadata/locations/urls</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>urls</code>.</p>
                     <p class="path">/component-definition/metadata/locations/urls</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/metadata/locations/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/props">/component-definition/metadata/locations/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/metadata/locations/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/props/name">/component-definition/metadata/locations/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/metadata/locations/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/props/uuid">/component-definition/metadata/locations/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/metadata/locations/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/props/ns">/component-definition/metadata/locations/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/metadata/locations/props/ns</p>
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
                        <h5 id="/component-definition/metadata/locations/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/props/value">/component-definition/metadata/locations/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/metadata/locations/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/props/class">/component-definition/metadata/locations/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/metadata/locations/props/class</p>
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
                        <h5 id="/component-definition/metadata/locations/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/props/remarks">/component-definition/metadata/locations/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/metadata/locations/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/component-definition/metadata/locations/links</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/links">/component-definition/metadata/locations/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/component-definition/metadata/locations/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/links/href">/component-definition/metadata/locations/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/metadata/locations/links/href</p>
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
                        <h5 id="/component-definition/metadata/locations/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/links/rel">/component-definition/metadata/locations/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/component-definition/metadata/locations/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/links/media-type">/component-definition/metadata/locations/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/metadata/locations/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/locations/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/locations/links/text">/component-definition/metadata/locations/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/metadata/locations/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/locations/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/location/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/locations/remarks">/component-definition/metadata/locations/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/metadata/locations/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/parties" class="toc3 head">parties</h3>
                  <p>An array of Party (organization or person) objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Party (organization or person)</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>parties</code>.</p>
                        <p class="path">/component-definition/metadata/parties</p>
                     </div>
                     <p class="description">A responsible entity which is either a person or an organization.</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/parties">/component-definition/metadata/parties</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>parties</code>.</p>
                  <p class="path">/component-definition/metadata/parties</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/uuid" class="toc4 head">uuid</h4>Party Universally Unique IdentifierA unique identifier that can be used to reference
                     this defined location elsewhere in an OSCAL document. A UUID should be consistently
                     used for a given party across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/uuid">/component-definition/metadata/parties/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/metadata/parties/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this defined location elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given party across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/type" class="toc4 head">type</h4>Party TypeA category describing the kind of party the object describes.
                     
                     An individual.
                     A group of individuals formed for a specific purpose.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/@type"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/type">/component-definition/metadata/parties/type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Type</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                     <p class="path">/component-definition/metadata/parties/type</p>
                  </div>
                  <p class="description">A category describing the kind of party the object describes.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/name" class="toc4 head">name</h4>Party NameThe full name of the party. This is typically the legal name associated
                     with the party.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/name">/component-definition/metadata/parties/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>name</code>.</p>
                     <p class="path">/component-definition/metadata/parties/name</p>
                  </div>
                  <p class="description">The full name of the party. This is typically the legal name associated with the party.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/short-name" class="toc4 head">short-name</h4>Party Short NameA short common name, abbreviation, or acronym for the party.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/short-name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/short-name">/component-definition/metadata/parties/short-name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Short Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>short-name</code>.</p>
                     <p class="path">/component-definition/metadata/parties/short-name</p>
                  </div>
                  <p class="description">A short common name, abbreviation, or acronym for the party.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/external-ids" class="toc4 head">external-ids</h4>
                     <p>An array of Party External Identifier objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Party External Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An object of type <a href="link.to.string">string</a> member of array <code>external-ids</code>.</p>
                           <p class="path">/component-definition/metadata/parties/external-ids</p>
                        </div>
                        <p class="description">An identifier for a person or organization using a designated scheme. e.g. an Open
                           Researcher and Contributor ID (ORCID)</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/external-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/external-ids">/component-definition/metadata/parties/external-ids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>external-ids</code>.</p>
                     <p class="path">/component-definition/metadata/parties/external-ids</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/external-ids/scheme" class="toc5 head">scheme</h5>External Identifier SchemaIndicates the type of external identifier.
                        
                        The identifier is Open Researcher and Contributor ID (ORCID).
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/external-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/external-ids/scheme">/component-definition/metadata/parties/external-ids/scheme</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string External Identifier Schema</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                        <p class="path">/component-definition/metadata/parties/external-ids/scheme</p>
                     </div>
                     <p class="description">Indicates the type of external identifier.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/external-ids/id" class="toc5 head">id</h5>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/external-id/id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/external-ids/id">/component-definition/metadata/parties/external-ids/id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>id</code>.</p>
                        <p class="path">/component-definition/metadata/parties/external-ids/id</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/metadata/parties/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/props">/component-definition/metadata/parties/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/metadata/parties/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/props/name">/component-definition/metadata/parties/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/metadata/parties/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/props/uuid">/component-definition/metadata/parties/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/metadata/parties/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/props/ns">/component-definition/metadata/parties/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/metadata/parties/props/ns</p>
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
                        <h5 id="/component-definition/metadata/parties/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/props/value">/component-definition/metadata/parties/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/metadata/parties/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/props/class">/component-definition/metadata/parties/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/metadata/parties/props/class</p>
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
                        <h5 id="/component-definition/metadata/parties/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/props/remarks">/component-definition/metadata/parties/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/metadata/parties/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/component-definition/metadata/parties/links</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/links">/component-definition/metadata/parties/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/component-definition/metadata/parties/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/links/href">/component-definition/metadata/parties/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/metadata/parties/links/href</p>
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
                        <h5 id="/component-definition/metadata/parties/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/links/rel">/component-definition/metadata/parties/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/component-definition/metadata/parties/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/links/media-type">/component-definition/metadata/parties/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/metadata/parties/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/links/text">/component-definition/metadata/parties/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/metadata/parties/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/email-addresses" class="toc4 head">email-addresses</h4>
                     <p>An array of Email Address strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Email Address</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.email">email</a> member of array <code>email-addresses</code>.</p>
                           <p class="path">/component-definition/metadata/parties/email-addresses</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/email-address"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/email-addresses">/component-definition/metadata/parties/email-addresses</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>email-addresses</code>.</p>
                     <p class="path">/component-definition/metadata/parties/email-addresses</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/telephone-numbers" class="toc4 head">telephone-numbers</h4>
                     <p>An array of Telephone Number objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Telephone Number</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An object of type <a href="link.to.string">string</a> member of array <code>telephone-numbers</code>.</p>
                           <p class="path">/component-definition/metadata/parties/telephone-numbers</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/telephone-number"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/telephone-numbers">/component-definition/metadata/parties/telephone-numbers</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>telephone-numbers</code>.</p>
                     <p class="path">/component-definition/metadata/parties/telephone-numbers</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/telephone-numbers/type" class="toc5 head">type</h5>type flagIndicates the type of phone number.
                        
                        A home phone number.
                        An office phone number.
                        A mobile phone number.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/telephone-number/@type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/telephone-numbers/type">/component-definition/metadata/parties/telephone-numbers/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                        <p class="path">/component-definition/metadata/parties/telephone-numbers/type</p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/telephone-numbers/number" class="toc5 head">number</h5>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/telephone-number/number"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/telephone-numbers/number">/component-definition/metadata/parties/telephone-numbers/number</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>number</code>.</p>
                        <p class="path">/component-definition/metadata/parties/telephone-numbers/number</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/addresses" class="toc4 head">addresses</h4>
                     <p>An array of Address objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Address</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>addresses</code>.</p>
                           <p class="path">/component-definition/metadata/parties/addresses</p>
                        </div>
                        <p class="description">A postal address for the location.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/address"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/addresses">/component-definition/metadata/parties/addresses</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>addresses</code>.</p>
                     <p class="path">/component-definition/metadata/parties/addresses</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/addresses/type" class="toc5 head">type</h5>Address TypeIndicates the type of address.
                        
                        A home address.
                        A work address.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/address/@type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/addresses/type">/component-definition/metadata/parties/addresses/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>type</code>.</p>
                        <p class="path">/component-definition/metadata/parties/addresses/type</p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/addresses/addr-lines" class="toc5 head">addr-lines</h5>
                        <p>An array of Address line strings</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Address line</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> member of array <code>addr-lines</code>.</p>
                              <p class="path">/component-definition/metadata/parties/addresses/addr-lines</p>
                           </div>
                           <p class="description">A single line of an address.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/address/addr-line"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/addresses/addr-lines">/component-definition/metadata/parties/addresses/addr-lines</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>addr-lines</code>.</p>
                        <p class="path">/component-definition/metadata/parties/addresses/addr-lines</p>
                     </div>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/addresses/city" class="toc5 head">city</h5>CityCity, town or geographical region for the mailing address.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/address/city"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/addresses/city">/component-definition/metadata/parties/addresses/city</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string City</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>city</code>.</p>
                        <p class="path">/component-definition/metadata/parties/addresses/city</p>
                     </div>
                     <p class="description">City, town or geographical region for the mailing address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/addresses/state" class="toc5 head">state</h5>StateState, province or analogous geographical region for mailing address
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/address/state"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/addresses/state">/component-definition/metadata/parties/addresses/state</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string State</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>state</code>.</p>
                        <p class="path">/component-definition/metadata/parties/addresses/state</p>
                     </div>
                     <p class="description">State, province or analogous geographical region for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/addresses/postal-code" class="toc5 head">postal-code</h5>Postal CodePostal or ZIP code for mailing address
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/address/postal-code"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/addresses/postal-code">/component-definition/metadata/parties/addresses/postal-code</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Postal Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>postal-code</code>.</p>
                        <p class="path">/component-definition/metadata/parties/addresses/postal-code</p>
                     </div>
                     <p class="description">Postal or ZIP code for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/parties/addresses/country" class="toc5 head">country</h5>Country CodeThe ISO 3166-1 alpha-2 country code for the mailing address.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/address/country"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/parties/addresses/country">/component-definition/metadata/parties/addresses/country</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Country Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>country</code>.</p>
                        <p class="path">/component-definition/metadata/parties/addresses/country</p>
                     </div>
                     <p class="description">The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/location-uuids" class="toc4 head">location-uuids</h4>
                     <p>An array of Location Reference strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Location Reference</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>location-uuids</code>.</p>
                           <p class="path">/component-definition/metadata/parties/location-uuids</p>
                        </div>
                        <p class="description">References a <code>location</code> defined in <code>metadata</code>. </p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/location-uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/location-uuids">/component-definition/metadata/parties/location-uuids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>location-uuids</code>.</p>
                     <p class="path">/component-definition/metadata/parties/location-uuids</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/member-of-organizations" class="toc4 head">member-of-organizations</h4>
                     <p>An array of Organizational Affiliation strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Organizational Affiliation</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>member-of-organizations</code>.</p>
                           <p class="path">/component-definition/metadata/parties/member-of-organizations</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/member-of-organization"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/member-of-organizations">/component-definition/metadata/parties/member-of-organizations</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>member-of-organizations</code>.</p>
                     <p class="path">/component-definition/metadata/parties/member-of-organizations</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/parties/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/party/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/parties/remarks">/component-definition/metadata/parties/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/metadata/parties/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/responsible-parties" class="toc3 head">responsible-parties</h3>
                  <p>An array of Responsible Party objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Responsible Party</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>responsible-parties</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties</p>
                     </div>
                     <p class="description">A reference to a set of organizations or persons that have responsibility for performing
                        a referenced role in the context of the containing object.</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties">/component-definition/metadata/responsible-parties</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>responsible-parties</code>.</p>
                  <p class="path">/component-definition/metadata/responsible-parties</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/responsible-parties/role-id" class="toc4 head">role-id</h4>Responsible RoleThe role that the party is responsible for.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/@role-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/role-id">/component-definition/metadata/responsible-parties/role-id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Responsible Role</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>role-id</code>.</p>
                     <p class="path">/component-definition/metadata/responsible-parties/role-id</p>
                  </div>
                  <p class="description">The role that the party is responsible for.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/responsible-parties/party-uuids" class="toc4 head">party-uuids</h4>
                     <p>An array of Party Reference strings</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Party Reference</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>party-uuids</code>.</p>
                           <p class="path">/component-definition/metadata/responsible-parties/party-uuids</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/party-uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/party-uuids">/component-definition/metadata/responsible-parties/party-uuids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An array  with key <code>party-uuids</code>.</p>
                     <p class="path">/component-definition/metadata/responsible-parties/party-uuids</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/responsible-parties/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/metadata/responsible-parties/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/props">/component-definition/metadata/responsible-parties/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/metadata/responsible-parties/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/responsible-parties/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/props/name">/component-definition/metadata/responsible-parties/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/responsible-parties/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/props/uuid">/component-definition/metadata/responsible-parties/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/responsible-parties/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/props/ns">/component-definition/metadata/responsible-parties/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/props/ns</p>
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
                        <h5 id="/component-definition/metadata/responsible-parties/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/props/value">/component-definition/metadata/responsible-parties/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/responsible-parties/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/props/class">/component-definition/metadata/responsible-parties/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/props/class</p>
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
                        <h5 id="/component-definition/metadata/responsible-parties/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/props/remarks">/component-definition/metadata/responsible-parties/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/responsible-parties/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/component-definition/metadata/responsible-parties/links</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/links">/component-definition/metadata/responsible-parties/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/component-definition/metadata/responsible-parties/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/responsible-parties/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/links/href">/component-definition/metadata/responsible-parties/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/links/href</p>
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
                        <h5 id="/component-definition/metadata/responsible-parties/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/links/rel">/component-definition/metadata/responsible-parties/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/responsible-parties/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/links/media-type">/component-definition/metadata/responsible-parties/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/metadata/responsible-parties/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/links/text">/component-definition/metadata/responsible-parties/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/metadata/responsible-parties/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/metadata/responsible-parties/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/responsible-party/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/metadata/responsible-parties/remarks">/component-definition/metadata/responsible-parties/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/metadata/responsible-parties/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/metadata/remarks" class="toc3 head">remarks</h3>RemarksAdditional commentary on the containing object.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/metadata/remarks"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/metadata/remarks">/component-definition/metadata/remarks</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                  <p class="path">/component-definition/metadata/remarks</p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
            </div>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/component-definition/import-component-definitions" class="toc2 head">import-component-definitions</h2>
               <p>An array of Import Component Definition objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Import Component Definition</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object of type <a href="link.to.empty">empty</a> member of array <code>import-component-definitions</code>.</p>
                     <p class="path">/component-definition/import-component-definitions</p>
                  </div>
                  <p class="description">Loads a component definition from another resource.</p>
               </div>
               <div class="crosslink"><a href="../xml-reference/#/component-definition/import-component-definition"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/component-definition/import-component-definitions">/component-definition/import-component-definitions</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">array </p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An array  with key <code>import-component-definitions</code>.</p>
               <p class="path">/component-definition/import-component-definitions</p>
            </div>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/import-component-definitions/href" class="toc3 head">href</h3>Hyperlink ReferenceA link to a resource that defines a set of components and/or capabilities
                  to import into this collection.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/import-component-definition/@href"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/import-component-definitions/href">/component-definition/import-component-definitions/href</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Hyperlink Reference</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                  <p class="path">/component-definition/import-component-definitions/href</p>
               </div>
               <p class="description">A link to a resource that defines a set of components and/or capabilities to import
                  into this collection.</p>
            </div>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/component-definition/components" class="toc2 head">components</h2>
               <p>An array of Component objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Component</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>components</code>.</p>
                     <p class="path">/component-definition/components</p>
                  </div>
                  <p class="description">A defined component that can be part of an implemented system.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Components may be products, services, APIs, policies, processes, plans, guidance,
                           standards, or other tangible items that enable security and/or privacy.</p>
                        <p>The <code>type</code> indicates which of these component types is represented.</p>
                        <p>A group of components may be aggregated into a <code>capability</code>. For example, an account management capability that consists of an account management
                           process, and a Lightweight Directory Access Protocol (LDAP) software implementation.</p>
                        <p>Capabilities are expressed by combining one or more components.</p>
                     </div>
                  </details>
               </div>
               <div class="crosslink"><a href="../xml-reference/#/component-definition/component"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/component-definition/components">/component-definition/components</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">array </p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An array  with key <code>components</code>.</p>
               <p class="path">/component-definition/components</p>
            </div>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/uuid" class="toc3 head">uuid</h3>Component IdentifierThe unique identifier for the component.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/@uuid"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/uuid">/component-definition/components/uuid</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Component Identifier</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                  <p class="path">/component-definition/components/uuid</p>
               </div>
               <p class="description">The unique identifier for the component.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/type" class="toc3 head">type</h3>Component TypeA category describing the purpose of the component.
                  
                  A connection to something outside this system.
                  Any software, operating system, or firmware.
                  A physical device.
                  A service that may provide APIs.
                  An enforceable policy.
                  A tangible asset used to provide physical protections or countermeasures.
                  
                  A list of steps or actions to take to achieve some end result.
                  An applicable plan.
                  Any guideline or recommendation.
                  Any organizational or industry standard.
                  An external assessment performed on some other component, that has been validated
                  by a third-party.
                  
                  
                  
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/@type"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/type">/component-definition/components/type</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Component Type</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                  <p class="path">/component-definition/components/type</p>
               </div>
               <p class="description">A category describing the purpose of the component.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/title" class="toc3 head">title</h3>Component TitleA human readable name for the component.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/title"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/title">/component-definition/components/title</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Component Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                  <p class="path">/component-definition/components/title</p>
               </div>
               <p class="description">A human readable name for the component.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/description" class="toc3 head">description</h3>Component DescriptionA description of the component, including information about its
                  function.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/description"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/description">/component-definition/components/description</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Component Description</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                  <p class="path">/component-definition/components/description</p>
               </div>
               <p class="description">A description of the component, including information about its function.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/purpose" class="toc3 head">purpose</h3>PurposeA summary of the technological or business purpose of the component.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/purpose"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/purpose">/component-definition/components/purpose</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Purpose</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>purpose</code>.</p>
                  <p class="path">/component-definition/components/purpose</p>
               </div>
               <p class="description">A summary of the technological or business purpose of the component.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/props" class="toc3 head">props</h3>
                  <p>An array of Property objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Property</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>props</code>.</p>
                        <p class="path">/component-definition/components/props</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/prop"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/props">/component-definition/components/props</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>props</code>.</p>
                  <p class="path">/component-definition/components/props</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/props/name" class="toc4 head">name</h4>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                     or quality of the property's containing object.
                     
                     A label or descriptor that is tied to a sensitivity or classification marking system.
                     An optional class can be used to define the specific marking system used for the associated
                     value.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/props/name">/component-definition/components/props/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/component-definition/components/props/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/props/uuid" class="toc4 head">uuid</h4>Property Universally Unique IdentifierA unique identifier that can be used to reference
                     this property elsewhere in an OSCAL document. A UUID should be consistently used for
                     a given location across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/props/uuid">/component-definition/components/props/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/components/props/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/props/ns" class="toc4 head">ns</h4>Property NamespaceA namespace qualifying the property's name. This allows different
                     organizations to associate distinct semantics with the same name.Provides a means
                     to segment the value space for the name, so that different organizations and individuals
                     can assert control over the allowed names and associated values used in a property.
                     This allows the semantics associated with a given name/value pair to be defined on
                     an organization-by-organization basis.An organization MUST use a URI that they have
                     control over. e.g., a domain registered to the organization in a URI, a registered
                     uniform resource names (URN) namespace.When a ns is not provided, its value should
                     be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                     by the associated OSCAL model.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/props/ns">/component-definition/components/props/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/component-definition/components/props/ns</p>
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
                     <h4 id="/component-definition/components/props/value" class="toc4 head">value</h4>Property ValueIndicates the value of the attribute, characteristic, or quality.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/props/value">/component-definition/components/props/value</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                     <p class="path">/component-definition/components/props/value</p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/props/class" class="toc4 head">class</h4>Property ClassA textual label that provides a sub-type or characterization of the
                     property's name. This can be used to further distinguish or discriminate between the
                     semantics of multiple properties of the same object with the same name and ns. A class
                     can be used in validation rules to express extra constraints over named items of a
                     specific class value.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/props/class">/component-definition/components/props/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/component-definition/components/props/class</p>
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
                     <h4 id="/component-definition/components/props/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/props/remarks">/component-definition/components/props/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/components/props/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/links" class="toc3 head">links</h3>
                  <p>An array of Link objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Link</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>links</code>.</p>
                        <p class="path">/component-definition/components/links</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/link"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/links">/component-definition/components/links</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>links</code>.</p>
                  <p class="path">/component-definition/components/links</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/links/href" class="toc4 head">href</h4>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                     can be an internet resource, or a local reference using a fragment e.g. #fragment
                     that points to a back-matter resource in the same document.If a local reference using
                     a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                     which references an identified resource in the document's back-matter or another object
                     that is within the scope of the containing OSCAL document.If an internet resource
                     is used, the href value will be an absolute or relative URI pointing to the location
                     of the referenced resource. A relative URI will be resolved relative to the location
                     of the document containing the link.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/links/href">/component-definition/components/links/href</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                     <p class="path">/component-definition/components/links/href</p>
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
                     <h4 id="/component-definition/components/links/rel" class="toc4 head">rel</h4>RelationDescribes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.
                     
                     Reference
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/links/rel">/component-definition/components/links/rel</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                     <p class="path">/component-definition/components/links/rel</p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/links/media-type" class="toc4 head">media-type</h4>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                     (IANA) Media Types Registry. 
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/links/media-type">/component-definition/components/links/media-type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                     <p class="path">/component-definition/components/links/media-type</p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/links/text" class="toc4 head">text</h4>Link TextA textual label to associate with the link, which may be used for presentation
                     in a tool.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/link/text"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/links/text">/component-definition/components/links/text</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                     <p class="path">/component-definition/components/links/text</p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/responsible-roles" class="toc3 head">responsible-roles</h3>
                  <p>An array of Responsible Role objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Responsible Role</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>responsible-roles</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles</p>
                     </div>
                     <p class="description">A reference to one or more roles with responsibility for performing a function relative
                        to the containing object.</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/responsible-roles">/component-definition/components/responsible-roles</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>responsible-roles</code>.</p>
                  <p class="path">/component-definition/components/responsible-roles</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/responsible-roles/role-id" class="toc4 head">role-id</h4>Responsible Role IDThe role that is responsible for the business function.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/@role-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/role-id">/component-definition/components/responsible-roles/role-id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Responsible Role ID</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>role-id</code>.</p>
                     <p class="path">/component-definition/components/responsible-roles/role-id</p>
                  </div>
                  <p class="description">The role that is responsible for the business function.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/responsible-roles/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/components/responsible-roles/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/props">/component-definition/components/responsible-roles/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/components/responsible-roles/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/responsible-roles/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/props/name">/component-definition/components/responsible-roles/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/responsible-roles/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/props/uuid">/component-definition/components/responsible-roles/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/responsible-roles/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/props/ns">/component-definition/components/responsible-roles/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/props/ns</p>
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
                        <h5 id="/component-definition/components/responsible-roles/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/props/value">/component-definition/components/responsible-roles/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/responsible-roles/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/props/class">/component-definition/components/responsible-roles/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/props/class</p>
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
                        <h5 id="/component-definition/components/responsible-roles/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/props/remarks">/component-definition/components/responsible-roles/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/responsible-roles/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/component-definition/components/responsible-roles/links</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/links">/component-definition/components/responsible-roles/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/component-definition/components/responsible-roles/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/responsible-roles/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/links/href">/component-definition/components/responsible-roles/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/links/href</p>
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
                        <h5 id="/component-definition/components/responsible-roles/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/links/rel">/component-definition/components/responsible-roles/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/responsible-roles/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/links/media-type">/component-definition/components/responsible-roles/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/responsible-roles/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/links/text">/component-definition/components/responsible-roles/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/components/responsible-roles/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/responsible-roles/party-uuids" class="toc4 head">party-uuids</h4>
                     <p>An array of Party Reference strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Party Reference</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>party-uuids</code>.</p>
                           <p class="path">/component-definition/components/responsible-roles/party-uuids</p>
                        </div>
                        <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/party-uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/party-uuids">/component-definition/components/responsible-roles/party-uuids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>party-uuids</code>.</p>
                     <p class="path">/component-definition/components/responsible-roles/party-uuids</p>
                  </div>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/responsible-roles/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/responsible-role/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/responsible-roles/remarks">/component-definition/components/responsible-roles/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/components/responsible-roles/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/protocols" class="toc3 head">protocols</h3>
                  <p>An array of Service Protocol Information objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Service Protocol Information</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>protocols</code>.</p>
                        <p class="path">/component-definition/components/protocols</p>
                     </div>
                     <p class="description">Information about the protocol used to provide a service.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks in-use">
                           <p class="nb">(In use)</p>
                           <p>Used for <code>service</code> components to define the protocols supported by the service.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/protocol"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/protocols">/component-definition/components/protocols</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>protocols</code>.</p>
                  <p class="path">/component-definition/components/protocols</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/protocols/uuid" class="toc4 head">uuid</h4>Service Protocol Information Universally Unique IdentifierA globally unique identifier
                     that can be used to reference this service protocol entry elsewhere in an OSCAL document.
                     A UUID should be consistently used for a given resource across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/protocol/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/protocols/uuid">/component-definition/components/protocols/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Service Protocol Information Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/components/protocols/uuid</p>
                  </div>
                  <p class="description">A globally unique identifier that can be used to reference this service protocol entry
                     elsewhere in an OSCAL document. A UUID should be consistently used for a given resource
                     across revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/protocols/name" class="toc4 head">name</h4>Protocol NameThe common name of the protocol, which should be the appropriate "service
                     name" from the IANA Service Name and Transport Protocol Port Number Registry. The
                     short name of the protocol (e.g., https).
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/protocol/@name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/protocols/name">/component-definition/components/protocols/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Protocol Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>name</code>.</p>
                     <p class="path">/component-definition/components/protocols/name</p>
                  </div>
                  <p class="description">The common name of the protocol, which should be the appropriate "service name" from
                     the <a>IANA Service Name and Transport Protocol Port Number Registry</a>. </p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The short name of the protocol (e.g., https).</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/protocols/title" class="toc4 head">title</h4>Protocol TitleA human readable name for the protocol (e.g., Transport Layer Security).
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/protocol/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/protocols/title">/component-definition/components/protocols/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Protocol Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/component-definition/components/protocols/title</p>
                  </div>
                  <p class="description">A human readable name for the protocol (e.g., Transport Layer Security).</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/protocols/port-ranges" class="toc4 head">port-ranges</h4>
                     <p>An array of Port Range objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Port Range</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object of type <a href="link.to.empty">empty</a> member of array <code>port-ranges</code>.</p>
                           <p class="path">/component-definition/components/protocols/port-ranges</p>
                        </div>
                        <p class="description">Where applicable this is the IPv4 port range on which the service operates.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To be validated as a natural number (integer &gt;= 1). A single port uses the same value
                                 for start and end. Use multiple 'port-range' entries for non-contiguous ranges.</p>
                           </div>
                        </details>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/protocol/port-range"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/protocols/port-ranges">/component-definition/components/protocols/port-ranges</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>port-ranges</code>.</p>
                     <p class="path">/component-definition/components/protocols/port-ranges</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/protocols/port-ranges/start" class="toc5 head">start</h5>StartIndicates the starting port number in a port rangeShould be a number within a
                        permitted range
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/protocol/port-range/@start"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/protocols/port-ranges/start">/component-definition/components/protocols/port-ranges/start</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Start</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.nonNegativeInteger">nonNegativeInteger</a> with key <code>start</code>.</p>
                        <p class="path">/component-definition/components/protocols/port-ranges/start</p>
                     </div>
                     <p class="description">Indicates the starting port number in a port range</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Should be a number within a permitted range</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/protocols/port-ranges/end" class="toc5 head">end</h5>EndIndicates the ending port number in a port rangeShould be a number within a permitted
                        range
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/protocol/port-range/@end"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/protocols/port-ranges/end">/component-definition/components/protocols/port-ranges/end</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string End</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.nonNegativeInteger">nonNegativeInteger</a> with key <code>end</code>.</p>
                        <p class="path">/component-definition/components/protocols/port-ranges/end</p>
                     </div>
                     <p class="description">Indicates the ending port number in a port range</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Should be a number within a permitted range</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/protocols/port-ranges/transport" class="toc5 head">transport</h5>TransportIndicates the transport type.
                        
                        Transmission Control Protocol
                        User Datagram Protocol
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/protocol/port-range/@transport"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/protocols/port-ranges/transport">/component-definition/components/protocols/port-ranges/transport</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Transport</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>transport</code>.</p>
                        <p class="path">/component-definition/components/protocols/port-ranges/transport</p>
                     </div>
                     <p class="description">Indicates the transport type.</p>
                  </div>
               </section>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/control-implementations" class="toc3 head">control-implementations</h3>
                  <p>An array of Control Implementation Set objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Control Implementation Set</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>control-implementations</code>.</p>
                        <p class="path">/component-definition/components/control-implementations</p>
                     </div>
                     <p class="description">Defines how the component or capability supports a set of controls.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Use of <code>set-parameter</code> in this context, sets the parameter for all related controls referenced in an <code>implemented-requirement</code>. If the same parameter is also set in a specific <code>implemented-requirement</code>, then the new value will override this value.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/control-implementations">/component-definition/components/control-implementations</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>control-implementations</code>.</p>
                  <p class="path">/component-definition/components/control-implementations</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/control-implementations/uuid" class="toc4 head">uuid</h4>Control Implementation Set IdentifierA unique identifier for the set of implemented
                     controls.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/control-implementations/uuid">/component-definition/components/control-implementations/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Control Implementation Set Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/components/control-implementations/uuid</p>
                  </div>
                  <p class="description">A unique identifier for the set of implemented controls.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/control-implementations/source" class="toc4 head">source</h4>Source Resource ReferenceA reference to an OSCAL catalog or profile providing the
                     referenced control or subcontrol definition.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/@source"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/control-implementations/source">/component-definition/components/control-implementations/source</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Source Resource Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>source</code>.</p>
                     <p class="path">/component-definition/components/control-implementations/source</p>
                  </div>
                  <p class="description">A reference to an OSCAL catalog or profile providing the referenced control or subcontrol
                     definition.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/control-implementations/description" class="toc4 head">description</h4>Control Implementation DescriptionA description of how the specified set of controls
                     are implemented for the containing component or capability.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/description"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/control-implementations/description">/component-definition/components/control-implementations/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Control Implementation Description</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/component-definition/components/control-implementations/description</p>
                  </div>
                  <p class="description">A description of how the specified set of controls are implemented for the containing
                     component or capability.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/control-implementations/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/control-implementations/props">/component-definition/components/control-implementations/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/components/control-implementations/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/props/name">/component-definition/components/control-implementations/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/props/uuid">/component-definition/components/control-implementations/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/props/ns">/component-definition/components/control-implementations/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/props/ns</p>
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
                        <h5 id="/component-definition/components/control-implementations/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/props/value">/component-definition/components/control-implementations/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/props/class">/component-definition/components/control-implementations/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/props/class</p>
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
                        <h5 id="/component-definition/components/control-implementations/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/props/remarks">/component-definition/components/control-implementations/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/control-implementations/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/links</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/control-implementations/links">/component-definition/components/control-implementations/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/component-definition/components/control-implementations/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/links/href">/component-definition/components/control-implementations/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/links/href</p>
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
                        <h5 id="/component-definition/components/control-implementations/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/links/rel">/component-definition/components/control-implementations/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/links/media-type">/component-definition/components/control-implementations/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/links/text">/component-definition/components/control-implementations/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/control-implementations/set-parameters" class="toc4 head">set-parameters</h4>
                     <p>An array of Set Parameter Value objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Set Parameter Value</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>set-parameters</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/set-parameters</p>
                        </div>
                        <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/set-parameter"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/control-implementations/set-parameters">/component-definition/components/control-implementations/set-parameters</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>set-parameters</code>.</p>
                     <p class="path">/component-definition/components/control-implementations/set-parameters</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/set-parameters/param-id" class="toc5 head">param-id</h5>Parameter IDA reference to a parameter within a control, who's catalog has been imported
                        into the current implementation context.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/set-parameter/@param-id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/set-parameters/param-id">/component-definition/components/control-implementations/set-parameters/param-id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter ID</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>param-id</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/set-parameters/param-id</p>
                     </div>
                     <p class="description">A reference to a parameter within a control, who's catalog has been imported into
                        the current implementation context.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/set-parameters/values" class="toc5 head">values</h5>
                        <p>An array of Parameter Value strings</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Parameter Value</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/set-parameters/values</p>
                           </div>
                           <p class="description">A parameter value or set of values.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/set-parameter/value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/set-parameters/values">/component-definition/components/control-implementations/set-parameters/values</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An array  with key <code>values</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/set-parameters/values</p>
                     </div>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/set-parameters/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/set-parameter/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/set-parameters/remarks">/component-definition/components/control-implementations/set-parameters/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/set-parameters/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/components/control-implementations/implemented-requirements" class="toc4 head">implemented-requirements</h4>
                     <p>An array of Control Implementation objects</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Control Implementation</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>implemented-requirements</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements</p>
                        </div>
                        <p class="description">Describes how the containing component or capability implements an individual control.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements">/component-definition/components/control-implementations/implemented-requirements</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An array  with key <code>implemented-requirements</code>.</p>
                     <p class="path">/component-definition/components/control-implementations/implemented-requirements</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/uuid" class="toc5 head">uuid</h5>Control Implementation IdentifierA unique identifier for a specific control implementation.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/uuid">/component-definition/components/control-implementations/implemented-requirements/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Control Implementation Identifier</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/uuid</p>
                     </div>
                     <p class="description">A unique identifier for a specific control implementation.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/control-id" class="toc5 head">control-id</h5>Control Identifier ReferenceA reference to a control with a corresponding id value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/@control-id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/control-id">/component-definition/components/control-implementations/implemented-requirements/control-id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Control Identifier Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>control-id</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/control-id</p>
                     </div>
                     <p class="description">A reference to a control with a corresponding <code>id</code> value.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/description" class="toc5 head">description</h5>Control Implementation DescriptionA description of how the specified control is implemented
                        for the containing component or capability.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/description"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/description">/component-definition/components/control-implementations/implemented-requirements/description</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Control Implementation Description</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/description</p>
                     </div>
                     <p class="description">A description of how the specified control is implemented for the containing component
                        or capability.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/props" class="toc5 head">props</h5>
                        <p>An array of Property objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Property</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>props</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/props</p>
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
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/props">/component-definition/components/control-implementations/implemented-requirements/props</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>props</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/props</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/props/name" class="toc6 head">name</h6>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                           or quality of the property's containing object.
                           
                           A label or descriptor that is tied to a sensitivity or classification marking system.
                           An optional class can be used to define the specific marking system used for the associated
                           value.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/props/name">/component-definition/components/control-implementations/implemented-requirements/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/props/uuid" class="toc6 head">uuid</h6>Property Universally Unique IdentifierA unique identifier that can be used to reference
                           this property elsewhere in an OSCAL document. A UUID should be consistently used for
                           a given location across revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/props/uuid">/component-definition/components/control-implementations/implemented-requirements/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/props/ns" class="toc6 head">ns</h6>Property NamespaceA namespace qualifying the property's name. This allows different
                           organizations to associate distinct semantics with the same name.Provides a means
                           to segment the value space for the name, so that different organizations and individuals
                           can assert control over the allowed names and associated values used in a property.
                           This allows the semantics associated with a given name/value pair to be defined on
                           an organization-by-organization basis.An organization MUST use a URI that they have
                           control over. e.g., a domain registered to the organization in a URI, a registered
                           uniform resource names (URN) namespace.When a ns is not provided, its value should
                           be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                           by the associated OSCAL model.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/props/ns">/component-definition/components/control-implementations/implemented-requirements/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/props/ns</p>
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
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/props/value" class="toc6 head">value</h6>Property ValueIndicates the value of the attribute, characteristic, or quality.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/props/value">/component-definition/components/control-implementations/implemented-requirements/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/props/class" class="toc6 head">class</h6>Property ClassA textual label that provides a sub-type or characterization of the
                           property's name. This can be used to further distinguish or discriminate between the
                           semantics of multiple properties of the same object with the same name and ns. A class
                           can be used in validation rules to express extra constraints over named items of a
                           specific class value.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/props/class">/component-definition/components/control-implementations/implemented-requirements/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/props/class</p>
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
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/props/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/props/remarks">/component-definition/components/control-implementations/implemented-requirements/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/links" class="toc5 head">links</h5>
                        <p>An array of Link objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Link</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>links</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/links</p>
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
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/links">/component-definition/components/control-implementations/implemented-requirements/links</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>links</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/links</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/links/href" class="toc6 head">href</h6>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                           can be an internet resource, or a local reference using a fragment e.g. #fragment
                           that points to a back-matter resource in the same document.If a local reference using
                           a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                           which references an identified resource in the document's back-matter or another object
                           that is within the scope of the containing OSCAL document.If an internet resource
                           is used, the href value will be an absolute or relative URI pointing to the location
                           of the referenced resource. A relative URI will be resolved relative to the location
                           of the document containing the link.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/links/href">/component-definition/components/control-implementations/implemented-requirements/links/href</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/links/href</p>
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
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/links/rel" class="toc6 head">rel</h6>RelationDescribes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.
                           
                           Reference
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/links/rel">/component-definition/components/control-implementations/implemented-requirements/links/rel</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/links/rel</p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/links/media-type" class="toc6 head">media-type</h6>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                           (IANA) Media Types Registry. 
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/links/media-type">/component-definition/components/control-implementations/implemented-requirements/links/media-type</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/links/media-type</p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/links/text" class="toc6 head">text</h6>Link TextA textual label to associate with the link, which may be used for presentation
                           in a tool.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link/text"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/links/text">/component-definition/components/control-implementations/implemented-requirements/links/text</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/links/text</p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/set-parameters" class="toc5 head">set-parameters</h5>
                        <p>An array of Set Parameter Value objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Set Parameter Value</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>set-parameters</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/set-parameters</p>
                           </div>
                           <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/set-parameter"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/set-parameters">/component-definition/components/control-implementations/implemented-requirements/set-parameters</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>set-parameters</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/set-parameters</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/set-parameters/param-id" class="toc6 head">param-id</h6>Parameter IDA reference to a parameter within a control, who's catalog has been imported
                           into the current implementation context.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/@param-id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/param-id">/component-definition/components/control-implementations/implemented-requirements/set-parameters/param-id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter ID</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>param-id</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/set-parameters/param-id</p>
                        </div>
                        <p class="description">A reference to a parameter within a control, who's catalog has been imported into
                           the current implementation context.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/set-parameters/values" class="toc6 head">values</h6>
                           <p>An array of Parameter Value strings</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Parameter Value</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/set-parameters/values</p>
                              </div>
                              <p class="description">A parameter value or set of values.</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/values">/component-definition/components/control-implementations/implemented-requirements/set-parameters/values</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An array  with key <code>values</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/set-parameters/values</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/set-parameters/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/remarks">/component-definition/components/control-implementations/implemented-requirements/set-parameters/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/set-parameters/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles" class="toc5 head">responsible-roles</h5>
                        <p>An array of Responsible Role objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Responsible Role</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>responsible-roles</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles</p>
                           </div>
                           <p class="description">A reference to one or more roles with responsibility for performing a function relative
                              to the containing object.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles">/component-definition/components/control-implementations/implemented-requirements/responsible-roles</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>responsible-roles</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/role-id" class="toc6 head">role-id</h6>Responsible Role IDThe role that is responsible for the business function.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/@role-id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/role-id">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/role-id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Responsible Role ID</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>role-id</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/role-id</p>
                        </div>
                        <p class="description">The role that is responsible for the business function.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props" class="toc6 head">props</h6>
                           <p>An array of Property objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Property</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>props</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props</p>
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>props</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/name" class="toc7 head">name</h7>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                              or quality of the property's containing object.
                              
                              A label or descriptor that is tied to a sensitivity or classification marking system.
                              An optional class can be used to define the specific marking system used for the associated
                              value.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/name">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/name</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/name</p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/uuid" class="toc7 head">uuid</h7>Property Universally Unique IdentifierA unique identifier that can be used to reference
                              this property elsewhere in an OSCAL document. A UUID should be consistently used for
                              a given location across revisions of the document.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/uuid">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/uuid</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/uuid</p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/ns" class="toc7 head">ns</h7>Property NamespaceA namespace qualifying the property's name. This allows different
                              organizations to associate distinct semantics with the same name.Provides a means
                              to segment the value space for the name, so that different organizations and individuals
                              can assert control over the allowed names and associated values used in a property.
                              This allows the semantics associated with a given name/value pair to be defined on
                              an organization-by-organization basis.An organization MUST use a URI that they have
                              control over. e.g., a domain registered to the organization in a URI, a registered
                              uniform resource names (URN) namespace.When a ns is not provided, its value should
                              be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                              by the associated OSCAL model.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/ns">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/ns</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/ns</p>
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
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/value" class="toc7 head">value</h7>Property ValueIndicates the value of the attribute, characteristic, or quality.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/value">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/value</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/value</p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/class" class="toc7 head">class</h7>Property ClassA textual label that provides a sub-type or characterization of the
                              property's name. This can be used to further distinguish or discriminate between the
                              semantics of multiple properties of the same object with the same name and ns. A class
                              can be used in validation rules to express extra constraints over named items of a
                              specific class value.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/class">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/class</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/class</p>
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
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/remarks">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links" class="toc6 head">links</h6>
                           <p>An array of Link objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Link</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>links</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links</p>
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>links</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/href" class="toc7 head">href</h7>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                              can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a back-matter resource in the same document.If a local reference using
                              a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                              which references an identified resource in the document's back-matter or another object
                              that is within the scope of the containing OSCAL document.If an internet resource
                              is used, the href value will be an absolute or relative URI pointing to the location
                              of the referenced resource. A relative URI will be resolved relative to the location
                              of the document containing the link.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/href">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/href</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/href</p>
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
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/rel" class="toc7 head">rel</h7>RelationDescribes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.
                              
                              Reference
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/rel">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/rel</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/rel</p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/media-type" class="toc7 head">media-type</h7>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                              (IANA) Media Types Registry. 
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/media-type">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/media-type</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/media-type</p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/text" class="toc7 head">text</h7>Link TextA textual label to associate with the link, which may be used for presentation
                              in a tool.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/text"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/text">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/text</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/text</p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/party-uuids" class="toc6 head">party-uuids</h6>
                           <p>An array of Party Reference strings</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Party Reference</p>
                                 <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>party-uuids</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/party-uuids</p>
                              </div>
                              <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/party-uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/party-uuids">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/party-uuids</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>party-uuids</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/party-uuids</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/responsible-roles/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/remarks">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/responsible-roles/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/statements" class="toc5 head">statements</h5>
                        <p>An array of Control Statement Implementation objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Control Statement Implementation</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>statements</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements</p>
                           </div>
                           <p class="description">Identifies which statements within a control are addressed.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements">/component-definition/components/control-implementations/implemented-requirements/statements</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>statements</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/statements/statement-id" class="toc6 head">statement-id</h6>Control Statement ReferenceA reference to a control statement by its identifier
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/@statement-id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/statement-id">/component-definition/components/control-implementations/implemented-requirements/statements/statement-id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Control Statement Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>statement-id</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/statement-id</p>
                        </div>
                        <p class="description">A reference to a control statement by its identifier</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/statements/uuid" class="toc6 head">uuid</h6>Control Statement Reference Universally Unique IdentifierA globally unique identifier
                           that can be used to reference this control statement entry elsewhere in an OSCAL document.
                           A UUID should be consistently used for a given resource across revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/uuid">/component-definition/components/control-implementations/implemented-requirements/statements/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Control Statement Reference Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/uuid</p>
                        </div>
                        <p class="description">A globally unique identifier that can be used to reference this control statement
                           entry elsewhere in an OSCAL document. A UUID should be consistently used for a given
                           resource across revisions of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/statements/description" class="toc6 head">description</h6>Statement Implementation DescriptionA summary of how the containing control statement
                           is implemented by the component or capability.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/description"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/description">/component-definition/components/control-implementations/implemented-requirements/statements/description</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Statement Implementation Description</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/description</p>
                        </div>
                        <p class="description">A summary of how the containing control statement is implemented by the component
                           or capability.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/statements/props" class="toc6 head">props</h6>
                           <p>An array of Property objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Property</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>props</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/props</p>
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/props">/component-definition/components/control-implementations/implemented-requirements/statements/props</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>props</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/props</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/props/name" class="toc7 head">name</h7>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                              or quality of the property's containing object.
                              
                              A label or descriptor that is tied to a sensitivity or classification marking system.
                              An optional class can be used to define the specific marking system used for the associated
                              value.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/props/name">/component-definition/components/control-implementations/implemented-requirements/statements/props/name</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/props/name</p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/props/uuid" class="toc7 head">uuid</h7>Property Universally Unique IdentifierA unique identifier that can be used to reference
                              this property elsewhere in an OSCAL document. A UUID should be consistently used for
                              a given location across revisions of the document.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/props/uuid">/component-definition/components/control-implementations/implemented-requirements/statements/props/uuid</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/props/uuid</p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/props/ns" class="toc7 head">ns</h7>Property NamespaceA namespace qualifying the property's name. This allows different
                              organizations to associate distinct semantics with the same name.Provides a means
                              to segment the value space for the name, so that different organizations and individuals
                              can assert control over the allowed names and associated values used in a property.
                              This allows the semantics associated with a given name/value pair to be defined on
                              an organization-by-organization basis.An organization MUST use a URI that they have
                              control over. e.g., a domain registered to the organization in a URI, a registered
                              uniform resource names (URN) namespace.When a ns is not provided, its value should
                              be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                              by the associated OSCAL model.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/props/ns">/component-definition/components/control-implementations/implemented-requirements/statements/props/ns</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/props/ns</p>
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
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/props/value" class="toc7 head">value</h7>Property ValueIndicates the value of the attribute, characteristic, or quality.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/props/value">/component-definition/components/control-implementations/implemented-requirements/statements/props/value</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/props/value</p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/props/class" class="toc7 head">class</h7>Property ClassA textual label that provides a sub-type or characterization of the
                              property's name. This can be used to further distinguish or discriminate between the
                              semantics of multiple properties of the same object with the same name and ns. A class
                              can be used in validation rules to express extra constraints over named items of a
                              specific class value.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/props/class">/component-definition/components/control-implementations/implemented-requirements/statements/props/class</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/props/class</p>
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
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/props/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/props/remarks">/component-definition/components/control-implementations/implemented-requirements/statements/props/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/props/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/statements/links" class="toc6 head">links</h6>
                           <p>An array of Link objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Link</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>links</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/links</p>
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/links">/component-definition/components/control-implementations/implemented-requirements/statements/links</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>links</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/links</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/links/href" class="toc7 head">href</h7>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                              can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a back-matter resource in the same document.If a local reference using
                              a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                              which references an identified resource in the document's back-matter or another object
                              that is within the scope of the containing OSCAL document.If an internet resource
                              is used, the href value will be an absolute or relative URI pointing to the location
                              of the referenced resource. A relative URI will be resolved relative to the location
                              of the document containing the link.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/links/href">/component-definition/components/control-implementations/implemented-requirements/statements/links/href</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/links/href</p>
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
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/links/rel" class="toc7 head">rel</h7>RelationDescribes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.
                              
                              Reference
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/links/rel">/component-definition/components/control-implementations/implemented-requirements/statements/links/rel</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/links/rel</p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/links/media-type" class="toc7 head">media-type</h7>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                              (IANA) Media Types Registry. 
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/links/media-type">/component-definition/components/control-implementations/implemented-requirements/statements/links/media-type</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/links/media-type</p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/links/text" class="toc7 head">text</h7>Link TextA textual label to associate with the link, which may be used for presentation
                              in a tool.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link/text"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/links/text">/component-definition/components/control-implementations/implemented-requirements/statements/links/text</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/links/text</p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles" class="toc6 head">responsible-roles</h6>
                           <p>An array of Responsible Role objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Responsible Role</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>responsible-roles</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles</p>
                              </div>
                              <p class="description">A reference to one or more roles with responsibility for performing a function relative
                                 to the containing object.</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>responsible-roles</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/role-id" class="toc7 head">role-id</h7>Responsible Role IDThe role that is responsible for the business function.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/@role-id"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/role-id">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/role-id</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Responsible Role ID</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>role-id</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/role-id</p>
                           </div>
                           <p class="description">The role that is responsible for the business function.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props" class="toc7 head">props</h7>
                              <p>An array of Property objects</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">object Property</p>
                                    <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                    <p>An object  member of array <code>props</code>.</p>
                                    <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props</p>
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
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>props</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props</p>
                           </div>
                        </div>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/name" class="toc8 head">name</h8>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                                 or quality of the property's containing object.
                                 
                                 A label or descriptor that is tied to a sensitivity or classification marking system.
                                 An optional class can be used to define the specific marking system used for the associated
                                 value.
                                 
                                 
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/name">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/name</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Name</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/name</p>
                              </div>
                              <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                                 quality of the property's containing object.</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid" class="toc8 head">uuid</h8>Property Universally Unique IdentifierA unique identifier that can be used to reference
                                 this property elsewhere in an OSCAL document. A UUID should be consistently used for
                                 a given location across revisions of the document.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Universally Unique Identifier</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid</p>
                              </div>
                              <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                                 document. A UUID should be consistently used for a given location across revisions
                                 of the document.</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/ns" class="toc8 head">ns</h8>Property NamespaceA namespace qualifying the property's name. This allows different
                                 organizations to associate distinct semantics with the same name.Provides a means
                                 to segment the value space for the name, so that different organizations and individuals
                                 can assert control over the allowed names and associated values used in a property.
                                 This allows the semantics associated with a given name/value pair to be defined on
                                 an organization-by-organization basis.An organization MUST use a URI that they have
                                 control over. e.g., a domain registered to the organization in a URI, a registered
                                 uniform resource names (URN) namespace.When a ns is not provided, its value should
                                 be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                                 by the associated OSCAL model.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/ns">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/ns</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Namespace</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/ns</p>
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
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/value" class="toc8 head">value</h8>Property ValueIndicates the value of the attribute, characteristic, or quality.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/value">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/value</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Value</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/value</p>
                              </div>
                              <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/class" class="toc8 head">class</h8>Property ClassA textual label that provides a sub-type or characterization of the
                                 property's name. This can be used to further distinguish or discriminate between the
                                 semantics of multiple properties of the same object with the same name and ns. A class
                                 can be used in validation rules to express extra constraints over named items of a
                                 specific class value.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/class">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/class</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Class</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/class</p>
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
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks" class="toc8 head">remarks</h8>RemarksAdditional commentary on the containing object.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Remarks</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks</p>
                              </div>
                              <p class="description">Additional commentary on the containing object.</p>
                           </div>
                        </section>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links" class="toc7 head">links</h7>
                              <p>An array of Link objects</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">object Link</p>
                                    <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                    <p>An object  member of array <code>links</code>.</p>
                                    <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links</p>
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
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>links</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links</p>
                           </div>
                        </div>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/href" class="toc8 head">href</h8>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                                 can be an internet resource, or a local reference using a fragment e.g. #fragment
                                 that points to a back-matter resource in the same document.If a local reference using
                                 a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                                 which references an identified resource in the document's back-matter or another object
                                 that is within the scope of the containing OSCAL document.If an internet resource
                                 is used, the href value will be an absolute or relative URI pointing to the location
                                 of the referenced resource. A relative URI will be resolved relative to the location
                                 of the document containing the link.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/href">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/href</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Hypertext Reference</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/href</p>
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
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/rel" class="toc8 head">rel</h8>RelationDescribes the type of relationship provided by the link. This can be an indicator
                                 of the link's purpose.
                                 
                                 Reference
                                 
                                 
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/rel">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/rel</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Relation</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/rel</p>
                              </div>
                              <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                                 of the link's purpose.</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type" class="toc8 head">media-type</h8>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                                 (IANA) Media Types Registry. 
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Media Type</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type</p>
                              </div>
                              <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                                 <a>Media Types Registry</a>. </p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/text" class="toc8 head">text</h8>Link TextA textual label to associate with the link, which may be used for presentation
                                 in a tool.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/text"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/text">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/text</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Link Text</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                                 <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/text</p>
                              </div>
                              <p class="description">A textual label to associate with the link, which may be used for presentation in
                                 a tool.</p>
                           </div>
                        </section>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids" class="toc7 head">party-uuids</h7>
                              <p>An array of Party Reference strings</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">string Party Reference</p>
                                    <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                    <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>party-uuids</code>.</p>
                                    <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids</p>
                                 </div>
                                 <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/party-uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>party-uuids</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids</p>
                           </div>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/remarks">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/components/control-implementations/implemented-requirements/statements/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/statements/remarks">/component-definition/components/control-implementations/implemented-requirements/statements/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/components/control-implementations/implemented-requirements/statements/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/components/control-implementations/implemented-requirements/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/components/control-implementations/implemented-requirements/remarks">/component-definition/components/control-implementations/implemented-requirements/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/components/control-implementations/implemented-requirements/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/components/remarks" class="toc3 head">remarks</h3>RemarksAdditional commentary on the containing object.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/component/remarks"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/components/remarks">/component-definition/components/remarks</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                  <p class="path">/component-definition/components/remarks</p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
            </div>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/component-definition/capabilities" class="toc2 head">capabilities</h2>
               <p>An array of Capability objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Capability</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>capabilities</code>.</p>
                     <p class="path">/component-definition/capabilities</p>
                  </div>
                  <p class="description">A grouping of other components and/or capabilities.</p>
               </div>
               <div class="crosslink"><a href="../xml-reference/#/component-definition/capability"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/component-definition/capabilities">/component-definition/capabilities</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">array </p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An array  with key <code>capabilities</code>.</p>
               <p class="path">/component-definition/capabilities</p>
            </div>
         </div>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/capabilities/uuid" class="toc3 head">uuid</h3>Capability IdentifierA unique identifier for a capability.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/@uuid"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/capabilities/uuid">/component-definition/capabilities/uuid</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Capability Identifier</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                  <p class="path">/component-definition/capabilities/uuid</p>
               </div>
               <p class="description">A unique identifier for a capability.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/capabilities/name" class="toc3 head">name</h3>Capability NameThe capability's human-readable name.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/@name"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/capabilities/name">/component-definition/capabilities/name</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Capability Name</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> with key <code>name</code>.</p>
                  <p class="path">/component-definition/capabilities/name</p>
               </div>
               <p class="description">The capability's human-readable name.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/capabilities/description" class="toc3 head">description</h3>Capability DescriptionA summary of the capability.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/description"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/capabilities/description">/component-definition/capabilities/description</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Capability Description</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                  <p class="path">/component-definition/capabilities/description</p>
               </div>
               <p class="description">A summary of the capability.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/capabilities/props" class="toc3 head">props</h3>
                  <p>An array of Property objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Property</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>props</code>.</p>
                        <p class="path">/component-definition/capabilities/props</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/prop"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/capabilities/props">/component-definition/capabilities/props</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>props</code>.</p>
                  <p class="path">/component-definition/capabilities/props</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/props/name" class="toc4 head">name</h4>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                     or quality of the property's containing object.
                     
                     A label or descriptor that is tied to a sensitivity or classification marking system.
                     An optional class can be used to define the specific marking system used for the associated
                     value.
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/props/name">/component-definition/capabilities/props/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/component-definition/capabilities/props/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/props/uuid" class="toc4 head">uuid</h4>Property Universally Unique IdentifierA unique identifier that can be used to reference
                     this property elsewhere in an OSCAL document. A UUID should be consistently used for
                     a given location across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/props/uuid">/component-definition/capabilities/props/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/capabilities/props/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/props/ns" class="toc4 head">ns</h4>Property NamespaceA namespace qualifying the property's name. This allows different
                     organizations to associate distinct semantics with the same name.Provides a means
                     to segment the value space for the name, so that different organizations and individuals
                     can assert control over the allowed names and associated values used in a property.
                     This allows the semantics associated with a given name/value pair to be defined on
                     an organization-by-organization basis.An organization MUST use a URI that they have
                     control over. e.g., a domain registered to the organization in a URI, a registered
                     uniform resource names (URN) namespace.When a ns is not provided, its value should
                     be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                     by the associated OSCAL model.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/props/ns">/component-definition/capabilities/props/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/component-definition/capabilities/props/ns</p>
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
                     <h4 id="/component-definition/capabilities/props/value" class="toc4 head">value</h4>Property ValueIndicates the value of the attribute, characteristic, or quality.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/props/value">/component-definition/capabilities/props/value</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                     <p class="path">/component-definition/capabilities/props/value</p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/props/class" class="toc4 head">class</h4>Property ClassA textual label that provides a sub-type or characterization of the
                     property's name. This can be used to further distinguish or discriminate between the
                     semantics of multiple properties of the same object with the same name and ns. A class
                     can be used in validation rules to express extra constraints over named items of a
                     specific class value.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/props/class">/component-definition/capabilities/props/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/component-definition/capabilities/props/class</p>
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
                     <h4 id="/component-definition/capabilities/props/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/props/remarks">/component-definition/capabilities/props/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/capabilities/props/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/capabilities/links" class="toc3 head">links</h3>
                  <p>An array of Link objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Link</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>links</code>.</p>
                        <p class="path">/component-definition/capabilities/links</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/link"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/capabilities/links">/component-definition/capabilities/links</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>links</code>.</p>
                  <p class="path">/component-definition/capabilities/links</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/links/href" class="toc4 head">href</h4>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                     can be an internet resource, or a local reference using a fragment e.g. #fragment
                     that points to a back-matter resource in the same document.If a local reference using
                     a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                     which references an identified resource in the document's back-matter or another object
                     that is within the scope of the containing OSCAL document.If an internet resource
                     is used, the href value will be an absolute or relative URI pointing to the location
                     of the referenced resource. A relative URI will be resolved relative to the location
                     of the document containing the link.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/links/href">/component-definition/capabilities/links/href</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                     <p class="path">/component-definition/capabilities/links/href</p>
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
                     <h4 id="/component-definition/capabilities/links/rel" class="toc4 head">rel</h4>RelationDescribes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.
                     
                     Reference
                     
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/links/rel">/component-definition/capabilities/links/rel</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                     <p class="path">/component-definition/capabilities/links/rel</p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/links/media-type" class="toc4 head">media-type</h4>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                     (IANA) Media Types Registry. 
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/links/media-type">/component-definition/capabilities/links/media-type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                     <p class="path">/component-definition/capabilities/links/media-type</p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/links/text" class="toc4 head">text</h4>Link TextA textual label to associate with the link, which may be used for presentation
                     in a tool.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/link/text"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/links/text">/component-definition/capabilities/links/text</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                     <p class="path">/component-definition/capabilities/links/text</p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/capabilities/incorporates-components" class="toc3 head">incorporates-components</h3>
                  <p>An array of Incorporates Component objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Incorporates Component</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>incorporates-components</code>.</p>
                        <p class="path">/component-definition/capabilities/incorporates-components</p>
                     </div>
                     <p class="description">TBD</p>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/incorporates-component"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/capabilities/incorporates-components">/component-definition/capabilities/incorporates-components</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>incorporates-components</code>.</p>
                  <p class="path">/component-definition/capabilities/incorporates-components</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/incorporates-components/component-uuid" class="toc4 head">component-uuid</h4>Component ReferenceA reference to a component by its identifier
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/incorporates-component/@component-uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/incorporates-components/component-uuid">/component-definition/capabilities/incorporates-components/component-uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Component Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>component-uuid</code>.</p>
                     <p class="path">/component-definition/capabilities/incorporates-components/component-uuid</p>
                  </div>
                  <p class="description">A reference to a component by its identifier</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/incorporates-components/description" class="toc4 head">description</h4>Component DescriptionA description of the component, including information about its
                     function.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/incorporates-component/description"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/incorporates-components/description">/component-definition/capabilities/incorporates-components/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Component Description</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/component-definition/capabilities/incorporates-components/description</p>
                  </div>
                  <p class="description">A description of the component, including information about its function.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/capabilities/control-implementations" class="toc3 head">control-implementations</h3>
                  <p>An array of Control Implementation Set objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Control Implementation Set</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>control-implementations</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations</p>
                     </div>
                     <p class="description">Defines how the component or capability supports a set of controls.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Use of <code>set-parameter</code> in this context, sets the parameter for all related controls referenced in an <code>implemented-requirement</code>. If the same parameter is also set in a specific <code>implemented-requirement</code>, then the new value will override this value.</p>
                        </div>
                     </details>
                  </div>
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations">/component-definition/capabilities/control-implementations</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>control-implementations</code>.</p>
                  <p class="path">/component-definition/capabilities/control-implementations</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/control-implementations/uuid" class="toc4 head">uuid</h4>Control Implementation Set IdentifierA unique identifier for the set of implemented
                     controls.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/uuid">/component-definition/capabilities/control-implementations/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Control Implementation Set Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/capabilities/control-implementations/uuid</p>
                  </div>
                  <p class="description">A unique identifier for the set of implemented controls.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/control-implementations/source" class="toc4 head">source</h4>Source Resource ReferenceA reference to an OSCAL catalog or profile providing the
                     referenced control or subcontrol definition.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/@source"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/source">/component-definition/capabilities/control-implementations/source</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Source Resource Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>source</code>.</p>
                     <p class="path">/component-definition/capabilities/control-implementations/source</p>
                  </div>
                  <p class="description">A reference to an OSCAL catalog or profile providing the referenced control or subcontrol
                     definition.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/control-implementations/description" class="toc4 head">description</h4>Control Implementation DescriptionA description of how the specified set of controls
                     are implemented for the containing component or capability.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/description"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/description">/component-definition/capabilities/control-implementations/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Control Implementation Description</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/component-definition/capabilities/control-implementations/description</p>
                  </div>
                  <p class="description">A description of how the specified set of controls are implemented for the containing
                     component or capability.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/control-implementations/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/props">/component-definition/capabilities/control-implementations/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/capabilities/control-implementations/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/props/name">/component-definition/capabilities/control-implementations/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/props/uuid">/component-definition/capabilities/control-implementations/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/props/ns">/component-definition/capabilities/control-implementations/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/props/ns</p>
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
                        <h5 id="/component-definition/capabilities/control-implementations/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/props/value">/component-definition/capabilities/control-implementations/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/props/class">/component-definition/capabilities/control-implementations/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/props/class</p>
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
                        <h5 id="/component-definition/capabilities/control-implementations/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/props/remarks">/component-definition/capabilities/control-implementations/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/control-implementations/links" class="toc4 head">links</h4>
                     <p>An array of Link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>links</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/links</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/link"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/links">/component-definition/capabilities/control-implementations/links</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>links</code>.</p>
                     <p class="path">/component-definition/capabilities/control-implementations/links</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/links/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                        can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a back-matter resource in the same document.If a local reference using
                        a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                        which references an identified resource in the document's back-matter or another object
                        that is within the scope of the containing OSCAL document.If an internet resource
                        is used, the href value will be an absolute or relative URI pointing to the location
                        of the referenced resource. A relative URI will be resolved relative to the location
                        of the document containing the link.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/links/href">/component-definition/capabilities/control-implementations/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/links/href</p>
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
                        <h5 id="/component-definition/capabilities/control-implementations/links/rel" class="toc5 head">rel</h5>RelationDescribes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.
                        
                        Reference
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/links/rel">/component-definition/capabilities/control-implementations/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/links/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/links/media-type">/component-definition/capabilities/control-implementations/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/links/text" class="toc5 head">text</h5>Link TextA textual label to associate with the link, which may be used for presentation
                        in a tool.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/links/text">/component-definition/capabilities/control-implementations/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/control-implementations/set-parameters" class="toc4 head">set-parameters</h4>
                     <p>An array of Set Parameter Value objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Set Parameter Value</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>set-parameters</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/set-parameters</p>
                        </div>
                        <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/set-parameter"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/set-parameters">/component-definition/capabilities/control-implementations/set-parameters</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>set-parameters</code>.</p>
                     <p class="path">/component-definition/capabilities/control-implementations/set-parameters</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/set-parameters/param-id" class="toc5 head">param-id</h5>Parameter IDA reference to a parameter within a control, who's catalog has been imported
                        into the current implementation context.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/set-parameter/@param-id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/set-parameters/param-id">/component-definition/capabilities/control-implementations/set-parameters/param-id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter ID</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>param-id</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/set-parameters/param-id</p>
                     </div>
                     <p class="description">A reference to a parameter within a control, who's catalog has been imported into
                        the current implementation context.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/set-parameters/values" class="toc5 head">values</h5>
                        <p>An array of Parameter Value strings</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Parameter Value</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/set-parameters/values</p>
                           </div>
                           <p class="description">A parameter value or set of values.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/set-parameter/value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/set-parameters/values">/component-definition/capabilities/control-implementations/set-parameters/values</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An array  with key <code>values</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/set-parameters/values</p>
                     </div>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/set-parameters/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/set-parameter/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/set-parameters/remarks">/component-definition/capabilities/control-implementations/set-parameters/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/set-parameters/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/capabilities/control-implementations/implemented-requirements" class="toc4 head">implemented-requirements</h4>
                     <p>An array of Control Implementation objects</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Control Implementation</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>implemented-requirements</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements</p>
                        </div>
                        <p class="description">Describes how the containing component or capability implements an individual control.</p>
                     </div>
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements">/component-definition/capabilities/control-implementations/implemented-requirements</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An array  with key <code>implemented-requirements</code>.</p>
                     <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/uuid" class="toc5 head">uuid</h5>Control Implementation IdentifierA unique identifier for a specific control implementation.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/uuid">/component-definition/capabilities/control-implementations/implemented-requirements/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Control Implementation Identifier</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/uuid</p>
                     </div>
                     <p class="description">A unique identifier for a specific control implementation.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/control-id" class="toc5 head">control-id</h5>Control Identifier ReferenceA reference to a control with a corresponding id value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/@control-id"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/control-id">/component-definition/capabilities/control-implementations/implemented-requirements/control-id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Control Identifier Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>control-id</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/control-id</p>
                     </div>
                     <p class="description">A reference to a control with a corresponding <code>id</code> value.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/description" class="toc5 head">description</h5>Control Implementation DescriptionA description of how the specified control is implemented
                        for the containing component or capability.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/description"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/description">/component-definition/capabilities/control-implementations/implemented-requirements/description</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Control Implementation Description</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/description</p>
                     </div>
                     <p class="description">A description of how the specified control is implemented for the containing component
                        or capability.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/props" class="toc5 head">props</h5>
                        <p>An array of Property objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Property</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>props</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/props</p>
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
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/props">/component-definition/capabilities/control-implementations/implemented-requirements/props</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>props</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/props</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/props/name" class="toc6 head">name</h6>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                           or quality of the property's containing object.
                           
                           A label or descriptor that is tied to a sensitivity or classification marking system.
                           An optional class can be used to define the specific marking system used for the associated
                           value.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/props/name">/component-definition/capabilities/control-implementations/implemented-requirements/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/props/uuid" class="toc6 head">uuid</h6>Property Universally Unique IdentifierA unique identifier that can be used to reference
                           this property elsewhere in an OSCAL document. A UUID should be consistently used for
                           a given location across revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/props/uuid">/component-definition/capabilities/control-implementations/implemented-requirements/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/props/ns" class="toc6 head">ns</h6>Property NamespaceA namespace qualifying the property's name. This allows different
                           organizations to associate distinct semantics with the same name.Provides a means
                           to segment the value space for the name, so that different organizations and individuals
                           can assert control over the allowed names and associated values used in a property.
                           This allows the semantics associated with a given name/value pair to be defined on
                           an organization-by-organization basis.An organization MUST use a URI that they have
                           control over. e.g., a domain registered to the organization in a URI, a registered
                           uniform resource names (URN) namespace.When a ns is not provided, its value should
                           be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                           by the associated OSCAL model.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/props/ns">/component-definition/capabilities/control-implementations/implemented-requirements/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/props/ns</p>
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
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/props/value" class="toc6 head">value</h6>Property ValueIndicates the value of the attribute, characteristic, or quality.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/props/value">/component-definition/capabilities/control-implementations/implemented-requirements/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/props/class" class="toc6 head">class</h6>Property ClassA textual label that provides a sub-type or characterization of the
                           property's name. This can be used to further distinguish or discriminate between the
                           semantics of multiple properties of the same object with the same name and ns. A class
                           can be used in validation rules to express extra constraints over named items of a
                           specific class value.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/props/class">/component-definition/capabilities/control-implementations/implemented-requirements/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/props/class</p>
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
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/props/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/props/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/links" class="toc5 head">links</h5>
                        <p>An array of Link objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Link</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>links</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/links</p>
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
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/links">/component-definition/capabilities/control-implementations/implemented-requirements/links</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>links</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/links</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/links/href" class="toc6 head">href</h6>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                           can be an internet resource, or a local reference using a fragment e.g. #fragment
                           that points to a back-matter resource in the same document.If a local reference using
                           a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                           which references an identified resource in the document's back-matter or another object
                           that is within the scope of the containing OSCAL document.If an internet resource
                           is used, the href value will be an absolute or relative URI pointing to the location
                           of the referenced resource. A relative URI will be resolved relative to the location
                           of the document containing the link.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/links/href">/component-definition/capabilities/control-implementations/implemented-requirements/links/href</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/links/href</p>
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
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/links/rel" class="toc6 head">rel</h6>RelationDescribes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.
                           
                           Reference
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/links/rel">/component-definition/capabilities/control-implementations/implemented-requirements/links/rel</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/links/rel</p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/links/media-type" class="toc6 head">media-type</h6>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                           (IANA) Media Types Registry. 
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/links/media-type">/component-definition/capabilities/control-implementations/implemented-requirements/links/media-type</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/links/media-type</p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/links/text" class="toc6 head">text</h6>Link TextA textual label to associate with the link, which may be used for presentation
                           in a tool.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link/text"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/links/text">/component-definition/capabilities/control-implementations/implemented-requirements/links/text</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/links/text</p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters" class="toc5 head">set-parameters</h5>
                        <p>An array of Set Parameter Value objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Set Parameter Value</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>set-parameters</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters</p>
                           </div>
                           <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>set-parameters</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/param-id" class="toc6 head">param-id</h6>Parameter IDA reference to a parameter within a control, who's catalog has been imported
                           into the current implementation context.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/@param-id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/param-id">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/param-id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter ID</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>param-id</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/param-id</p>
                        </div>
                        <p class="description">A reference to a parameter within a control, who's catalog has been imported into
                           the current implementation context.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/values" class="toc6 head">values</h6>
                           <p>An array of Parameter Value strings</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Parameter Value</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/values</p>
                              </div>
                              <p class="description">A parameter value or set of values.</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/values">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/values</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An array  with key <code>values</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/values</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles" class="toc5 head">responsible-roles</h5>
                        <p>An array of Responsible Role objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Responsible Role</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>responsible-roles</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles</p>
                           </div>
                           <p class="description">A reference to one or more roles with responsibility for performing a function relative
                              to the containing object.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>responsible-roles</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/role-id" class="toc6 head">role-id</h6>Responsible Role IDThe role that is responsible for the business function.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/@role-id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/role-id">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/role-id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Responsible Role ID</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>role-id</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/role-id</p>
                        </div>
                        <p class="description">The role that is responsible for the business function.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props" class="toc6 head">props</h6>
                           <p>An array of Property objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Property</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>props</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props</p>
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>props</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/name" class="toc7 head">name</h7>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                              or quality of the property's containing object.
                              
                              A label or descriptor that is tied to a sensitivity or classification marking system.
                              An optional class can be used to define the specific marking system used for the associated
                              value.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/name">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/name</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/name</p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/uuid" class="toc7 head">uuid</h7>Property Universally Unique IdentifierA unique identifier that can be used to reference
                              this property elsewhere in an OSCAL document. A UUID should be consistently used for
                              a given location across revisions of the document.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/uuid">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/uuid</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/uuid</p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/ns" class="toc7 head">ns</h7>Property NamespaceA namespace qualifying the property's name. This allows different
                              organizations to associate distinct semantics with the same name.Provides a means
                              to segment the value space for the name, so that different organizations and individuals
                              can assert control over the allowed names and associated values used in a property.
                              This allows the semantics associated with a given name/value pair to be defined on
                              an organization-by-organization basis.An organization MUST use a URI that they have
                              control over. e.g., a domain registered to the organization in a URI, a registered
                              uniform resource names (URN) namespace.When a ns is not provided, its value should
                              be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                              by the associated OSCAL model.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/ns">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/ns</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/ns</p>
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
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/value" class="toc7 head">value</h7>Property ValueIndicates the value of the attribute, characteristic, or quality.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/value">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/value</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/value</p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/class" class="toc7 head">class</h7>Property ClassA textual label that provides a sub-type or characterization of the
                              property's name. This can be used to further distinguish or discriminate between the
                              semantics of multiple properties of the same object with the same name and ns. A class
                              can be used in validation rules to express extra constraints over named items of a
                              specific class value.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/class">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/class</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/class</p>
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
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links" class="toc6 head">links</h6>
                           <p>An array of Link objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Link</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>links</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links</p>
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>links</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/href" class="toc7 head">href</h7>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                              can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a back-matter resource in the same document.If a local reference using
                              a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                              which references an identified resource in the document's back-matter or another object
                              that is within the scope of the containing OSCAL document.If an internet resource
                              is used, the href value will be an absolute or relative URI pointing to the location
                              of the referenced resource. A relative URI will be resolved relative to the location
                              of the document containing the link.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/href">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/href</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/href</p>
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
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/rel" class="toc7 head">rel</h7>RelationDescribes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.
                              
                              Reference
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/rel">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/rel</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/rel</p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/media-type" class="toc7 head">media-type</h7>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                              (IANA) Media Types Registry. 
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/media-type">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/media-type</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/media-type</p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/text" class="toc7 head">text</h7>Link TextA textual label to associate with the link, which may be used for presentation
                              in a tool.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/text"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/text">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/text</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/text</p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/party-uuids" class="toc6 head">party-uuids</h6>
                           <p>An array of Party Reference strings</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Party Reference</p>
                                 <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                 <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>party-uuids</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/party-uuids</p>
                              </div>
                              <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/party-uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/party-uuids">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/party-uuids</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>party-uuids</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/party-uuids</p>
                        </div>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements" class="toc5 head">statements</h5>
                        <p>An array of Control Statement Implementation objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Control Statement Implementation</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>statements</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements</p>
                           </div>
                           <p class="description">Identifies which statements within a control are addressed.</p>
                        </div>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements">/component-definition/capabilities/control-implementations/implemented-requirements/statements</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>statements</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/statement-id" class="toc6 head">statement-id</h6>Control Statement ReferenceA reference to a control statement by its identifier
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/@statement-id"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/statement-id">/component-definition/capabilities/control-implementations/implemented-requirements/statements/statement-id</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Control Statement Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>statement-id</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/statement-id</p>
                        </div>
                        <p class="description">A reference to a control statement by its identifier</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/uuid" class="toc6 head">uuid</h6>Control Statement Reference Universally Unique IdentifierA globally unique identifier
                           that can be used to reference this control statement entry elsewhere in an OSCAL document.
                           A UUID should be consistently used for a given resource across revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/uuid">/component-definition/capabilities/control-implementations/implemented-requirements/statements/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Control Statement Reference Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/uuid</p>
                        </div>
                        <p class="description">A globally unique identifier that can be used to reference this control statement
                           entry elsewhere in an OSCAL document. A UUID should be consistently used for a given
                           resource across revisions of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/description" class="toc6 head">description</h6>Statement Implementation DescriptionA summary of how the containing control statement
                           is implemented by the component or capability.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/description"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/description">/component-definition/capabilities/control-implementations/implemented-requirements/statements/description</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Statement Implementation Description</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/description</p>
                        </div>
                        <p class="description">A summary of how the containing control statement is implemented by the component
                           or capability.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/props" class="toc6 head">props</h6>
                           <p>An array of Property objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Property</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>props</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props</p>
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>props</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/name" class="toc7 head">name</h7>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                              or quality of the property's containing object.
                              
                              A label or descriptor that is tied to a sensitivity or classification marking system.
                              An optional class can be used to define the specific marking system used for the associated
                              value.
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/name">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/name</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/name</p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/uuid" class="toc7 head">uuid</h7>Property Universally Unique IdentifierA unique identifier that can be used to reference
                              this property elsewhere in an OSCAL document. A UUID should be consistently used for
                              a given location across revisions of the document.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/uuid">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/uuid</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/uuid</p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/ns" class="toc7 head">ns</h7>Property NamespaceA namespace qualifying the property's name. This allows different
                              organizations to associate distinct semantics with the same name.Provides a means
                              to segment the value space for the name, so that different organizations and individuals
                              can assert control over the allowed names and associated values used in a property.
                              This allows the semantics associated with a given name/value pair to be defined on
                              an organization-by-organization basis.An organization MUST use a URI that they have
                              control over. e.g., a domain registered to the organization in a URI, a registered
                              uniform resource names (URN) namespace.When a ns is not provided, its value should
                              be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                              by the associated OSCAL model.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/ns">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/ns</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/ns</p>
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
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/value" class="toc7 head">value</h7>Property ValueIndicates the value of the attribute, characteristic, or quality.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/value">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/value</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/value</p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/class" class="toc7 head">class</h7>Property ClassA textual label that provides a sub-type or characterization of the
                              property's name. This can be used to further distinguish or discriminate between the
                              semantics of multiple properties of the same object with the same name and ns. A class
                              can be used in validation rules to express extra constraints over named items of a
                              specific class value.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/class">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/class</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/class</p>
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
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/links" class="toc6 head">links</h6>
                           <p>An array of Link objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Link</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>links</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links</p>
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>links</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/href" class="toc7 head">href</h7>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                              can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a back-matter resource in the same document.If a local reference using
                              a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                              which references an identified resource in the document's back-matter or another object
                              that is within the scope of the containing OSCAL document.If an internet resource
                              is used, the href value will be an absolute or relative URI pointing to the location
                              of the referenced resource. A relative URI will be resolved relative to the location
                              of the document containing the link.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/href">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/href</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/href</p>
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
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/rel" class="toc7 head">rel</h7>RelationDescribes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.
                              
                              Reference
                              
                              
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/rel">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/rel</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/rel</p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/media-type" class="toc7 head">media-type</h7>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                              (IANA) Media Types Registry. 
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/media-type">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/media-type</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/media-type</p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/text" class="toc7 head">text</h7>Link TextA textual label to associate with the link, which may be used for presentation
                              in a tool.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/text"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/text">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/text</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/text</p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles" class="toc6 head">responsible-roles</h6>
                           <p>An array of Responsible Role objects</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">object Responsible Role</p>
                                 <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                 <p>An object  member of array <code>responsible-roles</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles</p>
                              </div>
                              <p class="description">A reference to one or more roles with responsibility for performing a function relative
                                 to the containing object.</p>
                           </div>
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">array </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An array  with key <code>responsible-roles</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles</p>
                        </div>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/role-id" class="toc7 head">role-id</h7>Responsible Role IDThe role that is responsible for the business function.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/@role-id"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/role-id">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/role-id</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Responsible Role ID</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>role-id</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/role-id</p>
                           </div>
                           <p class="description">The role that is responsible for the business function.</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props" class="toc7 head">props</h7>
                              <p>An array of Property objects</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">object Property</p>
                                    <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                    <p>An object  member of array <code>props</code>.</p>
                                    <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props</p>
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
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>props</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props</p>
                           </div>
                        </div>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/name" class="toc8 head">name</h8>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                                 or quality of the property's containing object.
                                 
                                 A label or descriptor that is tied to a sensitivity or classification marking system.
                                 An optional class can be used to define the specific marking system used for the associated
                                 value.
                                 
                                 
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/name">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/name</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Name</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/name</p>
                              </div>
                              <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                                 quality of the property's containing object.</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid" class="toc8 head">uuid</h8>Property Universally Unique IdentifierA unique identifier that can be used to reference
                                 this property elsewhere in an OSCAL document. A UUID should be consistently used for
                                 a given location across revisions of the document.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Universally Unique Identifier</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid</p>
                              </div>
                              <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                                 document. A UUID should be consistently used for a given location across revisions
                                 of the document.</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/ns" class="toc8 head">ns</h8>Property NamespaceA namespace qualifying the property's name. This allows different
                                 organizations to associate distinct semantics with the same name.Provides a means
                                 to segment the value space for the name, so that different organizations and individuals
                                 can assert control over the allowed names and associated values used in a property.
                                 This allows the semantics associated with a given name/value pair to be defined on
                                 an organization-by-organization basis.An organization MUST use a URI that they have
                                 control over. e.g., a domain registered to the organization in a URI, a registered
                                 uniform resource names (URN) namespace.When a ns is not provided, its value should
                                 be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                                 by the associated OSCAL model.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/ns">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/ns</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Namespace</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/ns</p>
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
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/value" class="toc8 head">value</h8>Property ValueIndicates the value of the attribute, characteristic, or quality.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/value">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/value</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Value</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/value</p>
                              </div>
                              <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/class" class="toc8 head">class</h8>Property ClassA textual label that provides a sub-type or characterization of the
                                 property's name. This can be used to further distinguish or discriminate between the
                                 semantics of multiple properties of the same object with the same name and ns. A class
                                 can be used in validation rules to express extra constraints over named items of a
                                 specific class value.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/class">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/class</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Property Class</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/class</p>
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
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks" class="toc8 head">remarks</h8>RemarksAdditional commentary on the containing object.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Remarks</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks</p>
                              </div>
                              <p class="description">Additional commentary on the containing object.</p>
                           </div>
                        </section>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links" class="toc7 head">links</h7>
                              <p>An array of Link objects</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">object Link</p>
                                    <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                                    <p>An object  member of array <code>links</code>.</p>
                                    <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links</p>
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
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>links</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links</p>
                           </div>
                        </div>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/href" class="toc8 head">href</h8>Hypertext ReferenceA resolvable URL reference to a resource.The value of the href
                                 can be an internet resource, or a local reference using a fragment e.g. #fragment
                                 that points to a back-matter resource in the same document.If a local reference using
                                 a fragment is used, this will be indicated by a fragment "#" followed by an identifier
                                 which references an identified resource in the document's back-matter or another object
                                 that is within the scope of the containing OSCAL document.If an internet resource
                                 is used, the href value will be an absolute or relative URI pointing to the location
                                 of the referenced resource. A relative URI will be resolved relative to the location
                                 of the document containing the link.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/href">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/href</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Hypertext Reference</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/href</p>
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
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/rel" class="toc8 head">rel</h8>RelationDescribes the type of relationship provided by the link. This can be an indicator
                                 of the link's purpose.
                                 
                                 Reference
                                 
                                 
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/rel">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/rel</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Relation</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/rel</p>
                              </div>
                              <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                                 of the link's purpose.</p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type" class="toc8 head">media-type</h8>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                                 (IANA) Media Types Registry. 
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Media Type</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type</p>
                              </div>
                              <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                                 <a>Media Types Registry</a>. </p>
                           </div>
                        </section>
                        <section class="json-obj">
                           <div class="header">
                              <div>
                                 <h8 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/text" class="toc8 head">text</h8>Link TextA textual label to associate with the link, which may be used for presentation
                                 in a tool.
                                 <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/text"><button class="schema-link">Switch to XML</button></a></div>
                              </div>
                           </div>
                           <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/text">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/text</a> in the object map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">string Link Text</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                                 <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/text</p>
                              </div>
                              <p class="description">A textual label to associate with the link, which may be used for presentation in
                                 a tool.</p>
                           </div>
                        </section>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids" class="toc7 head">party-uuids</h7>
                              <p>An array of Party Reference strings</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <div class="obj-desc">
                                 <div class="obj-matrix">
                                    <p class="obj-name">string Party Reference</p>
                                    <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                                    <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>party-uuids</code>.</p>
                                    <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids</p>
                                 </div>
                                 <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                              </div>
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/party-uuid"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">array </p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An array  with key <code>party-uuids</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids</p>
                           </div>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div>
                              <h7 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/remarks" class="toc7 head">remarks</h7>RemarksAdditional commentary on the containing object.
                              <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           </div>
                        </div>
                        <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/capabilities/control-implementations/implemented-requirements/statements/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/statements/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/statements/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/capabilities/control-implementations/implemented-requirements/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/capabilities/control-implementations/implemented-requirements/remarks">/component-definition/capabilities/control-implementations/implemented-requirements/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/capabilities/control-implementations/implemented-requirements/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div>
                  <h3 id="/component-definition/capabilities/remarks" class="toc3 head">remarks</h3>RemarksAdditional commentary on the containing object.
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/capability/remarks"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/capabilities/remarks">/component-definition/capabilities/remarks</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                  <p class="path">/component-definition/capabilities/remarks</p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
            </div>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div>
               <h2 id="/component-definition/back-matter" class="toc2 head">back-matter</h2>Back matterA collection of resources, which may be included directly or by reference.
               <p>An array of Resource objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Resource</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>resources</code>.</p>
                     <p class="path">/component-definition/back-matter/resources</p>
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
               <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter"><button class="schema-link">Switch to XML</button></a></div>
            </div>
         </div>
         <p>See <a href="../json-outline/#/component-definition/back-matter">/component-definition/back-matter</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Back matter</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An object  with key <code>back-matter</code>.</p>
               <p class="path">/component-definition/back-matter</p>
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
                  <h3 id="/component-definition/back-matter/resources" class="toc3 head">resources</h3>
                  <p>An array of Resource objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Resource</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>resources</code>.</p>
                        <p class="path">/component-definition/back-matter/resources</p>
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
                  <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource"><button class="schema-link">Switch to XML</button></a></div>
               </div>
            </div>
            <p>See <a href="../json-outline/#/component-definition/back-matter/resources">/component-definition/back-matter/resources</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">array </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An array  with key <code>resources</code>.</p>
                  <p class="path">/component-definition/back-matter/resources</p>
               </div>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/uuid" class="toc4 head">uuid</h4>Resource Universally Unique IdentifierA globally unique identifier that can be used
                     to reference this defined resource elsewhere in an OSCAL document. A UUID should be
                     consistently used for a given resource across revisions of the document.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/uuid">/component-definition/back-matter/resources/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/uuid</p>
                  </div>
                  <p class="description">A globally unique identifier that can be used to reference this defined resource elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given resource across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/title" class="toc4 head">title</h4>Resource TitleA name given to the resource, which may be used by a tool for display
                     and navigation.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/title"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/title">/component-definition/back-matter/resources/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/title</p>
                  </div>
                  <p class="description">A name given to the resource, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/description" class="toc4 head">description</h4>Resource DescriptionA short summary of the resource used to indicate the purpose of
                     the resource.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/description"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/description">/component-definition/back-matter/resources/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/description</p>
                  </div>
                  <p class="description">A short summary of the resource used to indicate the purpose of the resource.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/props" class="toc4 head">props</h4>
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/prop"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/props">/component-definition/back-matter/resources/props</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>props</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/props</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/props/name" class="toc5 head">name</h5>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                        or quality of the property's containing object.
                        
                        A label or descriptor that is tied to a sensitivity or classification marking system.
                        An optional class can be used to define the specific marking system used for the associated
                        value.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/props/name">/component-definition/back-matter/resources/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/props/uuid" class="toc5 head">uuid</h5>Property Universally Unique IdentifierA unique identifier that can be used to reference
                        this property elsewhere in an OSCAL document. A UUID should be consistently used for
                        a given location across revisions of the document.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/props/uuid">/component-definition/back-matter/resources/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/props/ns" class="toc5 head">ns</h5>Property NamespaceA namespace qualifying the property's name. This allows different
                        organizations to associate distinct semantics with the same name.Provides a means
                        to segment the value space for the name, so that different organizations and individuals
                        can assert control over the allowed names and associated values used in a property.
                        This allows the semantics associated with a given name/value pair to be defined on
                        an organization-by-organization basis.An organization MUST use a URI that they have
                        control over. e.g., a domain registered to the organization in a URI, a registered
                        uniform resource names (URN) namespace.When a ns is not provided, its value should
                        be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                        by the associated OSCAL model.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/props/ns">/component-definition/back-matter/resources/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/props/ns</p>
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
                        <h5 id="/component-definition/back-matter/resources/props/value" class="toc5 head">value</h5>Property ValueIndicates the value of the attribute, characteristic, or quality.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/props/value">/component-definition/back-matter/resources/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/props/class" class="toc5 head">class</h5>Property ClassA textual label that provides a sub-type or characterization of the
                        property's name. This can be used to further distinguish or discriminate between the
                        semantics of multiple properties of the same object with the same name and ns. A class
                        can be used in validation rules to express extra constraints over named items of a
                        specific class value.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/props/class">/component-definition/back-matter/resources/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/props/class</p>
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
                        <h5 id="/component-definition/back-matter/resources/props/remarks" class="toc5 head">remarks</h5>RemarksAdditional commentary on the containing object.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/props/remarks">/component-definition/back-matter/resources/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/document-ids" class="toc4 head">document-ids</h4>
                     <p>An array of Document Identifier objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Document Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An object of type <a href="link.to.string">string</a> member of array <code>document-ids</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/document-ids</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/document-id"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/document-ids">/component-definition/back-matter/resources/document-ids</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>document-ids</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/document-ids</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/document-ids/scheme" class="toc5 head">scheme</h5>Document Identification SchemeQualifies the kind of document identifier using a URI.
                        If the scheme is not provided the value of the element will be interpreted as a string
                        of characters. 
                        
                        A Digital Object Identifier (DOI); use is preferred, since this allows for retrieval
                        of a full bibliographic record.
                        
                        
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/document-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/document-ids/scheme">/component-definition/back-matter/resources/document-ids/scheme</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Document Identification Scheme</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/document-ids/scheme</p>
                     </div>
                     <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                        the value of the element will be interpreted as a string of characters. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/document-ids/identifier" class="toc5 head">identifier</h5>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/document-id/identifier"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/document-ids/identifier">/component-definition/back-matter/resources/document-ids/identifier</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>identifier</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/document-ids/identifier</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/citation" class="toc4 head">citation</h4>CitationA citation consisting of end note text and optional structured bibliographic
                     data.Citation TextA line of citation text.
                     <p>An array of Property objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Property</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>props</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/citation/props</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation">/component-definition/back-matter/resources/citation</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Citation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object  with key <code>citation</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/citation</p>
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
                        <h5 id="/component-definition/back-matter/resources/citation/text" class="toc5 head">text</h5>Citation TextA line of citation text.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/text"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/text">/component-definition/back-matter/resources/citation/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Citation Text</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/citation/text</p>
                     </div>
                     <p class="description">A line of citation text.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/citation/props" class="toc5 head">props</h5>
                        <p>An array of Property objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Property</p>
                              <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                              <p>An object  member of array <code>props</code>.</p>
                              <p class="path">/component-definition/back-matter/resources/citation/props</p>
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
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/prop"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/props">/component-definition/back-matter/resources/citation/props</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>props</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/citation/props</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/back-matter/resources/citation/props/name" class="toc6 head">name</h6>Property NameA textual label that uniquely identifies a specific attribute, characteristic,
                           or quality of the property's containing object.
                           
                           A label or descriptor that is tied to a sensitivity or classification marking system.
                           An optional class can be used to define the specific marking system used for the associated
                           value.
                           
                           
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/props/name">/component-definition/back-matter/resources/citation/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/citation/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/back-matter/resources/citation/props/uuid" class="toc6 head">uuid</h6>Property Universally Unique IdentifierA unique identifier that can be used to reference
                           this property elsewhere in an OSCAL document. A UUID should be consistently used for
                           a given location across revisions of the document.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/props/uuid">/component-definition/back-matter/resources/citation/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/citation/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/back-matter/resources/citation/props/ns" class="toc6 head">ns</h6>Property NamespaceA namespace qualifying the property's name. This allows different
                           organizations to associate distinct semantics with the same name.Provides a means
                           to segment the value space for the name, so that different organizations and individuals
                           can assert control over the allowed names and associated values used in a property.
                           This allows the semantics associated with a given name/value pair to be defined on
                           an organization-by-organization basis.An organization MUST use a URI that they have
                           control over. e.g., a domain registered to the organization in a URI, a registered
                           uniform resource names (URN) namespace.When a ns is not provided, its value should
                           be assumed to be http://csrc.nist.gov/ns/oscal and the name should be a name defined
                           by the associated OSCAL model.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/props/ns">/component-definition/back-matter/resources/citation/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/citation/props/ns</p>
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
                           <h6 id="/component-definition/back-matter/resources/citation/props/value" class="toc6 head">value</h6>Property ValueIndicates the value of the attribute, characteristic, or quality.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/props/value">/component-definition/back-matter/resources/citation/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/citation/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/back-matter/resources/citation/props/class" class="toc6 head">class</h6>Property ClassA textual label that provides a sub-type or characterization of the
                           property's name. This can be used to further distinguish or discriminate between the
                           semantics of multiple properties of the same object with the same name and ns. A class
                           can be used in validation rules to express extra constraints over named items of a
                           specific class value.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/props/class">/component-definition/back-matter/resources/citation/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/citation/props/class</p>
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
                           <h6 id="/component-definition/back-matter/resources/citation/props/remarks" class="toc6 head">remarks</h6>RemarksAdditional commentary on the containing object.
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/props/remarks">/component-definition/back-matter/resources/citation/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/citation/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/citation/biblio" class="toc5 head">biblio</h5>Bibliographic DefinitionA container for structured bibliographic information. The
                        model of this information is undefined by OSCAL.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/citation/biblio"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/citation/biblio">/component-definition/back-matter/resources/citation/biblio</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Bibliographic Definition</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An object  with key <code>biblio</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/citation/biblio</p>
                     </div>
                     <p class="description">A container for structured bibliographic information. The model of this information
                        is undefined by OSCAL.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/rlinks" class="toc4 head">rlinks</h4>
                     <p>An array of Resource link objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Resource link</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>rlinks</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/rlinks</p>
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
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/rlink"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/rlinks">/component-definition/back-matter/resources/rlinks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">array </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An array  with key <code>rlinks</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/rlinks</p>
                  </div>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/rlinks/href" class="toc5 head">href</h5>Hypertext ReferenceA resolvable URI reference to a resource.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/rlink/@href"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/rlinks/href">/component-definition/back-matter/resources/rlinks/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/rlinks/href</p>
                     </div>
                     <p class="description">A resolvable URI reference to a resource.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/rlinks/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/rlink/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/rlinks/media-type">/component-definition/back-matter/resources/rlinks/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/rlinks/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/rlinks/hashes" class="toc5 head">hashes</h5>
                        <p>An array of Hash objects</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">object Hash</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An object of type <a href="link.to.string">string</a> member of array <code>hashes</code>.</p>
                              <p class="path">/component-definition/back-matter/resources/rlinks/hashes</p>
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
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/rlink/hash"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/rlinks/hashes">/component-definition/back-matter/resources/rlinks/hashes</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">array </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An array  with key <code>hashes</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/rlinks/hashes</p>
                     </div>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div>
                           <h6 id="/component-definition/back-matter/resources/rlinks/hashes/algorithm" class="toc6 head">algorithm</h6>Hash algorithmMethod by which a hash is derived
                           
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
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/rlink/hash/@algorithm"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/back-matter/resources/rlinks/hashes/algorithm">/component-definition/back-matter/resources/rlinks/hashes/algorithm</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hash algorithm</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>algorithm</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/rlinks/hashes/algorithm</p>
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
                           <h6 id="/component-definition/back-matter/resources/rlinks/hashes/value" class="toc6 head">value</h6>
                           <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/rlink/hash/value"><button class="schema-link">Switch to XML</button></a></div>
                        </div>
                     </div>
                     <p>See <a href="../json-outline/#/component-definition/back-matter/resources/rlinks/hashes/value">/component-definition/back-matter/resources/rlinks/hashes/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/component-definition/back-matter/resources/rlinks/hashes/value</p>
                        </div>
                     </div>
                  </section>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/base64" class="toc4 head">base64</h4>Base64The Base64 alphabet in RFC 2045 - aligned with XSD.File NameName of the file
                     before it was encoded as Base64 to be embedded in a resource. This is the name that
                     will be assigned to the file when the file is decoded.Media TypeSpecifies a media
                     type as defined by the Internet Assigned Numbers Authority (IANA) Media Types Registry.
                     
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/base64"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/base64">/component-definition/back-matter/resources/base64</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Base64</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object of type <a href="link.to.base64Binary">base64Binary</a> with key <code>base64</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/base64</p>
                  </div>
                  <p class="description">The Base64 alphabet in RFC 2045 - aligned with XSD.</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/base64/filename" class="toc5 head">filename</h5>File NameName of the file before it was encoded as Base64 to be embedded in a resource.
                        This is the name that will be assigned to the file when the file is decoded.
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/base64/@filename"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/base64/filename">/component-definition/back-matter/resources/base64/filename</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string File Name</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>filename</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/base64/filename</p>
                     </div>
                     <p class="description">Name of the file before it was encoded as Base64 to be embedded in a <code>resource</code>. This is the name that will be assigned to the file when the file is decoded.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/base64/media-type" class="toc5 head">media-type</h5>Media TypeSpecifies a media type as defined by the Internet Assigned Numbers Authority
                        (IANA) Media Types Registry. 
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/base64/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/base64/media-type">/component-definition/back-matter/resources/base64/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/base64/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div>
                        <h5 id="/component-definition/back-matter/resources/base64/value" class="toc5 head">value</h5>
                        <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/base64/value"><button class="schema-link">Switch to XML</button></a></div>
                     </div>
                  </div>
                  <p>See <a href="../json-outline/#/component-definition/back-matter/resources/base64/value">/component-definition/back-matter/resources/base64/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.base64Binary">base64Binary</a> with key <code>value</code>.</p>
                        <p class="path">/component-definition/back-matter/resources/base64/value</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div>
                     <h4 id="/component-definition/back-matter/resources/remarks" class="toc4 head">remarks</h4>RemarksAdditional commentary on the containing object.
                     <div class="crosslink"><a href="../xml-reference/#/component-definition/back-matter/resource/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  </div>
               </div>
               <p>See <a href="../json-outline/#/component-definition/back-matter/resources/remarks">/component-definition/back-matter/resources/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/component-definition/back-matter/resources/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
      </section>
   </section>
</div>