
> * [Document model and tagging specification - OSCAL: The Open Security Controls Assessment
    Language](#)
>   * [OSCAL namespace](#oscal-namespace)
>   * [OSCAL organization](#oscal-organization)
>   * [Interoperability with other data formats](#interoperability-with-other-data-formats)
>   * [Controls and control components](#controls-and-control-components)
>     * [&lt;catalog> Catalog](#catalog-catalog)
>     * [&lt;framework> Framework](#framework-framework)
>     * [&lt;control> Control](#control-control)
>     * [&lt;component> Framework component](#component-framework-component)
>     * [&lt;subcontrol> Control extension](#subcontrol-control-extension)
>     * [&lt;prop> Property](#prop-property)
>     * [&lt;param> Parameter](#param-parameter)
>     * [&lt;part> Part](#part-part)
>     * [&lt;link> Link](#link-link)
>   * [Functional elements](#functional-elements)
>     * [&lt;insert> Parameter insertion](#insert-parameter-insertion)
>     * [&lt;withdrawn> Withdrawn](#withdrawn-withdrawn)
>   * [Declarations elements](#declarations-elements)
>     * [&lt;declarations> Declarations](#declarations-declarations)
>     * [&lt;declare-prop> Property declaration](#declare-prop-property-declaration)
>     * [&lt;declare-p> Paragraph declaration](#declare-p-paragraph-declaration)
>     * [&lt;declare-part> Part declaration](#declare-part-part-declaration)
>     * [&lt;declare-link> Link declaration](#declare-link-link-declaration)
>     * [&lt;singleton> Singleton constraint](#singleton-singleton-constraint)
>     * [&lt;required> Requirement constraint](#required-requirement-constraint)
>     * [&lt;identifier> Identifier constraint](#identifier-identifier-constraint)
>     * [&lt;regex> Regular expression constraint](#regex-regular-expression-constraint)
>     * [&lt;value> Value constraint](#value-value-constraint)
>     * [&lt;autonum> Autonumbered (generated) value](#autonum-autonumbered-(generated)-value)
>     * [&lt;inherit> Inherited value](#inherit-inherited-value)
>     * [&lt;desc> Parameter description](#desc-parameter-description)
>   * [Structural elements](#structural-elements)
>     * [&lt;section> Section](#section-section)
>     * [&lt;group> Group](#group-group)
>     * [&lt;title> Title](#title-title)
>     * [&lt;references> References](#references-references)
>     * [&lt;ref> Reference](#ref-reference)
>     * [&lt;std> Standard](#std-standard)
>     * [&lt;citation> Citation](#citation-citation)
>   * [Prose](#prose)
>     * [&lt;p> Paragraph](#p-paragraph)
>     * [&lt;pre> Preformatted text](#pre-preformatted-text)
>     * [&lt;ol> Ordered List](#ol-ordered-list)
>     * [&lt;ul> Unordered list](#ul-unordered-list)
>     * [&lt;li> List item](#li-list-item)
>     * [&lt;em> Emphasis](#em-emphasis)
>     * [&lt;i> Italics](#i-italics)
>     * [&lt;b> Bold](#b-bold)
>     * [&lt;a> Anchor](#a-anchor)
>     * [&lt;q> Quoted text](#q-quoted-text)
>     * [&lt;code> Code](#code-code)
>     * [&lt;sup> Superscript](#sup-superscript)
>     * [&lt;sub> Subscript](#sub-subscript)
>     * [&lt;span> Span](#span-span)
>   * [Constraints outside the core schema](#constraints-outside-the-core-schema)
>     * [Order of items inside controls](#order-of-items-inside-controls)
>     * [Interdicted @class assignments](#interdicted-@class-assignments)
>     * [No overloading @class](#no-overloading-@class) 

# Document model and tagging specification - OSCAL: The Open Security Controls Assessment Language 

### OSCAL namespace 

Conformant (valid) OSCAL documents will not contain elements not described in this document. While OSCAL may be mixed with other tag sets or extended, neither of these uses is described here: this document provides only basic information about the OSCAL "core". 

The element population of an OSCAL document (set) may be determined by means of XPath `distinct-values(//*/node-name())`, or analogous query. 

For its XML names, OSCAL uses the namespace http://csrc.nist.gov/ns/oscal/1.0. Commonly, this will be assigned to (unprefixed) names in an OSCAL document by default, and in this document, OSCAL elements (and attributes, presumed to be in no-namespace) are referenced without a prefix, `oscal:` or any other. 

By design, OSCAL looks a lot like HTML on the inside. Transformations to HTML, however, should always strip the OSCAL namespace to produce HTML in the appropriate namespace for the target application. (Or the target application could learn to consume OSCAL.) Only some parts of HTML, however, make their way into OSCAL, which is designed to address its own requirements.  

### OSCAL organization 

OSCAL catalogs are built out of controls. Essentially, OSCAL is a lightweight and free-form "documentary" format, which includes semantic "islands" of structured information. These are semantic not only because they are addressable in principle, but more importantly because their organizations and values may be known before processing occurs, at least with respect to certain operations and relations, and even (at the most general level) before operations are designed and deployed. OSCAL offers a yin to the yang of query and processing. 

At the broadest level, "control objects" in OSCAL include controls, subcontrols, parts of controls or subcontrols, and control groups. Each OSCAL application or application domain will determine for itself how these correspond to entities or "controls", formal processes, procedures, and so forth, within that domain. 

This organization is governed by an XML schema, which enforces containment constraints among these elements. In particular, the OSCAL schema declares elements for group, control, subcontrol, and part. According to its rules, either controls or groups may appear within groups (that is, groups may be nested or may contain controls), while subcontrols may only appear within controls. Either controls or subcontrols may be partitioned (may contain parts), and parts may contain their own parts. While this design centers around controls and subcontrols, by means of the use of groups and parts, OSCAL can support organizations of controls and their components with arbitrary granularity, as any of these objects may be used consistently to carry regular sets of properties, with names and value spaces that may be known in advance or discovered dynamically.  

### Interoperability with other data formats 

OSCAL should map easily and straightforwardly to any generic XML or tag-based markup language including HTML, Markdown and its variants, NISO JATS, DITA, etc. Additionally, OSCAL documents may be taken as "warrants for inference" for serialization of linked data objects or other application binding formats including JSON. 

Because OSCAL is designed to carry richer and denser semantics than most markup languages, however, automated conversion into OSCAL from any of these formats (or at any rate, into a process-oriented and optimized OSCAL) is likely to require tuning or customization per instance - that is, each one will be a one-off conversion.  

### Controls and control components 

The foundations of OSCAL are in control objects, such as controls and subcontrols, and their components, including both formal components (described here) and relatively uncontrolled or free-form contents (described elsewhere as [prose](#prose)). 

#### &lt;catalog> Catalog   

Top-level element for a (canonical) control catalog   

#### &lt;framework> Framework   

Top-level element for a set of control-like components, not considered to be a catalog   

Most often, a collection element will be used for a set of components referencing one or more control catalogs or catalog proxies (such as a profile, baseline, overlay or other framework), which do not themselves serve as a catalog. In many important respects, frameworks with their components are analogous structurally to catalogs with their controls - with some important different.   

#### &lt;control> Control   

A structured information object representing a security control   

Controls may be grouped using group, and controls may be partitioned using either (formally) subcontrol or (informally) part.   

#### &lt;component> Framework component   

Within a framework, a structured information object typically referencing one or more security controls   

Components may be grouped using group and be further divided into parts. They may also contain components (recursively), although this may not generally be advisable. 

In a spreadsheet format, components will frequently be analogous to rows; ideally their child elements (properties, links and other structured contents) will map directly to cells. 

In a direct mapping from catalog to framework formats, both control and subcontrol may be regarded as "components" of their "frameworks" (catalogs) in the general sense; however components in use are not likely to be much like the controls they reference.   

#### &lt;subcontrol> Control extension   

An associated or dependent control object; an enhancement to a control   

A nominal subcontrol or "control extension" permits catalogs to offer access to structured control objects within controls. Further levels down can be achieved using part (both controls and subcontrols may be partitioned), which may contain their own parts; however, knowing in advance which "controls" and "subcontrols" are especially significant is helpful.   

#### &lt;prop> Property   

A value with a name, attributed to the containing control, subcontrol, component, part, or group   

The notation used by a property is up to an application; otherwise, properties are distinguished in OSCAL by not permitting inline markup of any kind. They are expected to be simple scalar values or to use machine-readable/parseable notation (not XML), as defined by and for an application. 

The lexical composition of properties may be constrained by declarations including matching to regular expressions or declaring known datatype notations (tbd). 

Because properties are often used as selectors or identifiers for OSCAL operations, their values can be expected frequently to be flattened (markup stripped) and normalized (e.g., with respect to whitespace) in use; however, this is application defined. 

For singletons (that is, the only element among siblings with its `@class`), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf `property` in the declarations model (which also supports other constraints over property values). 

Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls and parts and extensions), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.   

#### &lt;param> Parameter   

A parameter setting, to be propagated to points of insertion   

#### &lt;part> Part   

A partition, "piece" or section of a control, subcontrol, component or part   

Like properties (prop) and parameters (param), parts can be distinguished from other elements within their controls by their assigned `@class`, such that they may be subjected to "declarations logic" using these values as bindings (and thereby getting open-ended extensibility). 

An assigned class may frequently provide for a header in display, such that `part[@class='objectives']` is displayed under a header *Objectives*, etc. Unlike groups, controls, or subcontrols, however, they may not have title element children (they are not "first class objects" in this sense). Thus, in OSCAL if the components of your controls have their own titles, they are something else; to accommodate data like this, consider using a property (e.g., `prop[@class='part-title']` as an escape hatch.   

#### &lt;link> Link   

A line or paragraph with a hypertext link   

Works like an HTML anchor (a) except this is a line-oriented (block) element.    

### Functional elements 

Functional elements appear inside control content to provide "hooks" to OSCAL processors for retrievability, manipulation (including mapping and transformation), and semantic traversal. 

#### &lt;insert> Parameter insertion   

A "call" (reference) to a parameter for dynamic content transclusion   

#### &lt;withdrawn> Withdrawn   

Indicates that a containing control or subcontrol is no longer applicable   

Used to mark a control or subcontrol included in a catalog as a placeholder, to maintain its semantic integrity in obsolescence. Links should be provided to superseding controls or components. 

The functionality provided by this element might better be offered by a property or some other controlled value, at which point it may be removed; it is included to support (some) legacy content.    

### Declarations elements 

By declaring constraints on control components, such as properties (prop), parts (part) and links (link) within controls and subcontrols, applications and operators can validate the composition and consistency of available controls. Over and above the "core validation" of OSCAL element naming (which is enforced by direct application of an XML schema), such validation can help to guarantee processability and interchange of OSCAL data by verifying that not only tags, but also values given in the data, conform to expressed constraints, which can be made specific to a catalog or catalog type. 

In this way, the OSCAL declarations mechanism provides for a kind of "on the fly supertyping" of control objects, by restriction (constraint) of the core OSCAL language. The extent and degree to which declarations are used to impose order on controls is up to the application and its methods. By no means are declarations necessary; but they serve as an aid in modeling and in communicating expectations. 

OSCAL declarations are enforced by a Schematron; the core schema stipulates this model (and tagging used to control it, i.e. a tag interface) but does not enforce any of the constraints so declared. Developers should take note that these constraints are all readily testable in XPath. 

#### &lt;declarations> Declarations   

For extra-schema validation of control components within controls   

The OSCAL validation model supports not only validation against a formal schema (describing elements, attributes, and their permitted contents, described generally and generically), but also against a set of declarations provided specifically for the catalog or catalog type within which they appear. Constraints described in these declarations, and bound via assignments of `@class` (for control components) and `@context` (indicating control, subcontrol, or part wherein the components may appear), enable automated checking for consistency of controls, subcontrols, and their parts, specific to the types or kinds of control items that appear within a particular catalog or control collection.   

#### &lt;declare-prop> Property declaration   

Constraints applicable to a class or classes of prop elements (properties) in context   

The class of properties, in context, to which the constraints apply, is indicated on the `@class` of the declaration (declare-prop). Only elements named prop with matching `@class` are subject to the declared constraints. The context is defined by the class of the element parent of the candidate property, whether it is a control, subcontrol, part or group. So a `declare-prop context="myControl" class="myProp"` will apply to any property (prop element) with class "myProp", appearing in a control, subcontrol, part or group with class "myControl". 

The constraints that will apply to these properties are indicated by the elements contained in the declaration. For example, a property declared as a "required singleton" is required to appear in its context (the validator will produce an error when it is missing), while it may not appear more than once (the validator will produce an error if more than one appear together). 

Because the `@class` attribute is the basis of the OSCAL declarations model, it is recommended that applications restrict the usage of this attribute to single name values, when used on controls or their compo. Although overloading `@class`, as it is frequently overloaded in HTML, is not forbidden in OSCAL and may even work in an OSCAL application, restricting elements to have *at most*, a single class assignment, will help keep things clean and intelligible. 

On declarations including declare-prop and its siblings, however, both `@class` and `@context` may be overloaded (multiple values). A helpful application will detect where there are conflicting declarations, meaning the same class designator is claimed by different elements in a given context.   

#### &lt;declare-p> Paragraph declaration   

Indicates constraints to be enforced on paragraphs in context   

Elements contained in the declaration, as with all declarations, indicate constraints. The p may be required for the control to be complete, and/or the only one with its `@class` (a singleton). The value(s) may be restricted, etc. 

Effectively, the difference between a "property" prop and "classified p" `p[@class]` is that properties may have only simple scalar values, not subject to dynamic processing or injection. So p elements directly inside a control, subcontrol or part may contain insert elements, for example (just as can p elements in running prose), whereas parameters cannot be injected into properties by definition (since they are required to be stable per control object).   

#### &lt;declare-part> Part declaration   

Indicates constraints to be imposed on parts in context   

Parts are subject to singleton and requirement constraints, but not to constraints on values. However, note that parts may also serve as contexts for other control objects, including properties and parts.   

#### &lt;declare-link> Link declaration   

Indicates constraints to be imposed on links in context   

#### &lt;singleton> Singleton constraint   

The declared component may occur only once in its context   

When this element is present in the declaration of an OSCAL control component, the component (prop, param, part) must be the only component of that class given in its (group, control, subcontrol, or part) context. In other words, no other element child of the same parent may have the same `@class` value. 

Note that the singleton constraint does not apply to the value of the property, but only to the fact that it is an "only child", unique among its siblings for having its class assignment.   

#### &lt;required> Requirement constraint   

The declared component is required in its context   

When this element is present in the declaration of an OSCAL control component, the component (prop, param, or part, of the given class) is required to appear, at least once, in its context. 

A property or part that is a required singleton, is expected to appear exactly once and once only in every applicable control, subcontrol or part. 

Whenever a control or control object is required to have any parts (or properties etc.), and any of the required parts are missing, errors may be reported against the declarations model.   

#### &lt;identifier> Identifier constraint   

The declared component has a value unique within the document, among properties (prop) with the same class   

This constraint is generally only used for properties to be used as identifiers for their control object (control, subcontrol, or part). Guaranteeing their uniqueness means that these values can be used to effect one-to-one retrieval or reference to the objects to which they are assigned (even when IDs are unknown or undefined). 

Note that a property marked as an identifier, may or may not be (also declared as) a singleton. In any case the value of *each* property of the given class must be unique. So if a control has several "name" properties, "name" being declared as an identifier, then each of the name properties in that control must be unique: "George" "John" and "Ringo" not "George", "George" and "George".   

#### &lt;regex> Regular expression constraint   

Indicates that the value of a property (prop) or parameter (param) must match the given regular expression   

Matching against a regular expression is conducted on the normalized lexical value of the given parameter or property: that is, with leading and trailing whitespace stripped, interim whitespace (spaces, tabs, and line feeds) normalized to single spaces, and inline markup stripped. 

When more than one regex is given in a declaration, a match on any of them is taken to satisfy the requirement.   

#### &lt;value> Value constraint   

Indicates a permissible value for a parameter or property   

In a declaration, value will commonly be given in groups, indicating a set of enumerated permissible values (i.e., for an element to be valid to a value constraint, it must equal one of the given values). 

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".   

#### &lt;autonum> Autonumbered (generated) value   

Generates a formatted numeric value based on the position of a control object among its siblings, the text contents providing a template for the numbering format (arabic, alphabetic, roman, etc.)   

The text contents of autonum (not the value of any attribute) will be taken by the processor to be a formatting code. The format should follow the spec for XSLT `xsl:number/@format`. For example, if the value is "A.", then numbering will appear in the sequence A., B., C., etc (as punctuated). Recognized formats include upper- and lower-case alphabetic numbering, arabic numbering, and upper- and lower-case roman numbering as described for XSLT.   

#### &lt;inherit> Inherited value   

Indicates that a value or text within a value should be inherited from a property on a containing control object   

inherit is typically used to enforce hierarchical numbering within control objects. When given in a value in a declaration, inherit indicates that the value of a property, or a segment of its value, must be the same as a property (prop) higher in the containment hierarchy of a control object. That is, if a property with `@class='number'` is constrained with `value/inherit`, it must be the same as is assigned on the closest ancestor (part, subcontrol, control, or group) with the given property. 

Usually, inherit is used in conjunction with autonum. Using the two elements in combination, for example, the number (property) assigned to a subcontrol appearing inside a control numbered "A1" may be constrained to be "A1-a", "A1-b", etc., depending on the position of the subcontrol within the control. 

If a value must inherit from a property of a different class from the containing control object, `inherit/@from` can be used to indicate the applicable property (by its class). By default, inherit indicates a property value should match an ancestor's property with the same `@class` (the most usual case).   

#### &lt;desc> Parameter description   

Indicates and explains the purpose and use of a parameter    

### Structural elements 

#### &lt;section> Section   

For partitioning a catalog, collection, or section therein   

Echoes HTML5 section. May contain controls (control) or groups of controls (group).   

#### &lt;group> Group   

Related controls or groups (of controls or groups)   

In addition to controls or groups, groups may be titled and may have their own properties, statements, parameter settings, and references, subject to declaration. In this respect they are like controls, subcontrols or parts, but their properties apply to the entire group and must be acquired in processing via inheritance. 

Unlike sections (section elements), groups may not contain arbitrary prose (paragraphs and lists). They may, however, contain statements (stmt), which may be untyped (no `@class`) and therefore unconstrained by declarations.   

#### &lt;title> Title   

A fallback for display and navigation, exclusive of more specific properties   

#### &lt;references> References   

A group of reference descriptions   

#### &lt;ref> Reference   

A reference, with one or more citations to standards, related documents, or other resources   

#### &lt;std> Standard   

Citation of a formal published standard   

Echoes the NISO JATS (and NISO STS) std element   

#### &lt;citation> Citation   

Citation of a resource   

Echoes the NISO JATS (and NISO STS) `mixed-citation` element. 

For references to standards, std may be preferred.    

### Prose 

Prose may ordinarily appear anywhere in a control, subcontrol, or part, or at a higher level. OSCAL prose elements echo HTML semantics, although they are deliberately and specifically a narrow subset of HTML element types. This is intended to be the bare minimum of stripped down text as is appropriate for control documentation. Graphics, diagrams, and tables are all out of scope for OSCAL (although arbitrary feature sets can always be modeled as nested parts). 

Among prose elements, p elements in particular are of interest in that they may be constrained by declarations like other control components – although this may not often be as useful as imposing constraints over properties and parts. Frequently, a part organization will be used to assign prose to specific known "sections" or "components" of a control (modeled as part or subcontrol). 

#### &lt;p> Paragraph   

Running text: a paragraph or paragraph fragment   

This element echoes HTML p. As in HTML, it is not limited to indicating complete or discrete (compositional or logical) paragraphs, but can be used for any text set off on its own line.   

#### &lt;pre> Preformatted text   

Retains whitespace in display   

Echoes HTML pre.   

#### &lt;ol> Ordered List   

Appears with numbering in ordinal position   

Although this echoes HTML ol, renditional aspects of this element are not offered by OSCAL. How lists are to be numbered is left to implementations; it is likely that specific control catalogs will have their own schemes. 

At present there is no support for "continued lists", as we have not seen any in documents in scope for analysis.   

#### &lt;ul> Unordered list   

A series of items kept in order but without indicators of sequence; likely bulleted   

As in HTML, "unordered" does not indicate that the order of contained list items is not respected, only that they are not displayed with any notation indicating their order: that is, bullets, not numbers. 

Note that when sequences or lists appear, it may be as common in OSCAL to list (and control) them as sequences of properties or paragraphs, perhaps grouped in parts or subcontrols. This is very much a display element, convenient when what we have is really prose, not highly organized or "semantic". 

OSCAL has (as of yet) no "simple" or unadorned list element; it is suggested that an `@class` added to ul should be rendered as such in any application that wants it.   

#### &lt;li> List item   

An item demarcated with a bullet or numerator   

#### &lt;em> Emphasis   

Rhetorical emphasis as typically indicated by a font shift   

In display, this element can be expected to "toggle", i.e. provide for italics when appearing within roman text, but roman when appearing within italic text. 

Particular semantics (indicating types of emphasis for finer resolution in display or retrieval) may be provided via `@class`.   

#### &lt;i> Italics   

Typographical shift to italics   

An implementation may toggle, i.e., display contents using a roman face when the surrounding text is already italic.   

#### &lt;b> Bold   

Typographical shift to bold   

In display, when the surrounding text is already bold, an implementation may indicate "bold" by means of double-bold or some other typographical distinction. 

As of yet, OSCAL does not support underlining directly (no `u` element or designated property 

). Even b and i should be regarded as escape hatches, and marked with classes when possible.   

#### &lt;a> Anchor   

An HTML-style anchor (inline linking element)   

As in HTML, the link target is indicated by `@href`, with a '#' prefix for an internal cross-reference matching an `@id` elsewhere in the document. 

Anchors without `@href` are not invalid to the OSCAL schema (base validation), but may be reported by a Schematron. An application may promote the contents of an a element, when a valid URI, to serve as the link target if `@href` is missing or not a URI. 

As in HTML, a appears inline (in mixed content), while link is a "paragraph-level" link (that appears next to paragraphs or components in a control).   

#### &lt;q> Quoted text   

An inline segment to appear within quotation marks   

For practical purposes, this is a cosmetic element with no special semantics other than to provide quotation marks in display.   

#### &lt;code> Code   

Inline code   

Strictly, this element should identify formal code or code fragments. Like anything else, it may be "enhanced" using its class.   

#### &lt;sup> Superscript   

Superscripted text   

#### &lt;sub> Subscript   

Subscripted text   

#### &lt;span> Span   

Generic inline container   

As in HTML, this is an escape hatch for arbitrary (inline) semantic (or other) tagging. 

The OSCAL declarations model does not presently support validating properties of arbitrary spans. But it might. Please share your requirements.    

### Constraints outside the core schema 

Over and above what can be validated with a grammar (in the schema at the "core" level, but also distinct from OSCAL-flavor-specific validations, is a small set of constraints governing usage of @class assignments and element occurrence. Validations enforcing them can be implemented via Schematron or another process capable of static analysis of the data. 

#### Order of items inside controls  

Within a control, properties, parts, parameters and prose contents may appear in any order   

This is for maximum flexibility in OSCAL. OSCAL leaves it to its applications and implementations to enforce ordering. 

Note that parameters in particular are "floating values" and may appear almost anywhere, in OSCAL that is otherwise unconstrained. It is not an error for a parameter value to be inserted into a document at a point before the parameter itself has been declared; absent other constraints imposed over the XML, parameters may be set even very late in document order, and their values injected "proactively" (before the setting itself appears in the file). This is mitigated by the fact that parameter ID values must be unique, making parameters easily findable from their points of insertion. 

How or whether an implementation may respect the order of properties, parts and components in general, within a control type, may be expected to vary among applications or "flavors" of OSCAL; but order among components is not presently enforced under its declarations model. (Such a functionality could be discussed.)   

#### Interdicted @class assignments  

No control, control component or group can have a class assignment that overlaps with an element name in OSCAL   

Interdicted names: control, group, part, prop,param, or title. Using the title element for nominal titles is better than using a property. The others should be rarely called for (meta-OSCAL aside) and would anyway be confusing. 

This constraint may be relaxed by failing to run the `OSCAL-strict.sch` Schematron.   

#### No overloading @class  

(Not presently enforced) Values of the `class` attribute i.e. `@class` must be single; no space-delimited multiple classes as in HTML   

While the declarations model may still work even with overloaded, multi-value classes, it might also lead to conniption fits. Better perhaps at the outset to warn against this. You shouldn't have to do that anyway. 

So far we have not needed to enforce this – the declarations model, for example, can cope with multiple classes – there may come a day. 

OSCAL users may have insights into whether class overloading (in OSCAL, not elsewhere) is a good thing or a bad thing to be discouraged.    