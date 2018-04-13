

## Controls and their contents

The foundations of OSCAL are in control objects, such as controls and subcontrols, and the structured information they represent or contain (loosely "objects", represented as valid XML elements). These contents will include both structured contents (using element types as described here) and (within those) relatively uncontrolled or free-form contents (described elsewhere as [prose](#prose)).

### `<catalog>` element | Catalog 

A (canonical) control catalog: a structured set of security controls

* element [&lt;title>](#title-element--title) (mandatory)
* element `declarations` (optional)
* as needed:
  * element [&lt;section>](#section-element--section)
  * element [&lt;group>](#group-element--group)
  * element [&lt;control>](#control-element--control)
* element [&lt;references>](#references-element--references) (optional)

### `<control>` element | Control 

A structured information object representing a security control

Controls may be grouped using [&lt;group>](#group-element--group), and controls may be partitioned using [&lt;part>](#part-element--part) or extended using [&lt;subcontrol>](#subcontrol-element--control-extension).

* element [&lt;title>](#title-element--title) (optional)
* as needed:
  * element [&lt;param>](#param-element--parameter)
  * element [&lt;link>](#link-element--link)
  * element [&lt;prop>](#prop-element--property)
  * element [&lt;part>](#part-element--part)
  * element [&lt;subcontrol>](#subcontrol-element--control-extension)
* element [&lt;references>](#references-element--references) (optional)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-attribute--class) (optional)

### `<subcontrol>` element | Control extension 

An associated or dependent control object; an enhancement to a control

A nominal subcontrol or "control extension" permits catalogs to offer access to structured control objects within controls. Further levels down can be achieved using [&lt;part>](#part-element--part) (both controls and subcontrols may be partitioned), which may contain their own parts; however, knowing in advance which "controls" and "subcontrols" are especially significant is helpful.

* element [&lt;title>](#title-element--title) (optional)
* as needed:
  * element [&lt;param>](#param-element--parameter)
  * element [&lt;link>](#link-element--link)
  * element [&lt;prop>](#prop-element--property)
  * element [&lt;part>](#part-element--part)
* element [&lt;references>](#references-element--references) (optional)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-attribute--class) (optional)

### `<prop>` element | Property 

A value with a name, attributed to the containing control, subcontrol, component, part, or group

The notation used by a property is up to an application; otherwise, properties are distinguished in OSCAL by not permitting inline markup of any kind. They are expected to be simple scalar values or to use machine-readable/parseable notation (not XML), as defined by and for an application.

The lexical composition of properties may be constrained by declarations including matching to regular expressions or declaring known datatype notations (tbd).

Because properties are often used as selectors or identifiers for OSCAL operations, their values can be expected frequently to be flattened (markup stripped) and normalized (e.g., with respect to whitespace) in use; however, this is application defined.

For singletons (that is, the only element among siblings with its [@class](#class-attribute--class)), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf `declare-prop` in the declarations model (which also supports other constraints over property values).

Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls and parts and extensions), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.

* text content, possibly mixed with 
  * attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'

### `<part>` element | Part 

A partition, "piece" or section of a control, subcontrol, component or part

Like properties ([&lt;prop>](#prop-element--property)) and parameters ([&lt;param>](#param-element--parameter)), parts can be distinguished from other elements within their controls by their assigned [@class](#class-attribute--class), such that they may be subjected to "declarations logic" using these values as bindings (and thereby getting open-ended extensibility).

An assigned class may frequently provide for a header in display, such that `part[@class='objectives']` is displayed under a header *Objectives*, etc. Parts may also however have their own titles ([&lt;title>](#title-element--title) elements).

Generally speaking, `<part>` elements will be of two kinds. Many parts are logical partitions or sections for prose; these may be called "statements" and may be expected to have simple prose contents, even just one paragraph. Other parts may be more formally constructed out of properties ([&lt;prop>](#prop-element--property) elements) and/or their own parts. Such structured objects (sometimes called "features") may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements"). Since the composition of parts can be constrained using OSCAL declarations (of the items or components to be given in a part or in this type of part), their use for encoding "objects" of arbitrary complexity within controls, is effectively open-ended.

* element [&lt;title>](#title-element--title) (optional)
* as needed:
  * element [&lt;param>](#param-element--parameter)
  * element [&lt;link>](#link-element--link)
  * element [&lt;prop>](#prop-element--property)
  * element `<part>`
  * element [&lt;p>](#p-element--paragraph)
  * element [&lt;ul>](#ul-element--unordered-list)
  * element [&lt;ol>](#ol-element--ordered-list)
  * element [&lt;pre>](#pre-element--preformatted-text)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-attribute--class) (optional)

### `<link>` element | Link 

A line or paragraph with a hypertext link

Works like an HTML anchor ([&lt;a>](#a-element--anchor)) except this is a line-oriented (block) element.

* text content, possibly mixed with 
  * attribute [@rel](#rel-attribute--relation) (optional)
  * attribute [@href](#href-attribute--hypertext-reference) (optional)

### `@rel` attribute | Relation 

The stipulated relation of a link to its target or vice versa
* Allowed on 

### `@id` attribute | ID / identifier 

A value on @id unique within local document scope, i.e. across a given catalog or representation of catalog contents (controls).

No mechanism is proposed to ensure that [@id](#id-attribute--id--identifier) values do not collide across different catalogs. Use profiling without "merge" to detect such clashes.

* Permitted on most elements
* Required on `profile`

### `@href` attribute | hypertext reference 

A link to a document or document fragment (actual, nominal or projected)

Note in particular that [@href](#href-attribute--hypertext-reference) targets include elements (locations) in representations of documents that exist only by virtue of dynamic application, such as (for example) the results of profile resolution.
* Allowed on [&lt;std>](#std-element--standard), [&lt;citation>](#citation-element--citation), [&lt;a>](#a-element--anchor), `declarations`

### `@class` attribute | Class 

Nominal semantic binding(s) for any element (whitespace-separated list of name tokens)

Overloading this attribute with more than one value is permitted, but not recommended.
* Required on `declare-prop`, `declare-part`, `declare-p`
* Allowed on 

## Functional elements

Functional elements appear inside control content to provide "hooks" to OSCAL processors for retrievability, manipulation (including mapping and transformation), and semantic traversal.

### `<param>` element | Parameter 

A parameter setting, to be propagated to points of insertion

* element [&lt;desc>](#desc-element--parameter-description) (mandatory)
* element [&lt;label>](#label-element--parameter-label) (optional)
* element `value` (optional)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-attribute--class) (optional)

### `<label>` element | Parameter label 

A placeholder for a missing value, in display

Contains text

### `<desc>` element | Parameter description 

Indicates and explains the purpose and use of a parameter

* text content

### `<insert>` element | Parameter insertion 

A "call" (reference) to a parameter for dynamic content transclusion

* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@param-id](#param-id-attribute--parameter-id) (required) valid to constraints for type 'IDREF'

### `@param-id` attribute | Parameter ID 

Applicable parameter

Identifies the parameter element target ([&lt;param>](#param-element--parameter)) that governs content insertion at this location (when on an [&lt;insert>](#insert-element--parameter-insertion)), or to which a parameter setting applies (when on a `set-param`).
* Required on [&lt;insert>](#insert-element--parameter-insertion)

### `<withdrawn>` element | Withdrawn 

Indicates that a containing control or subcontrol is no longer applicable

Used to mark a control or subcontrol included in a catalog as a placeholder, to maintain its semantic integrity in obsolescence. Links should be provided to superseding controls or components.

The functionality provided by this element might better be offered by a property or some other controlled value, at which point it may be removed; it is included to support (some) legacy content.

* text content, possibly mixed with 
  * element [&lt;q>](#q-element--quoted-text)
  * element [&lt;code>](#code-element--code)
  * element [&lt;em>](#em-element--emphasis)
  * element [&lt;i>](#i-element--italics)
  * element [&lt;b>](#b-element--bold)
  * element [&lt;sub>](#sub-element--subscript)
  * element [&lt;sup>](#sup-element--superscript)
  * element [&lt;span>](#span-element--span)

## Structural elements

### `<section>` element | Section 

A partition within a catalog or section (prose text not controls)

Echoes HTML5 `<section>`. May contain controls ([&lt;control>](#control-element--control)) or groups of controls ([&lt;group>](#group-element--group)).

* element [&lt;title>](#title-element--title) (mandatory)
* as needed:
  * element [&lt;p>](#p-element--paragraph)
  * element [&lt;ul>](#ul-element--unordered-list)
  * element [&lt;ol>](#ol-element--ordered-list)
  * element [&lt;pre>](#pre-element--preformatted-text)
* element `<section>` (zero or more)
* element [&lt;references>](#references-element--references) (optional)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-attribute--class) (optional)

### `<group>` element | Group 

A set of related controls or groups (of controls or groups)

In addition to controls or groups, groups may be titled and may have their own properties, statements, parameter settings, and references, subject to declaration. In this respect they are like controls, subcontrols or parts, but their properties apply to the entire group and must be acquired in processing via inheritance.

Unlike sections ([&lt;section>](#section-element--section) elements), groups may not contain arbitrary prose (paragraphs and lists). They may, however, contain statements (stmt), which may be untyped (no [@class](#class-attribute--class)) and therefore unconstrained by declarations.

* element [&lt;title>](#title-element--title) (optional)
* as needed:
  * element [&lt;param>](#param-element--parameter)
  * element [&lt;link>](#link-element--link)
  * element [&lt;prop>](#prop-element--property)
  * element [&lt;part>](#part-element--part)
* as needed (at least one):
  * element `<group>`
  * element [&lt;control>](#control-element--control)
* element [&lt;references>](#references-element--references) (optional)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-attribute--class) (optional)

### `<title>` element | Title 

A fallback for display and navigation, exclusive of more specific properties

* text content, possibly mixed with 
  * element [&lt;q>](#q-element--quoted-text) (zero or more)

### `<references>` element | References 

A group of reference descriptions

* element [&lt;ref>](#ref-element--reference) (at least one)

### `<ref>` element | Reference 

A reference, with one or more citations to standards, related documents, or other resources

* as needed:
  * element [&lt;std>](#std-element--standard)
  * element [&lt;citation>](#citation-element--citation)
  * element [&lt;p>](#p-element--paragraph)
  * element [&lt;ul>](#ul-element--unordered-list)
  * element [&lt;ol>](#ol-element--ordered-list)
  * element [&lt;pre>](#pre-element--preformatted-text)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'

### `<std>` element | Standard 

Citation of a formal published standard

Echoes the NISO JATS (and NISO STS) `<std>` element

* text content, possibly mixed with 
  * element [&lt;a>](#a-element--anchor)
  * attribute [@href](#href-attribute--hypertext-reference) (optional) valid to constraints for type 'anyURI'

### `<citation>` element | Citation 

Citation of a resource

Echoes the NISO JATS (and NISO STS) `mixed-citation` element.

For references to standards, [&lt;std>](#std-element--standard) may be preferred.

* text content, possibly mixed with 
  * element [&lt;a>](#a-element--anchor)
  * attribute [@href](#href-attribute--hypertext-reference) (optional) valid to constraints for type 'anyURI'

## Prose

Prose may ordinarily appear anywhere except directly inside controls or subcontrols, where they will ordinarily be relegated to the control's partitions or statements ([&lt;part>](#part-element--part)s). OSCAL prose elements echo HTML semantics, although they are deliberately and specifically a narrow subset of HTML element types. This is intended to be the bare minimum of stripped down text as is appropriate for control documentation. Graphics, diagrams, and tables are all out of scope for OSCAL (although arbitrary feature sets can always be modeled in OSCAL as nested parts).

Among prose elements, [&lt;p>](#p-element--paragraph) elements in particular are of interest in that they may be constrained by declarations like other contents of controls (or components) – although this may not often be as useful as imposing constraints over properties and parts. Frequently, a part organization will be used to assign prose to specific known "sections" or "enhancements" of a control (modeled as [&lt;part>](#part-element--part) or [&lt;subcontrol>](#subcontrol-element--control-extension)).

### `<p>` element | Paragraph 

Running text: a paragraph or paragraph fragment

This element echoes HTML `<p>`. As in HTML, it is not limited to indicating complete or discrete (compositional or logical) paragraphs, but can be used for any text set off on its own line.

* [@class](#class-attribute--class) and [@id](#id-attribute--id--identifier), optionally, as usual
* as needed, mixed with text:
  * element [&lt;a>](#a-element--anchor)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-attribute--class) (optional)

### `<pre>` element | Preformatted text 

Retains whitespace in display

Echoes HTML `<pre>`.

* text content, possibly mixed with 
  * element [&lt;a>](#a-element--anchor)
  * attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'

### `<ol>` element | Ordered List 

Appears with numbering in ordinal position

Although this echoes HTML `<ol>`, renditional aspects of this element are not offered by OSCAL. How lists are to be numbered is left to implementations; it is likely that specific control catalogs will have their own schemes.

At present there is no support for "continued lists", as we have not seen any in documents in scope for analysis.

* element [&lt;li>](#li-element--list-item) (at least one)

### `<ul>` element | Unordered list 

A series of items kept in order but without indicators of sequence; likely bulleted

As in HTML, "unordered" does not indicate that the order of contained list items is not respected, only that they are not displayed with any notation indicating their order: that is, bullets, not numbers.

Note that when sequences or lists appear, it may be as common in OSCAL to list (and control) them as sequences of properties or paragraphs, perhaps grouped in parts or subcontrols. This is very much a display element, convenient when what we have is really prose, not highly organized or "semantic".

OSCAL has (as of yet) no "simple" or unadorned list element; it is suggested that an [@class](#class-attribute--class) added to `<ul>` should be rendered as such in any application that wants it.

* element [&lt;li>](#li-element--list-item) (at least one)

### `<li>` element | List item 

An item demarcated with a bullet or numerator

OSCAL uses a lightweight HTML-like approach to lists, in which list items are unstructured (mixed content) except for permitting sublists directly, without separation from other text. The expectation is that items in lists will not need further internal ("paragraph") demarcation.

Lists that are really (brief) subsections may be expressed as (nested, unclassed) [&lt;part>](#part-element--part) elements. Generally speaking, structured feature sets (in the form of parts with regular property sets), are more likely to be easily addressable than lists.

* text content, possibly mixed with 
  * element [&lt;a>](#a-element--anchor)
  * element [&lt;ol>](#ol-element--ordered-list)
  * element [&lt;ul>](#ul-element--unordered-list)
  * attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
  * attribute [@class](#class-attribute--class) (optional)

### `<em>` element | Emphasis 

Rhetorical emphasis as typically indicated by a font shift

In display, this element can be expected to "toggle", i.e. provide for italics when appearing within roman text, but roman when appearing within italic text.

Particular semantics (indicating types of emphasis for finer resolution in display or retrieval) may be provided via [@class](#class-attribute--class).

* text content, possibly mixed with 
  * element [&lt;a>](#a-element--anchor)
  * attribute [@class](#class-attribute--class) (optional)

### `<i>` element | Italics 

Typographical shift to italics

An implementation may toggle, i.e., display contents using a roman face when the surrounding text is already italic.

* text content, possibly mixed with 
  * element [&lt;a>](#a-element--anchor)
  * attribute [@class](#class-attribute--class) (optional)

### `<b>` element | Bold 

Typographical shift to bold

In display, when the surrounding text is already bold, an implementation may indicate "bold" by means of double-bold or some other typographical distinction.

As of yet, OSCAL does not support underlining directly (no `u` element or designated property, which makes underlining, like color and strikethrough, a feature exploitable (with less ambiguity) at the application level.

In ordinary use, `<b>` and [&lt;i>](#i-element--italics) should perhaps be deprecated in favor of more "semantic" elements such as [&lt;em>](#em-element--emphasis), [&lt;code>](#code-element--code) or even `span>` especially with [@class](#class-attribute--class) attributes.

* text content, possibly mixed with 
  * element [&lt;a>](#a-element--anchor)
  * attribute [@class](#class-attribute--class) (optional)

### `<a>` element | Anchor 

An HTML-style anchor (inline linking element)

As in HTML, the link target is indicated by [@href](#href-attribute--hypertext-reference), with a '#' prefix for an internal cross-reference matching an [@id](#id-attribute--id--identifier) elsewhere in the document.

Anchors without [@href](#href-attribute--hypertext-reference) are not invalid to the OSCAL schema (base validation), but may be reported by a Schematron. An application may promote the contents of an `<a>` element, when a valid URI, to serve as the link target if [@href](#href-attribute--hypertext-reference) is missing or not a URI.

As in HTML, `<a>` appears inline (in mixed content), while [&lt;link>](#link-element--link) is a "paragraph-level" link (that appears next to paragraphs or components in a control).

* text content, possibly mixed with 
  * element [&lt;q>](#q-element--quoted-text)
  * element [&lt;code>](#code-element--code)
  * element *em*, containing: 
    * text content, possibly mixed with 
      * attribute [@class](#class-attribute--class) (optional)
  * attribute [@href](#href-attribute--hypertext-reference) (optional)

### `<q>` element | Quoted text 

An inline segment to appear within quotation marks

This element is intended for use producing "smart quotes" around short phrases, not for extended quotations. Ordinarily it has no special semantics other than to provide quotation marks in display.

* text content, possibly mixed with 
  * element [&lt;code>](#code-element--code)
  * element [&lt;em>](#em-element--emphasis)
  * element [&lt;i>](#i-element--italics)
  * element [&lt;b>](#b-element--bold)
  * element [&lt;sub>](#sub-element--subscript)
  * element [&lt;sup>](#sup-element--superscript)
  * element [&lt;span>](#span-element--span)

### `<code>` element | Code 

Inline code

Strictly, this element should identify formal code or code fragments. Like anything else, it may be "enhanced" using its class.

* text content, possibly mixed with 
  * attribute [@class](#class-attribute--class) (optional)

### `<sup>` element | Superscript 

Superscripted text

* text content, possibly mixed with 
  * attribute [@class](#class-attribute--class) (optional)

### `<sub>` element | Subscript 

Subscripted text

* text content, possibly mixed with 
  * attribute [@class](#class-attribute--class) (optional)

### `<span>` element | Span 

Generic inline container

As in HTML, this is an escape hatch for arbitrary (inline) semantic (or other) tagging.

The OSCAL declarations model does not presently support validating properties of arbitrary spans. But it might. Please share your requirements.

* text content, possibly mixed with 
  * element [&lt;a>](#a-element--anchor)
  * attribute [@class](#class-attribute--class) (optional)