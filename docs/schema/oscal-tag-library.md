
> * [Document model and tagging specification - OSCAL: The Open Security Controls Assessment
    Language](#)
>   * [OSCAL namespace](#oscal-namespace)
>   * [OSCAL organization](#oscal-organization)
>   * [Interoperability with other data formats](#interoperability-with-other-data-formats)
>   * [Controls and their contents](#controls-and-their-contents)
>     * [&lt;catalog> Catalog](#catalog-catalog)
>     * [&lt;control> Control](#control-control)
>     * [&lt;subcontrol> Control extension](#subcontrol-control-extension)
>     * [&lt;prop> Property](#prop-property)
>     * [&lt;part> Part](#part-part)
>     * [&lt;link> Link](#link-link)
>     * [@rel rel](#rel-rel)
>     * [@id ID / identifier](#id-id-/-identifier)
>     * [@href hypertext reference](#href-hypertext-reference)
>     * [@class Class](#class-class)
>   * [Functional elements](#functional-elements)
>     * [&lt;param> Parameter](#param-parameter)
>     * [&lt;label> Parameter label](#label-parameter-label)
>     * [&lt;desc> Parameter description](#desc-parameter-description)
>     * [&lt;insert> Parameter insertion](#insert-parameter-insertion)
>     * [@param-id Parameter ID](#param-id-parameter-id)
>     * [&lt;withdrawn> Withdrawn](#withdrawn-withdrawn)
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
>   * [Declarations elements](#declarations-elements)
>     * [&lt;declarations> Declarations](#declarations-declarations)
>     * [&lt;declare-prop> Property declaration](#declare-prop-property-declaration)
>     * [&lt;declare-p> Paragraph declaration](#declare-p-paragraph-declaration)
>     * [&lt;declare-part> Part declaration](#declare-part-part-declaration)
>     * [&lt;declare-link> Link declaration](#declare-link-link-declaration)
>     * [@context context](#context-context)
>     * [&lt;singleton> Singleton constraint](#singleton-singleton-constraint)
>     * [&lt;required> Requirement constraint](#required-requirement-constraint)
>     * [&lt;identifier> Identifier constraint](#identifier-identifier-constraint)
>     * [&lt;regex> Regular expression constraint](#regex-regular-expression-constraint)
>     * [&lt;value> Value constraint](#value-value-constraint)
>     * [&lt;calc> Calculated value constraint](#calc-calculated-value-constraint)
>     * [&lt;autonum> Autonumbered (generated) value](#autonum-autonumbered-(generated)-value)
>     * [&lt;inherit> Inherited value](#inherit-inherited-value)
>     * [@from from](#from-from)
>   * [Profiling](#profiling)
>     * [&lt;profile> Profile](#profile-profile)
>     * [&lt;import> Import resource](#import-import-resource)
>     * [&lt;merge> merge](#merge-merge)
>     * [&lt;modify> modify](#modify-modify)
>     * [&lt;include> Include controls](#include-include-controls)
>     * [&lt;exclude> Exclude controls](#exclude-exclude-controls)
>     * [&lt;all> Include all](#all-include-all)
>     * [&lt;call> Call (control or subcontrol)](#call-call-(control-or-subcontrol))
>     * [@control-id control-id](#control-id-control-id)
>     * [@subcontrol-id subcontrol-id](#subcontrol-id-subcontrol-id)
>     * [&lt;match> match](#match-match)
>     * [@pattern pattern](#pattern-pattern)
>     * [@order order](#order-order)
>     * [@with-subcontrols with-subcontrols](#with-subcontrols-with-subcontrols)
>     * [@with-control with-control](#with-control-with-control)
>     * [&lt;set-param> Parameter setting](#set-param-parameter-setting)
>     * [&lt;alter> Alteration](#alter-alteration)
>     * [&lt;remove> Removal](#remove-removal)
>     * [@class-ref class-ref](#class-ref-class-ref)
>     * [@id-ref id-ref](#id-ref-id-ref)
>     * [@item-name item-name](#item-name-item-name)
>     * [&lt;add> Addition](#add-addition)
>     * [&lt;combine> combine](#combine-combine)
>     * [@method method](#method-method)
>     * [&lt;as-is> as-is](#as-is-as-is)
>     * [&lt;custom> custom](#custom-custom)
>   * [Attributes](#attributes)
>     * [@position position](#position-position)
>   * [Experimental elements](#experimental-elements)
>     * [&lt;framework> Framework](#framework-framework)
>     * [&lt;worksheet> Worksheet](#worksheet-worksheet)
>     * [&lt;component> Framework component](#component-framework-component)
>     * [&lt;xdm-datatype> XDM datatype lexical constraint](#xdm-datatype-xdm-datatype-lexical-constraint)
>   * [Constraints outside the core schema](#constraints-outside-the-core-schema)
>     * [Order of items inside controls](#order-of-items-inside-controls)
>     * [Interdicted @class assignments](#interdicted-@class-assignments)
>   * [Developer notes and rationales](#developer-notes-and-rationales)
>     * [Controls, not (only) the documents that describe them](#controls,-not-(only)-the-documents-that-describe-them)
>     * [Validation](#validation)
>     * [Relationship to other document formats](#relationship-to-other-document-formats)

# Document model and tagging specification - OSCAL: The Open Security Controls Assessment Language

### OSCAL namespace

Conformant (valid) OSCAL documents will not contain elements not described in this document. While OSCAL may be mixed with other tag sets or extended, neither of these uses is described here: this document provides only basic information about the OSCAL "core".

The element population of an OSCAL document (set) may be determined by means of XPath `distinct-values(//*/node-name())`, or analogous query.

For its XML names, OSCAL uses the namespace http://csrc.nist.gov/ns/oscal/1.0. Commonly, this will be assigned to (unprefixed) names in an OSCAL document by default, and in this document, OSCAL elements (and attributes, presumed to be in no-namespace) are referenced without a prefix, `oscal:` or any other.

By design, OSCAL looks a lot like HTML on the inside. Transformations to HTML, however, should always strip the OSCAL namespace to produce HTML in the appropriate namespace for the target application. (Or the target application could learn to consume OSCAL.) Only some parts of HTML, however, make their way into OSCAL, which is designed to address its own requirements.

In future, OSCAL features (elements in the XML models) may be split across two or more namespaces.

### OSCAL organization

OSCAL catalogs are built out of controls. Experimental forms of OSCAL have other structures analogous to controls, but by and large they will eventually make reference to controls.

Controls can be thought of as structured information objects aligned with one another, like rows in a spreadsheet, with cells in the row designated for carrying labeled (and sometimes structured) fields or items of information. To accommodate this, OSCAL provides a lightweight and free-form "documentary" format, which includes semantic "islands" of structured (tagged) data. When deployed regularly and systematically (or assumed to be so), these become "semantic" not only because they are addressable in principle, but more importantly because their organizations and values may be known before processing occurs, at least with respect to certain operations and relations, and even (at the most general level) before operations are designed and deployed. When encoded in OSCAL, control catalogs and the documents that make reference to them become "actionable" even at granular levels.

At the broadest level, "control objects" in OSCAL include controls, subcontrols, parts of controls or subcontrols, and control groups. (Also as mentioned, at other layers and in other forms there may be other analogues going by other names.) Each OSCAL application or application domain will determine for itself how these correspond to entities or "controls", formal processes, procedures, and so forth, within that domain.

This organization is governed by an XML schema, which enforces containment constraints among these elements. In particular, the OSCAL schema declares elements for [group](#group-group), [control](#control-control), [subcontrol](#subcontrol-control-extension), and [part](#part-part). OSCAL can support organizations of information with arbitrary granularity, as any of these objects may be used consistently to carry regular sets of properties, with names and value spaces that may be known in advance or discovered dynamically.

### Interoperability with other data formats

OSCAL should map easily and straightforwardly to any generic XML or tag-based markup language including HTML, Markdown and its variants, NISO JATS, DITA, etc. Additionally, OSCAL documents may be taken as "warrants for inference" for serialization of linked data objects or other application binding formats including JSON.

Because OSCAL is designed to carry richer and denser semantics than most markup languages, however, automated conversion into OSCAL from any of these formats (or at any rate, into a process-oriented and optimized OSCAL) is likely to require tuning or customization per instance - that is, each one will be a one-off conversion.

### Controls and their contents

xsd: ../../schema/xml/XSD/catalog_.xsd

The foundations of OSCAL are in control objects, such as controls and subcontrols, and the structured information they represent or contain (loosely "objects", represented as valid XML elements). These contents will include both structured contents (using element types as described here) and (within those) relatively uncontrolled or free-form contents (described elsewhere as [prose](#prose)).

#### catalog Catalog 
> A (canonical) control catalog: a structured set of security controls

##### Content declaration (reduced)

* element [title](#title-title) (mandatory)
* element [declarations](#declarations-declarations) (optional)
* as needed:
  * element [section](#section-section)
  * element [group](#group-group)
  * element [control](#control-control)
* element [references](#references-references) (optional)

#### control Control 
> A structured information object representing a security control

Controls may be grouped using [group](#group-group), and controls may be partitioned using [part](#part-part) or extended using [subcontrol](#subcontrol-control-extension).

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element [title](#title-title) (optional)
* as needed:
  * element [param](#param-parameter)
  * element [link](#link-link)
  * element [prop](#prop-property)
  * element [part](#part-part)
  * element [subcontrol](#subcontrol-control-extension)
* element [references](#references-references) (optional)

#### subcontrol Control extension 
> An associated or dependent control object; an enhancement to a control

A nominal subcontrol or "control extension" permits catalogs to offer access to structured control objects within controls. Further levels down can be achieved using [part](#part-part) (both controls and subcontrols may be partitioned), which may contain their own parts; however, knowing in advance which "controls" and "subcontrols" are especially significant is helpful.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element [title](#title-title) (optional)
* as needed:
  * element [param](#param-parameter)
  * element [link](#link-link)
  * element [prop](#prop-property)
  * element [part](#part-part)
* element [references](#references-references) (optional)

#### prop Property 
> A value with a name, attributed to the containing control, subcontrol, component, part, or group

The notation used by a property is up to an application; otherwise, properties are distinguished in OSCAL by not permitting inline markup of any kind. They are expected to be simple scalar values or to use machine-readable/parseable notation (not XML), as defined by and for an application.

The lexical composition of properties may be constrained by declarations including matching to regular expressions or declaring known datatype notations (tbd).

Because properties are often used as selectors or identifiers for OSCAL operations, their values can be expected frequently to be flattened (markup stripped) and normalized (e.g., with respect to whitespace) in use; however, this is application defined.

For singletons (that is, the only element among siblings with its [@class](#class-class)), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf [declare-prop](#declare-prop-property-declaration) in the declarations model (which also supports other constraints over property values).

Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls and parts and extensions), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.

##### Content declaration (reduced)

* text content *only* (and potentially further constrained)

#### part Part 
> A partition, "piece" or section of a control, subcontrol, component or part

Like properties ([prop](#prop-property)) and parameters ([param](#param-parameter)), parts can be distinguished from other elements within their controls by their assigned [@class](#class-class), such that they may be subjected to "declarations logic" using these values as bindings (and thereby getting open-ended extensibility).

An assigned class may frequently provide for a header in display, such that `part[@class='objectives']` is displayed under a header *Objectives*, etc. Parts may also however have their own titles ([title](#title-title) elements).

Generally speaking, [part](#part-part) elements will be of two kinds. Many parts are logical partitions or sections for prose; these may be called "statements" and may be expected to have simple prose contents, even just one paragraph. Other parts may be more formally constructed out of properties ([prop](#prop-property) elements) and/or their own parts. Such structured objects (sometimes called "features") may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements"). Since the composition of parts can be constrained using OSCAL declarations (of the items or components to be given in a part or in this type of part), their use for encoding "objects" of arbitrary complexity within controls, is effectively open-ended.

##### Content declaration (reduced)

* element [title](#title-title) (optional)
* as needed:
  * element [param](#param-parameter)
  * element [link](#link-link)
  * element [prop](#prop-property)
  * element [part](#part-part)
  * element [p](#p-paragraph)
  * element [ul](#ul-unordered-list)
  * element [ol](#ol-ordered-list)
  * element [pre](#pre-preformatted-text)

#### link Link 
> A line or paragraph with a hypertext link

Works like an HTML anchor ([a](#a-anchor)) except this is a line-oriented (block) element.

##### Content declaration (reduced)

* attribute [@rel](#rel-rel) (optional)
* attribute [@href](#href-hypertext-reference) (optional)
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)

#### rel rel 
> The stipulated relation of a link to its target or vice versa
* Allowed on [link](#link-link), [declare-link](#declare-link-link-declaration)

#### id ID / identifier 
> A value on @id unique within local document scope, i.e. across a given catalog or representation of catalog contents (controls).

No mechanism is proposed to ensure that [@id](#id-id-/-identifier) values do not collide across different catalogs. Use profiling without "merge" to detect such clashes.
* Allowed on [section](#section-section), [group](#group-group), [control](#control-control), [subcontrol](#subcontrol-control-extension), [param](#param-parameter), [ref](#ref-reference), [pre](#pre-preformatted-text), [li](#li-list-item), [insert](#insert-parameter-insertion), [custom](#custom-custom)
* Required on [profile](#profile-profile)

#### href hypertext reference 
> A link to a document or document fragment (actual, nominal or projected)

Note in particular that [@href](#href-hypertext-reference) targets include elements (locations) in representations of documents that exist only by virtue of dynamic application, such as (for example) the results of profile resolution.
* Allowed on [link](#link-link), [std](#std-standard), [citation](#citation-citation), [a](#a-anchor), [declarations](#declarations-declarations), [import](#import-import-resource)

#### class Class 
> Nominal semantic binding(s) for any element (whitespace-separated list of name tokens)

Overloading this attribute with more than one value is permitted, but not recommended.
* Required on [declare-prop](#declare-prop-property-declaration), [declare-part](#declare-part-part-declaration), [declare-p](#declare-p-paragraph-declaration)
* Allowed on [section](#section-section), [group](#group-group), [control](#control-control), [subcontrol](#subcontrol-control-extension), [param](#param-parameter), [prop](#prop-property), [li](#li-list-item), [code](#code-code), [em](#em-emphasis), [i](#i-italics), [b](#b-bold), [sub](#sub-subscript), [sup](#sup-superscript), [span](#span-span), [custom](#custom-custom), [set-param](#set-param-parameter-setting)

### Functional elements

xsd: ../../schema/xml/XSD/catalog_.xsd

Functional elements appear inside control content to provide "hooks" to OSCAL processors for retrievability, manipulation (including mapping and transformation), and semantic traversal.

#### param Parameter 
> A parameter setting, to be propagated to points of insertion

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element [desc](#desc-parameter-description) (mandatory)
* element [label](#label-parameter-label) (optional)
* element [value](#value-value-constraint) (optional)

#### label Parameter label 
> A placeholder for a missing value, in display

Contains text

#### desc Parameter description 
> Indicates and explains the purpose and use of a parameter

##### Content declaration (reduced)

* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)

#### insert Parameter insertion 
> A "call" (reference) to a parameter for dynamic content transclusion

This element is empty

#### param-id Parameter ID 
> Applicable parameter

Identifies the parameter element target ([param](#param-parameter)) that governs content insertion at this location (when on an [insert](#insert-parameter-insertion)), or to which a parameter setting applies (when on a [set-param](#set-param-parameter-setting)).
* Required on [insert](#insert-parameter-insertion), [set-param](#set-param-parameter-setting)

#### withdrawn Withdrawn 
> Indicates that a containing control or subcontrol is no longer applicable

Used to mark a control or subcontrol included in a catalog as a placeholder, to maintain its semantic integrity in obsolescence. Links should be provided to superseding controls or components.

The functionality provided by this element might better be offered by a property or some other controlled value, at which point it may be removed; it is included to support (some) legacy content.

##### Content declaration (reduced)

* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)

### Structural elements

xsd: ../../schema/xml/XSD/catalog_.xsd

#### section Section 
> A partition within a catalog or section (prose text not controls)

Echoes HTML5 [section](#section-section). May contain controls ([control](#control-control)) or groups of controls ([group](#group-group)).

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element [title](#title-title) (mandatory)
* as needed:
  * element [p](#p-paragraph)
  * element [ul](#ul-unordered-list)
  * element [ol](#ol-ordered-list)
  * element [pre](#pre-preformatted-text)
* element [section](#section-section) (zero or more)
* element [references](#references-references) (optional)

#### group Group 
> A set of related controls or groups (of controls or groups)

In addition to controls or groups, groups may be titled and may have their own properties, statements, parameter settings, and references, subject to declaration. In this respect they are like controls, subcontrols or parts, but their properties apply to the entire group and must be acquired in processing via inheritance.

Unlike sections ([section](#section-section) elements), groups may not contain arbitrary prose (paragraphs and lists). They may, however, contain statements (stmt), which may be untyped (no [@class](#class-class)) and therefore unconstrained by declarations.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element [title](#title-title) (optional)
* as needed:
  * element [param](#param-parameter)
  * element [link](#link-link)
  * element [prop](#prop-property)
  * element [part](#part-part)
* a choice:
  * element [group](#group-group) (once)
  * element [control](#control-control) (once)
* element [references](#references-references) (optional)

#### title Title 
> A fallback for display and navigation, exclusive of more specific properties

##### Content declaration (reduced)

* text content, possibly mixed with 
  * element [q](#q-quoted-text) (zero or more)

#### references References 
> A group of reference descriptions

##### Content declaration (reduced)

* element [ref](#ref-reference) (at least one)

#### ref Reference 
> A reference, with one or more citations to standards, related documents, or other resources

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* as needed:
  * element [std](#std-standard)
  * element [citation](#citation-citation)
  * element [p](#p-paragraph)
  * element [ul](#ul-unordered-list)
  * element [ol](#ol-ordered-list)
  * element [pre](#pre-preformatted-text)

#### std Standard 
> Citation of a formal published standard

Echoes the NISO JATS (and NISO STS) [std](#std-standard) element

##### Content declaration (reduced)

* attribute [@href](#href-hypertext-reference) (optional) valid to constraints for type 'anyURI'
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)

#### citation Citation 
> Citation of a resource

Echoes the NISO JATS (and NISO STS) `mixed-citation` element.

For references to standards, [std](#std-standard) may be preferred.

##### Content declaration (reduced)

* attribute [@href](#href-hypertext-reference) (optional) valid to constraints for type 'anyURI'
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)

### Prose

xsd: ../../schema/xml/XSD/catalog_.xsd

Prose may ordinarily appear anywhere except directly inside controls or subcontrols, where they will ordinarily be relegated to the control's partitions or statements ([part](#part-part)s). OSCAL prose elements echo HTML semantics, although they are deliberately and specifically a narrow subset of HTML element types. This is intended to be the bare minimum of stripped down text as is appropriate for control documentation. Graphics, diagrams, and tables are all out of scope for OSCAL (although arbitrary feature sets can always be modeled in OSCAL as nested parts).

Among prose elements, [p](#p-paragraph) elements in particular are of interest in that they may be constrained by declarations like other contents of controls (or components) – although this may not often be as useful as imposing constraints over properties and parts. Frequently, a part organization will be used to assign prose to specific known "sections" or "enhancements" of a control (modeled as [part](#part-part) or [subcontrol](#subcontrol-control-extension)).

#### p Paragraph 
> Running text: a paragraph or paragraph fragment

This element echoes HTML [p](#p-paragraph). As in HTML, it is not limited to indicating complete or discrete (compositional or logical) paragraphs, but can be used for any text set off on its own line.

##### Content declaration (reduced)

* [@class](#class-class) and [@id](#id-id-/-identifier), optionally, as usual
* as needed, mixed with text:
  * element [withdrawn](#withdrawn-withdrawn)
  * element [insert](#insert-parameter-insertion)
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)

#### pre Preformatted text 
> Retains whitespace in display

Echoes HTML [pre](#pre-preformatted-text).

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)

#### ol Ordered List 
> Appears with numbering in ordinal position

Although this echoes HTML [ol](#ol-ordered-list), renditional aspects of this element are not offered by OSCAL. How lists are to be numbered is left to implementations; it is likely that specific control catalogs will have their own schemes.

At present there is no support for "continued lists", as we have not seen any in documents in scope for analysis.

##### Content declaration (reduced)

* element [li](#li-list-item) (at least one)

#### ul Unordered list 
> A series of items kept in order but without indicators of sequence; likely bulleted

As in HTML, "unordered" does not indicate that the order of contained list items is not respected, only that they are not displayed with any notation indicating their order: that is, bullets, not numbers.

Note that when sequences or lists appear, it may be as common in OSCAL to list (and control) them as sequences of properties or paragraphs, perhaps grouped in parts or subcontrols. This is very much a display element, convenient when what we have is really prose, not highly organized or "semantic".

OSCAL has (as of yet) no "simple" or unadorned list element; it is suggested that an [@class](#class-class) added to [ul](#ul-unordered-list) should be rendered as such in any application that wants it.

##### Content declaration (reduced)

* element [li](#li-list-item) (at least one)

#### li List item 
> An item demarcated with a bullet or numerator

OSCAL uses a lightweight HTML-like approach to lists, in which list items are unstructured (mixed content) except for permitting sublists directly, without separation from other text. The expectation is that items in lists will not need further internal ("paragraph") demarcation.

Lists that are really (brief) subsections may be expressed as (nested, unclassed) [part](#part-part) elements. Generally speaking, structured feature sets (in the form of parts with regular property sets), are more likely to be easily addressable than lists.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element [withdrawn](#withdrawn-withdrawn)
  * element [insert](#insert-parameter-insertion)
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)
  * element [ol](#ol-ordered-list)
  * element [ul](#ul-unordered-list)

#### em Emphasis 
> Rhetorical emphasis as typically indicated by a font shift

In display, this element can be expected to "toggle", i.e. provide for italics when appearing within roman text, but roman when appearing within italic text.

Particular semantics (indicating types of emphasis for finer resolution in display or retrieval) may be provided via [@class](#class-class).

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)

#### i Italics 
> Typographical shift to italics

An implementation may toggle, i.e., display contents using a roman face when the surrounding text is already italic.

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)

#### b Bold 
> Typographical shift to bold

In display, when the surrounding text is already bold, an implementation may indicate "bold" by means of double-bold or some other typographical distinction.

As of yet, OSCAL does not support underlining directly (no `u` element or designated property, which makes underlining, like color and strikethrough, a feature exploitable (with less ambiguity) at the application level.

In ordinary use, [b](#b-bold) and [i](#i-italics) should perhaps be deprecated in favor of more "semantic" elements such as [em](#em-emphasis), [code](#code-code) or even `span>` especially with [@class](#class-class) attributes.

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)

#### a Anchor 
> An HTML-style anchor (inline linking element)

As in HTML, the link target is indicated by [@href](#href-hypertext-reference), with a '#' prefix for an internal cross-reference matching an [@id](#id-id-/-identifier) elsewhere in the document.

Anchors without [@href](#href-hypertext-reference) are not invalid to the OSCAL schema (base validation), but may be reported by a Schematron. An application may promote the contents of an [a](#a-anchor) element, when a valid URI, to serve as the link target if [@href](#href-hypertext-reference) is missing or not a URI.

As in HTML, [a](#a-anchor) appears inline (in mixed content), while [link](#link-link) is a "paragraph-level" link (that appears next to paragraphs or components in a control).

##### Content declaration (reduced)

* attribute [@href](#href-hypertext-reference) (optional)
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element *em*, containing: 
    * attribute [@class](#class-class) (optional)
    * text content

#### q Quoted text 
> An inline segment to appear within quotation marks

This element is intended for use producing "smart quotes" around short phrases, not for extended quotations. Ordinarily it has no special semantics other than to provide quotation marks in display.

##### Content declaration (reduced)

* text content, possibly mixed with 
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)

#### code Code 
> Inline code

Strictly, this element should identify formal code or code fragments. Like anything else, it may be "enhanced" using its class.

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)

#### sup Superscript 
> Superscripted text

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content

#### sub Subscript 
> Subscripted text

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content

#### span Span 
> Generic inline container

As in HTML, this is an escape hatch for arbitrary (inline) semantic (or other) tagging.

The OSCAL declarations model does not presently support validating properties of arbitrary spans. But it might. Please share your requirements.

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element [q](#q-quoted-text)
  * element [code](#code-code)
  * element [em](#em-emphasis)
  * element [i](#i-italics)
  * element [b](#b-bold)
  * element [sub](#sub-subscript)
  * element [sup](#sup-superscript)
  * element [span](#span-span)
  * element [a](#a-anchor)

### Declarations elements

xsd: ../../schema/xml/XSD/declarations_.xsd

By declaring constraints on information associated with controls such as their properties ([prop](#prop-property)), parts ([part](#part-part)) and links ([link](#link-link)), applications and operators can validate the composition and consistency of available controls. Over and above the "core validation" of OSCAL element naming (which is enforced by direct application of an XML schema), such validation can help to guarantee processability and interchange of OSCAL data by verifying that not only tags, but also values given in the data, conform to expressed constraints, which can be made specific to a catalog or catalog type.

In this way, the OSCAL declarations mechanism provides for a kind of "on the fly supertyping" of control objects, by restriction (constraint) of the core OSCAL language. The extent and degree to which declarations are used to impose order on controls is up to the application and its methods. By no means are declarations necessary; but they serve as an aid in modeling and in communicating expectations.

OSCAL declarations are enforced by a Schematron; the core schema stipulates this model (and tagging used to control it, i.e. a tag interface) but does not enforce any of the constraints so declared. Developers should take note that these constraints are all readily testable in XPath.

#### declarations Declarations 
> For extra-schema validation of data given within controls or framework components

The OSCAL validation model supports not only validation against a formal schema (describing elements, attributes, and their permitted contents, described generally and generically), but also against a set of declarations provided specifically for the catalog or catalog type within which controls appear. Constraints described in these declarations, and bound via assignments of [@class](#class-class) (for information within controls or components) and [@context](#context-context) (indicating control, subcontrol, component or part wherein the given object may appear), enable automated checking for consistency of controls, subcontrols, components and their parts, specific to the types or kinds of control items that appear within a particular catalog or framework.

##### Content declaration (reduced)

* As many as wanted of:
  * [declare-prop](#declare-prop-property-declaration)
  * [declare-part](#declare-part-part-declaration)
  * [declare-p](#declare-p-paragraph-declaration)
  * [declare-link](#declare-link-link-declaration)

#### declare-prop Property declaration 
> Constraints applicable to a class or classes of [prop](#prop-property) elements (properties) in context

The class of properties, in context, to which the constraints apply, is indicated on the [@class](#class-class) of the declaration ([declare-prop](#declare-prop-property-declaration)). Only elements named [prop](#prop-property) with matching [@class](#class-class) are subject to the declared constraints. The context is defined by the class of the element parent of the candidate property, whether it is a [control](#control-control), [subcontrol](#subcontrol-control-extension), [part](#part-part) or [group](#group-group). So a `declare-prop context="myControl" class="myProp"` will apply to any property ([prop](#prop-property) element) with class "myProp", appearing in a control, subcontrol, part or group with class "myControl".

The constraints that will apply to these properties are indicated by the elements contained in the declaration. For example, a property declared as a "required singleton" is required to appear in its context (the validator will produce an error when it is missing), while it may not appear more than once (the validator will produce an error if more than one appear together).

Because the [@class](#class-class) attribute is the basis of the OSCAL declarations model, it is recommended that applications restrict the usage of this attribute to single name values, when used on controls or their compo. Although overloading [@class](#class-class), as it is frequently overloaded in HTML, is not forbidden in OSCAL and may even work in an OSCAL application, restricting elements to have *at most*, a single class assignment, will help keep things clean and intelligible.

On declarations including [declare-prop](#declare-prop-property-declaration) and its siblings, however, both [@class](#class-class) and [@context](#context-context) may be overloaded (multiple values). A helpful application will detect where there are conflicting declarations, meaning the same class designator is claimed by different elements in a given context.

##### Content declaration (reduced)

* attribute [@class](#class-class) (required)
* attribute [@context](#context-context) (required)
* element [singleton](#singleton-singleton-constraint) (optional)
* element [required](#required-requirement-constraint) (optional)
* element [identifier](#identifier-identifier-constraint) (optional)
* a choice:
  * element [regex](#regex-regular-expression-constraint) (once)
  * element [calc](#calc-calculated-value-constraint) (zero or more)
  * element [value](#value-value-constraint) (zero or more)

#### declare-p Paragraph declaration 
> Indicates constraints to be enforced on paragraphs in context

Elements contained in the declaration, as with all declarations, indicate constraints. The [p](#p-paragraph) may be required for the control to be complete, and/or the only one with its [@class](#class-class) (a singleton). The value(s) may be restricted, etc.

Effectively, the difference between a "property"[prop](#prop-property) and "classified p"`p[@class]` is that properties may have only simple scalar values, not subject to dynamic processing or injection. So [p](#p-paragraph) elements directly inside a [control](#control-control), [subcontrol](#subcontrol-control-extension) or [part](#part-part) may contain [insert](#insert-parameter-insertion) elements, for example (just as can [p](#p-paragraph) elements in running prose), whereas parameters cannot be injected into properties by definition (since they are required to be stable per control object).

##### Content declaration (reduced)

* attribute [@class](#class-class) (required)
* attribute [@context](#context-context) (required)
* element [singleton](#singleton-singleton-constraint) (optional)
* element [required](#required-requirement-constraint) (optional)

#### declare-part Part declaration 
> Indicates constraints to be imposed on parts in context

Parts are subject to singleton and requirement constraints, but not to constraints on values. However, note that parts may also serve as contexts for other control objects, including properties and parts.

##### Content declaration (reduced)

* attribute [@class](#class-class) (required)
* attribute [@context](#context-context) (required)
* element [singleton](#singleton-singleton-constraint) (optional)
* element [required](#required-requirement-constraint) (optional)

#### declare-link Link declaration 
> Indicates constraints to be imposed on links in context

##### Content declaration (reduced)

* attribute [@rel](#rel-rel) (optional)
* attribute [@context](#context-context) (required)
* element [singleton](#singleton-singleton-constraint) (optional)
* element [required](#required-requirement-constraint) (optional)

#### context context 
> Identifies the type (marked class) of [control](#control-control), [subcontrol](#subcontrol-control-extension), [group](#group-group) or [part](#part-part) which a declared control item (such as a [part](#part-part), [prop](#prop-property) or [link](#link-link)) is expected to appear.
* Required on [declare-prop](#declare-prop-property-declaration), [declare-part](#declare-part-part-declaration), [declare-p](#declare-p-paragraph-declaration), [declare-link](#declare-link-link-declaration)

#### singleton Singleton constraint 
> The declared component may occur only once in its context

When this element is present in the declaration of a data object in OSCAL (such as a [prop](#prop-property), [link](#link-link), or [part](#part-part)) must be the only object of that class given in its ([group](#group-group), [control](#control-control), [subcontrol](#subcontrol-control-extension), [component](#component-framework-component) or [part](#part-part)) context. In other words, no other element child of the same parent may have the same [@class](#class-class) value.

Note that the singleton constraint does not apply to the value of the property, but only to the fact that it is an "only child", unique among its siblings for having its class assignment.

This element is empty

#### required Requirement constraint 
> The declared component is required in its context

When this element is present in the declaration of an OSCAL object, the object ([prop](#prop-property), [link](#link-link), or [part](#part-part) element, of the given class) is required to appear, at least once, in its context.

A property or part that is a required singleton, is expected to appear exactly once and once only in every applicable control, subcontrol or part.

Whenever a control or control object is required to have any parts (or properties etc.), and any of the required parts are missing, errors may be reported against the declarations model.

This element is empty

#### identifier Identifier constraint 
> The declared component has a value unique within the document, among properties ([prop](#prop-property)) with the same class

This constraint is generally only used for properties to be used as identifiers for their control object (control, subcontrol, or part). Guaranteeing their uniqueness means that these values can be used to effect one-to-one retrieval or reference to the objects to which they are assigned (even when IDs are unknown or undefined).

Note that a property marked as an identifier, may or may not be (also declared as) a singleton. In any case the value of *each* property of the given class must be unique. So if a control has several "name" properties, "name" being declared as an identifier, then each of the name properties in that control must be unique: "George""John" and "Ringo" not "George", "George" and "George".

This element is empty

#### regex Regular expression constraint 
> Indicates that the value of a property ([prop](#prop-property)) or parameter ([param](#param-parameter)) must match the given regular expression

Matching against a regular expression is conducted on the normalized lexical value of the given parameter or property: that is, with leading and trailing whitespace stripped, interim whitespace (spaces, tabs, and line feeds) normalized to single spaces, and inline markup stripped.

When more than one [regex](#regex-regular-expression-constraint) is given in a declaration, a match on any of them is taken to satisfy the requirement.

Contains text

#### value Value constraint 
> Indicates a permissible value for a parameter or property

In a declaration, [value](#value-value-constraint) will commonly be given in groups, indicating a set of enumerated permissible values (i.e., for an element to be valid to a value constraint, it must equal one of the given values).

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".

Contains text

#### calc Calculated value constraint 
> Indicates a permissible value for a parameter or property, calculated dynamically

Similar to [value](#value-value-constraint) except that its contents are expanded to produce the permitted value, instead of being given as a literal.

##### Content declaration (reduced)

* attribute `@` (optional)
* text content, possibly mixed with 
  * element [inherit](#inherit-inherited-value)
  * element [autonum](#autonum-autonumbered-(generated)-value)

#### autonum Autonumbered (generated) value 
> Generates a formatted numeric value based on the position of a control object among its siblings, the text contents providing a template for the numbering format (arabic, alphabetic, roman, etc.)

The text contents of [autonum](#autonum-autonumbered-(generated)-value) (not the value of any attribute) will be taken by the processor to be a formatting code. The format should follow the spec for XSLT `xsl:number/@format`. For example, if the value is "A.", then numbering will appear in the sequence A., B., C., etc (as punctuated). Recognized formats include upper- and lower-case alphabetic numbering, arabic numbering, and upper- and lower-case roman numbering as described for XSLT.

Contains text

#### inherit Inherited value 
> Indicates that a value or text within a value should be inherited from a property on a containing control object

[inherit](#inherit-inherited-value) is typically used to enforce hierarchical numbering within control objects. When given in a [value](#value-value-constraint) in a declaration, [inherit](#inherit-inherited-value) indicates that the value of a property, or a segment of its value, must be the same as a property ([prop](#prop-property)) higher in the containment hierarchy of a control object. That is, if a property with `@class='number'` is constrained with `value/inherit`, it must be the same as is assigned on the closest ancestor ([part](#part-part), [subcontrol](#subcontrol-control-extension), [control](#control-control), or [group](#group-group)) with the given property.

Usually, [inherit](#inherit-inherited-value) is used in conjunction with [autonum](#autonum-autonumbered-(generated)-value). Using the two elements in combination, for example, the number (property) assigned to a subcontrol appearing inside a control numbered "A1" may be constrained to be "A1-a", "A1-b", etc., depending on the position of the subcontrol within the control.

If a value must inherit from a property of a different class from the containing control object, `inherit/@from` can be used to indicate the applicable property (by its class). By default, [inherit](#inherit-inherited-value) indicates a property value should match an ancestor's property with the same [@class](#class-class) (the most usual case).

This element is empty

#### from from 
> from
* Allowed on [inherit](#inherit-inherited-value)

### Profiling

xsd: ../../schema/xml/XSD/profile_.xsd

By means of its profiling functionality, OSCAL provides ways of specifying and documenting configurations or "overlays" of catalog, as profile documents. Although they may contain fragments of OSCAL catalogs, for the most part, profiles are an entirely distinct means or mechanism for working with OSCAL.

Roughly speaking, a profile document is a specification of a *selection* of controls and subcontrols from a catalog, along with a series of *operations* over those controls and their use.

#### profile Profile 
> In reference to a catalog (or other resource such as profile or framework), a selection and configuration of controls, maintained separately

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([import](#import-import-resource)), merged or (re)structured ([merge](#merge-merge)), and emended ([modify](#modify-modify)). OSCAL profiles may select subsets of control sets, set parameter values for them in application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (required) valid to constraints for type 'ID'
* element [title](#title-title) (mandatory)
* element [import](#import-import-resource) (at least one)
* element [merge](#merge-merge) (optional)
* element [modify](#modify-modify) (optional)

#### import Import resource 
> Designating a catalog, profile or other resource for controls

An [import](#import-import-resource) indicates a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given ("by value"), or a profile with its own control imports. In the latter case, profiles are expected to be resolved recursively.

The contents of the [import](#import-import-resource) element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [include](#include-include-controls) element) or de-selected (using an [exclude](#exclude-exclude-controls) element) from the source catalog or profile.

##### Content declaration (reduced)

* attribute [@href](#href-hypertext-reference) (optional)
* element [include](#include-include-controls) (optional)
* element [exclude](#exclude-exclude-controls) (optional)

#### merge merge 
> Merge controls in resolution

Indicates (by its presence) that controls included in a profile via different and multiple import pathways, are to be merged in resolution. Element contents of the [merge](#merge-merge) can be used to "reorder" or "restructure" controls (that is, indicate their order and/or structure in resolution).

Implicitly, a merge statement is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a merge statement, will not be merged into (will be dropped) in the resulting resolution.

##### Content declaration (reduced)

* element [combine](#combine-combine) (optional)
* a choice:
  * element [as-is](#as-is-as-is) (once)
  * element [custom](#custom-custom) (once)

#### modify modify 
> Set parameters or emend controls in resolution

##### Content declaration (reduced)

* as needed:
  * element [set-param](#set-param-parameter-setting)
  * element [alter](#alter-alteration)

#### include Include controls 
> Which controls and subcontrols to include from the resource (source catalog) being imported

To be schema-valid, this element must contain either (but not both) a single [all](#all-include-all) element, or a sequence of [call](#call-call-(control-or-subcontrol)) elements.

If this element is not given, it is assumed to be present with contents [all](#all-include-all) (qv); i.e., all controls are included by default, unless the [include](#include-include-controls) instruction calls controls specifically.

##### Content declaration (reduced)

* a choice:
  * element [all](#all-include-all) (once)
  * a choice:
    * element [call](#call-call-(control-or-subcontrol)) (once)
    * element [match](#match-match) (once)

#### exclude Exclude controls 
> Which controls and subcontrols to exclude from the resource (source catalog) being imported

Within [exclude](#exclude-exclude-controls), [all](#all-include-all) is not an option since it makes no sense. However, it also makes no sense (think about it) to use `exclude/call` except with `include/all` (it makes no sense to call in by ID only to exclude by ID). The only error condition reported, however, is when the same control is both included (explicitly, by ID) and excluded.

##### Content declaration (reduced)

* a choice:
  * element [match](#match-match) (once)
  * element *call*, containing: 
    * attribute [@control-id](#control-id-control-id) (optional) valid to constraints for type 'NCName'
    * attribute [@subcontrol-id](#subcontrol-id-subcontrol-id) (optional) valid to constraints for type 'NCName'

#### all Include all 
> Include all controls from the imported resource (catalog)

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [include](#include-include-controls) element is given in an [import](#import-import-resource); so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'`

Importing a catalog with all controls included:```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all/>
  </include>
</import>
```


can also be done implicitly (with the same outcome):```
<import href="canonical-catalog-oscal.xml"/>
```


However these are not the same as```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all with-subcontrols="yes"/>
  </include>
</import>
```


(Since `with-subcontrols` is assumed to be "no" unless stated to be "yes".)

This element is empty

#### call Call (control or subcontrol) 
> Call a control or subcontrol by its ID

Inside [include](#include-include-controls), If [@control-id](#control-id-control-id) is used (to indicate the control being referenced), [@subcontrol-id](#subcontrol-id-subcontrol-id) cannot be used, and vice versa. (A single [call](#call-call-(control-or-subcontrol)) element is used for each control.) This constraint is enforced by the schema. Likewise, [@with-subcontrols](#with-subcontrols-with-subcontrols) can be used only along with [@control-id](#control-id-control-id) not with [@subcontrol-id](#subcontrol-id-subcontrol-id).

If [@with-subcontrols](#with-subcontrols-with-subcontrols) is "yes" on the call to a control, no sibling [call](#call-call-(control-or-subcontrol))elements need to be used to call its subcontrols. Accordingly it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.

This element is empty

#### control-id control-id 
> control-id
* Allowed on [call](#call-call-(control-or-subcontrol)), [alter](#alter-alteration)

#### subcontrol-id subcontrol-id 
> subcontrol-id
* Allowed on [call](#call-call-(control-or-subcontrol)), [alter](#alter-alteration)

#### match match 
> Select controls by (regular expression) match on ID

This element is empty

#### pattern pattern 
> A regular expression to be matched against an ID value for purposes of control selection
* Required on [match](#match-match)

#### order order 
> When matching multiple controls, what order to use in emitting them: `source`, `ascending`(alphabetically by ID) or `descending` (alphabetically by ID)
* Allowed on [match](#match-match)

#### with-subcontrols with-subcontrols 
> Say "yes" to include subcontrols with their controls
* Allowed on [all](#all-include-all), [call](#call-call-(control-or-subcontrol)), [match](#match-match)

#### with-control with-control 
> with-control
* Allowed on [call](#call-call-(control-or-subcontrol)), [match](#match-match)

#### set-param Parameter setting 
> Set a parameter's value or rewrite its label or description

[@param-id](#param-id-parameter-id) indicates the parameter (within the scope of the referenced catalog or resource). The [value](#value-value-constraint) element is used to provide a value for insertion of a value for the parameter when the catalog is resolved and rendered. A [desc](#desc-parameter-description) element can be presented (made available) to a calling profile – that is, it is a parameter description helping to set the parameter in higher layers, not this one (when profiles are expected to provide baselines, for example).

##### Content declaration (reduced)

* attribute [@param-id](#param-id-parameter-id) (required) valid to constraints for type 'NMTOKEN'
* attribute [@class](#class-class) (optional)
* element [desc](#desc-parameter-description) (optional)
* element [label](#label-parameter-label) (optional)
* element [value](#value-value-constraint) (optional)
* element [link](#link-link) (zero or more)

#### alter Alteration 
> Specifies changes to be made to an included control or subcontrol when a profile is resolved

Use `@targets` to indicate the classes of elements (typically [part](#part-part) or [prop](#prop-property) elements) to erase or remove from a control, when a catalog is resolved.

It is an error for two [alter](#alter-alteration) elements to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion.

##### Content declaration (reduced)

* attribute [@control-id](#control-id-control-id) (optional) valid to constraints for type 'NCName'
* attribute [@subcontrol-id](#subcontrol-id-subcontrol-id) (optional) valid to constraints for type 'NCName'
* element [remove](#remove-removal) (zero or more)
* element [add](#add-addition) (zero or more)

#### remove Removal 
> Elements to be removed from a control or subcontrol, in resolution

Use [@class-ref](#class-ref-class-ref), [@id-ref](#id-ref-id-ref) or [@item-name](#item-name-item-name) to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control or subcontrol, when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) [alter](#alter-alteration) element.

To change an element, use [remove](#remove-removal) to remove the element, then [add](#add-addition) to add it back again with changes.

This element is empty

#### class-ref class-ref 
> Classes of controls or subcontrols in scope for alteration
* Allowed on [remove](#remove-removal)

#### id-ref id-ref 
> ID values on controls or subcontrols in scope for alteration
* Allowed on [remove](#remove-removal)

#### item-name item-name 
> An element name of control contents in scope for alteration

To select the [title](#title-title) element use the value "title" etc.
* Allowed on [remove](#remove-removal)

#### add Addition 
> Element contents to be added to a control or subcontrols, in resolution

##### Content declaration (reduced)

* attribute [@position](#position-position) (required)
* as needed:
  * element [title](#title-title)
  * element [param](#param-parameter)
  * element [prop](#prop-property)
  * element [part](#part-part)

#### combine combine 
> Whether and how to combine multiple (competing) versions of the same control

This element is empty

#### method method 
> The method to be used when combining controls or subcontrols in resolution. A value of 
* Required on [combine](#combine-combine)

#### as-is as-is 
> Structure the controls in resolution as they are structured in their source catalogs

This element is empty

#### custom custom 
> Frame a structure wherein represented controls will be embedded in resolution

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element [title](#title-title) (optional)
* as needed:
  * element *group*, containing: 
    * element [title](#title-title) (optional)
    * as needed:
      * element [group](#group-group)
      * element [call](#call-call-(control-or-subcontrol))
      * element [match](#match-match)
  * element [call](#call-call-(control-or-subcontrol))
  * element [match](#match-match)

### Attributes

#### position position 
> The position of insertion when adding to control contents (in alteration)
* Required on [add](#add-addition)

### Experimental elements

rnc: ../../schema/xml/RNC/oscal-catalog.rnc

#### framework Framework 
> A collection of components for formal reference into and among control catalogs

This element represents a collection of structured data objects ("components", see [component](#component-framework-component)) that present information in ways organized to facilitate coordinated access (both manual and automated) both with one another and with controls documented in control catalogs. This is a suitable element for representing, not a control catalog, but an overlay or customization that has its own organization, making many-to-many links across catalogs, their profiles, and other canonical reference documents. (A customization that does not reorganize, but only selects from and configures a control, can be a [profile](#profile-profile).)

Despite their very different roles in the system (catalogs for canonical collections of controls, frameworks for most anything else), components inside frameworks and controls inside catalogs have the same kinds of content objects subject to similar kinds of restrictions. With respect to their internals, that is, they are closely aligned, which simplifies processing of information across the boundaries between them.

#### worksheet Worksheet 
> An arbitrary, working collection of components

Functionally this element is an alias of [framework](#framework-framework). But it is expected to be used for much more ad-hoc collections of components than formalized (much less published) frameworks.

#### component Framework component 
> Within a framework, a structured information object typically referencing one or more security controls

Components may be grouped using [group](#group-group) and be further divided into parts. They may also contain components (recursively), although this may not generally be advisable.

In a spreadsheet format, components will frequently be analogous to rows; ideally their child elements (properties, links and other structured contents) will map directly to cells.

In a direct mapping from catalog to framework formats, both [control](#control-control) and [subcontrol](#subcontrol-control-extension) may be regarded as "components" of their "frameworks" (catalogs) in the general sense; however components in use are not likely to be much like the controls they reference.

#### xdm-datatype XDM datatype lexical constraint 
> (TBD) Indicates that the value of a property ([prop](#prop-property)) or parameter ([param](#param-parameter)) must be castable to the given XDM datatype

TBD. Another alternative is to permit arbitrary XPath (cast to Boolean), which would encompass this and more.

XDM datatypes include integers and numeric formats; dates, durations, date-times etc. An even more general functionality would be an xpath-satisfies that would support arbitrary XPath, so `castable as xs:integer` but also `xs:date(.) gt xs:date(../prop[@class='in-date'])` or `number(.) ge 0 and number(.) le 10.00`

### Constraints outside the core schema

Over and above what can be validated with a grammar (in the schema at the "core" level, but also distinct from OSCAL-flavor-specific validations, is a small set of constraints governing usage of @class assignments and element occurrence. Validations enforcing them can be implemented via Schematron or another process capable of static analysis of the data.

#### Order of items inside controls
> The schema does not enforce any particular order among the element contents of controls, except that title elements must appear first. Applications may accordingly re-sequence contents of controls and subcontrols. Since such re-ordering is inimical to prose or any linguistic representation that depends on sequencing, "islands of prose" are expected in OSCAL to appear not directly within controls or subcontrols, but rather within their components. These components themselves should be typed and labeled clearly enough to support arbitrary re-ordering.
> A particular application or "flavor" of OSCAL might impose tighter constraints on the contents of controls or subcontrols, or of designated types (classes) of controls and subcontrols.

This is for maximum flexibility in OSCAL, in particular when it comes to mapping between XML representations and object representations (such as JSON) whose object types (such as maps) do not respect analogous constraints on cardinality (frequency and order) as XML does. OSCAL leaves it to its applications and implementations to enforce ordering.

Note that parameters in particular are "floating values" and may appear almost anywhere, in OSCAL that is otherwise unconstrained. It is not an error for a parameter value to be inserted into a document at a point before the parameter itself has been declared; absent other constraints imposed over the XML, parameters may be set even very late in document order, and their values injected "proactively" (before the setting itself appears in the file). This is mitigated by the fact that parameter ID values must be unique, making parameters easily findable from their points of insertion.

How or whether an implementation may respect the order of properties, parts and components in general, within a control type, may be expected to vary among applications or "flavors" of OSCAL; but order among components is not presently enforced under its declarations model. (Such a functionality could be discussed.)

#### Interdicted @class assignments
> No control, component, object within a control, framework component or group can have a class assignment that overlaps with an element name in OSCAL

Interdicted names: [control](#control-control), [subcontrol](#subcontrol-control-extension), [component](#component-framework-component)[group](#group-group), [part](#part-part), [prop](#prop-property),[param](#param-parameter), or [title](#title-title). Using the [title](#title-title) element for nominal titles is better than using a property.

This constraint may be relaxed by failing to run the `OSCAL-strict.sch` Schematron.

### Developer notes and rationales

* We need XML, because we have peculiar functional requirements in dealing with arbitrary but semi-regular mixed data, specifically "documentary" contents; this is XML’s sweet spot.
* Syntactically, it would be good to use something as close to MicroXML as possible (we want Python programmers to want to write against this).
* Despite this discipline (or because of it) the XML stack is useful because it is available, performant for our purposes, and standards-based.
* We can aim for the widest distributed support via XSD for validation (for ubiquity of tools) but perform modeling work in RNC (flexibility) as long as possible (and perhaps provide/support other validation methodologies?) 
  * Schema maintenance is going to require tools support anyway; we may as well start early: so RNC + docs => [XSD+docs] where all three are available as resources (you are reading the 'docs') to both human and machine consumers.
* Provide for customization by restriction, not extension. Flavors of OSCAL will take the form of particular usages, not of formal schemas. 
  * Ergo, no schema extension mechanism is called for – much less yet another one. If we need schema extension we can show how without a new metalanguage. A sufficiently simple schema should permit this.
* Accordingly the element set should be as minimal as possible for now - minimum to get the job done (we can aim for decoration later).
* This implies that semantic modeling (of "control types" in different catalogs) work predominantly via a microformat mechanism (semantics overlaid on generic element types via a class mechanism) 
  * This was prototyped and found to work (see below)
  * An optional layer (the OSCAL Declarations layer) is implicit so we built one out as a POC.
* Standing something up quickly and changing names as we go gives us a chance to try things on, not just debate principles.

#### Controls, not (only) the documents that describe them

OSCAL is a domain-specific language for the description and specification of collections of security and privacy controls in a control catalog. Inevitably there is a metaphysical grey zone between controls and the language by which they are defined and described. OSCAL attempts to normalize the semantics used to describe controls by providing a single format for which multiple control catalogs (e.g., NIST SP 800-53/53a, ISO/IEC 27001/2, COBIT 5) can be expressed. It does this by presenting a generalized descriptive "slate" or "tablet" upon which the particular patterns of a particular catalog, may be drawn. Not all catalogs in OSCAL will be the same – the design of controls in different catalogs and of different kinds and species, may be different – but because they will all be OSCAL, it will be easier to see their differences, easier to relate them to one another, and easier to do similar things in similar ways.

Not only controls information itself, but a set of structured documents that describes and makes reference to such controls is in scope for OSCAL. Baselines, profiles, overlays and frameworks written in reference to controls catalogs, are all capabilities we aim to offer and support.

#### Validation

In order to enable catalog and profile-specific validation, we have developed an alternative validation model. It is intended to be (third) complementary to the (two) predominant strategies for XML validation, namely validation against a grammar-based schema such as XSD or RNG) and validation per document or instance type (defined loosely) using query-based technologies such as Schematron. This additional validation model, called "OSCAL declarations", provides support for another "document level" validation layer, without having to code a Schematron. A small language (taking the form of a set of OSCAL tags) permits the specification of simple constraints that can be enforced over catalogs, profiles or worksheets. Much of the complexity that OSCAL must support moves away from the base schema, permitting it to be simpler, defining a smaller base tag set.

Yet enriching this tagging to carry more semantics (appropriate to either a catalog type or its application or implementation) is nonetheless straightforward: a matter (as always) of defining and enforcing rules. But instead of requiring schema aggregation, modification or or extension, we now describe an "application usage" of OSCAL elements and class values (much like an HTML/CSS microformat). OSCAL declarations gives a way of exposing (documenting) and enforcing this set of constraints on document structures such that they can be enforced by automated means at runtime (when exceptions to stated rules can be detected). Thus developers and users have the capability to define OSCAL control types without having to write any schema code.

#### Relationship to other document formats

OSCAL captures chunks of transcribed natural/literate/technical language, i.e. "prose", but it also permits the rational arrangement of such chunks of language with more tightly controlled values (control properties and parameters). Applied systematically and at scale, such regular and rational arrangements enable higher-order transparencies that can translate directly into functionalities (relating to data creation, manipulation, management and forensics). In this, OSCAL goes further than documentary-description XML formats such as the National Information Standards Organization (NISO) Journal Article Tag Suite (JATS), the NISO Standard Tag Set (STS), the Darwin Information Typing Architecture (DITA), and other viable alternatives for encoding "control catalogs" in the broad sense. This is not because OSCAL provides a "semantics" for "controls" so much as because a means by which an OSCAL application (or user or developer) may do so. Accordingly, it is expected that OSCAL would be complementary to any of the formats just mentioned.