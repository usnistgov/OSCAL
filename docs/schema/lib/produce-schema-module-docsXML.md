

## Controls and their contents

The foundations of OSCAL are in control objects, such as controls and subcontrols, and the structured information they represent or contain (loosely "objects", represented as valid XML elements). These contents will include both structured contents (using element types as described here) and (within those) relatively uncontrolled or free-form contents (described elsewhere as [prose](#prose)).

### `<catalog>` element | Catalog 

A (canonical) control catalog: a structured set of security controls

* element [&lt;title>](#title-element--title) (mandatory)
* element [&lt;declarations>](#declarations-element--declarations) (optional)
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

For singletons (that is, the only element among siblings with its [@class](#class-attribute--class)), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf [&lt;declare-prop>](#declare-prop-element--property-declaration) in the declarations model (which also supports other constraints over property values).

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
* Required on [&lt;profile>](#profile-element--profile)

### `@href` attribute | hypertext reference 

A link to a document or document fragment (actual, nominal or projected)

Note in particular that [@href](#href-attribute--hypertext-reference) targets include elements (locations) in representations of documents that exist only by virtue of dynamic application, such as (for example) the results of profile resolution.
* Allowed on [&lt;std>](#std-element--standard), [&lt;citation>](#citation-element--citation), [&lt;a>](#a-element--anchor), [&lt;declarations>](#declarations-element--declarations)

### `@class` attribute | Class 

Nominal semantic binding(s) for any element (whitespace-separated list of name tokens)

Overloading this attribute with more than one value is permitted, but not recommended.
* Required on [&lt;declare-prop>](#declare-prop-element--property-declaration), [&lt;declare-part>](#declare-part-element--part-declaration), [&lt;declare-p>](#declare-p-element--paragraph-declaration)
* Allowed on 

## Functional elements

Functional elements appear inside control content to provide "hooks" to OSCAL processors for retrievability, manipulation (including mapping and transformation), and semantic traversal.

### `<param>` element | Parameter 

A parameter setting, to be propagated to points of insertion

* element [&lt;desc>](#desc-element--parameter-description) (mandatory)
* element [&lt;label>](#label-element--parameter-label) (optional)
* element [&lt;value>](#value-element--value-constraint) (optional)
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

Identifies the parameter element target ([&lt;param>](#param-element--parameter)) that governs content insertion at this location (when on an [&lt;insert>](#insert-element--parameter-insertion)), or to which a parameter setting applies (when on a [&lt;set-param>](#set-param-element--parameter-setting)).
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

## Declarations elements

By declaring constraints on information associated with controls such as their properties ([&lt;prop>](#prop-element--property)), parts ([&lt;part>](#part-element--part)) and links ([&lt;link>](#link-element--link)), applications and operators can validate the composition and consistency of available controls. Over and above the "core validation" of OSCAL element naming (which is enforced by direct application of an XML schema), such validation can help to guarantee processability and interchange of OSCAL data by verifying that not only tags, but also values given in the data, conform to expressed constraints, which can be made specific to a catalog or catalog type.

In this way, the OSCAL declarations mechanism provides for a kind of "on the fly supertyping" of control objects, by restriction (constraint) of the core OSCAL language. The extent and degree to which declarations are used to impose order on controls is up to the application and its methods. By no means are declarations necessary; but they serve as an aid in modeling and in communicating expectations.

OSCAL declarations are enforced by a Schematron; the core schema stipulates this model (and tagging used to control it, i.e. a tag interface) but does not enforce any of the constraints so declared. Developers should take note that these constraints are all readily testable in XPath.

### `<declarations>` element | Declarations 

For extra-schema validation of data given within controls or framework components

The OSCAL validation model supports not only validation against a formal schema (describing elements, attributes, and their permitted contents, described generally and generically), but also against a set of declarations provided specifically for the catalog or catalog type within which controls appear. Constraints described in these declarations, and bound via assignments of [@class](#class-attribute--class) (for information within controls or components) and [@context](#context-attribute--declaration-context) (indicating control, subcontrol, component or part wherein the given object may appear), enable automated checking for consistency of controls, subcontrols, components and their parts, specific to the types or kinds of control items that appear within a particular catalog or framework.

* complexContent
* extension base:oscal:decls
* attribute [@href](#href-attribute--hypertext-reference) (optional)

### `<declare-prop>` element | Property declaration 

Constraints applicable to a class or classes of [&lt;prop>](#prop-element--property) elements (properties) in context

The class of properties, in context, to which the constraints apply, is indicated on the [@class](#class-attribute--class) of the declaration (`<declare-prop>`). Only elements named [&lt;prop>](#prop-element--property) with matching [@class](#class-attribute--class) are subject to the declared constraints. The context is defined by the class of the element parent of the candidate property, whether it is a [&lt;control>](#control-element--control), [&lt;subcontrol>](#subcontrol-element--control-extension), [&lt;part>](#part-element--part) or [&lt;group>](#group-element--group). So a `declare-prop context="myControl" class="myProp"` will apply to any property ([&lt;prop>](#prop-element--property) element) with class "myProp", appearing in a control, subcontrol, part or group with class "myControl".

The constraints that will apply to these properties are indicated by the elements contained in the declaration. For example, a property declared as a "required singleton" is required to appear in its context (the validator will produce an error when it is missing), while it may not appear more than once (the validator will produce an error if more than one appear together).

Because the [@class](#class-attribute--class) attribute is the basis of the OSCAL declarations model, it is recommended that applications restrict the usage of this attribute to single name values, when used on controls or their compo. Although overloading [@class](#class-attribute--class), as it is frequently overloaded in HTML, is not forbidden in OSCAL and may even work in an OSCAL application, restricting elements to have *at most*, a single class assignment, will help keep things clean and intelligible.

On declarations including `<declare-prop>` and its siblings, however, both [@class](#class-attribute--class) and [@context](#context-attribute--declaration-context) may be overloaded (multiple values). A helpful application will detect where there are conflicting declarations, meaning the same class designator is claimed by different elements in a given context.

* element [&lt;singleton>](#singleton-element--singleton-constraint) (optional)
* element [&lt;required>](#required-element--requirement-constraint) (optional)
* element [&lt;identifier>](#identifier-element--identifier-constraint) (optional)
* as needed (at least one):
  * element [&lt;regex>](#regex-element--regular-expression-constraint)
  * element [&lt;calc>](#calc-element--calculated-value-constraint)
  * element [&lt;value>](#value-element--value-constraint)
* attribute [@class](#class-attribute--class) (required)
* attribute [@context](#context-attribute--declaration-context) (required)

### `<declare-p>` element | Paragraph declaration 

Indicates constraints to be enforced on paragraphs in context

Elements contained in the declaration, as with all declarations, indicate constraints. The [&lt;p>](#p-element--paragraph) may be required for the control to be complete, and/or the only one with its [@class](#class-attribute--class) (a singleton). The value(s) may be restricted, etc.

Effectively, the difference between a "property"[&lt;prop>](#prop-element--property) and "classified p"`p[@class]` is that properties may have only simple scalar values, not subject to dynamic processing or injection. So [&lt;p>](#p-element--paragraph) elements directly inside a [&lt;control>](#control-element--control), [&lt;subcontrol>](#subcontrol-element--control-extension) or [&lt;part>](#part-element--part) may contain [&lt;insert>](#insert-element--parameter-insertion) elements, for example (just as can [&lt;p>](#p-element--paragraph) elements in running prose), whereas parameters cannot be injected into properties by definition (since they are required to be stable per control object).

* element [&lt;singleton>](#singleton-element--singleton-constraint) (optional)
* element [&lt;required>](#required-element--requirement-constraint) (optional)
* attribute [@class](#class-attribute--class) (required)
* attribute [@context](#context-attribute--declaration-context) (required)

### `<declare-part>` element | Part declaration 

Indicates constraints to be imposed on parts in context

Parts are subject to singleton and requirement constraints, but not to constraints on values. However, note that parts may also serve as contexts for other control objects, including properties and parts.

* element [&lt;singleton>](#singleton-element--singleton-constraint) (optional)
* element [&lt;required>](#required-element--requirement-constraint) (optional)
* attribute [@class](#class-attribute--class) (required)
* attribute [@context](#context-attribute--declaration-context) (required)

### `<declare-link>` element | Link declaration 

Indicates constraints to be imposed on links in context

* element [&lt;singleton>](#singleton-element--singleton-constraint) (optional)
* element [&lt;required>](#required-element--requirement-constraint) (optional)
* attribute [@rel](#rel-attribute--relation) (optional)
* attribute [@context](#context-attribute--declaration-context) (required)

### `@context` attribute | Declaration context 

Identifies the type (marked class) of [&lt;control>](#control-element--control), [&lt;subcontrol>](#subcontrol-element--control-extension), [&lt;group>](#group-element--group) or [&lt;part>](#part-element--part) which a declared control item (such as a [&lt;part>](#part-element--part), [&lt;prop>](#prop-element--property) or [&lt;link>](#link-element--link)) is expected to appear.
* Required on 

### `<singleton>` element | Singleton constraint 

The declared component may occur only once in its context

When this element is present in the declaration of a data object in OSCAL (such as a [&lt;prop>](#prop-element--property), [&lt;link>](#link-element--link), or [&lt;part>](#part-element--part)) must be the only object of that class given in its ([&lt;group>](#group-element--group), [&lt;control>](#control-element--control), [&lt;subcontrol>](#subcontrol-element--control-extension), [&lt;component>](#component-element--framework-component) or [&lt;part>](#part-element--part)) context. In other words, no other element child of the same parent may have the same [@class](#class-attribute--class) value.

Note that the singleton constraint does not apply to the value of the property, but only to the fact that it is an "only child", unique among its siblings for having its class assignment.

This element is empty

### `<required>` element | Requirement constraint 

The declared component is required in its context

When this element is present in the declaration of an OSCAL object, the object ([&lt;prop>](#prop-element--property), [&lt;link>](#link-element--link), or [&lt;part>](#part-element--part) element, of the given class) is required to appear, at least once, in its context.

A property or part that is a required singleton, is expected to appear exactly once and once only in every applicable control, subcontrol or part.

Whenever a control or control object is required to have any parts (or properties etc.), and any of the required parts are missing, errors may be reported against the declarations model.

This element is empty

### `<identifier>` element | Identifier constraint 

The declared component has a value unique within the document, among properties ([&lt;prop>](#prop-element--property)) with the same class

This constraint is generally only used for properties to be used as identifiers for their control object (control, subcontrol, or part). Guaranteeing their uniqueness means that these values can be used to effect one-to-one retrieval or reference to the objects to which they are assigned (even when IDs are unknown or undefined).

Note that a property marked as an identifier, may or may not be (also declared as) a singleton. In any case the value of *each* property of the given class must be unique. So if a control has several "name" properties, "name" being declared as an identifier, then each of the name properties in that control must be unique: "George""John" and "Ringo" not "George", "George" and "George".

This element is empty

### `<regex>` element | Regular expression constraint 

Indicates that the value of a property ([&lt;prop>](#prop-element--property)) or parameter ([&lt;param>](#param-element--parameter)) must match the given regular expression

Matching against a regular expression is conducted on the normalized lexical value of the given parameter or property: that is, with leading and trailing whitespace stripped, interim whitespace (spaces, tabs, and line feeds) normalized to single spaces, and inline markup stripped.

When more than one `<regex>` is given in a declaration, a match on any of them is taken to satisfy the requirement.

Contains text

### `<value>` element | Value constraint 

Indicates a permissible value for a parameter or property

In a declaration, `<value>` will commonly be given in groups, indicating a set of enumerated permissible values (i.e., for an element to be valid to a value constraint, it must equal one of the given values).

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".

Contains text

### `<calc>` element | Calculated value constraint 

Indicates a permissible value for a parameter or property, calculated dynamically

Similar to [&lt;value>](#value-element--value-constraint) except that its contents are expanded to produce the permitted value, instead of being given as a literal.

* text content, possibly mixed with 
  * element [&lt;inherit>](#inherit-element--inherited-value)
  * element [&lt;autonum>](#autonum-element--autonumbered-generated-value)
  * attribute `@` (optional)

### `<autonum>` element | Autonumbered (generated) value 

Generates a formatted numeric value based on the position of a control object among its siblings, the text contents providing a template for the numbering format (arabic, alphabetic, roman, etc.)

The text contents of `<autonum>` (not the value of any attribute) will be taken by the processor to be a formatting code. The format should follow the spec for XSLT `xsl:number/@format`. For example, if the value is "A.", then numbering will appear in the sequence A., B., C., etc (as punctuated). Recognized formats include upper- and lower-case alphabetic numbering, arabic numbering, and upper- and lower-case roman numbering as described for XSLT.

Contains text

### `<inherit>` element | Inherited value 

Indicates that a value or text within a value should be inherited from a property on a containing control object

`<inherit>` is typically used to enforce hierarchical numbering within control objects. When given in a [&lt;value>](#value-element--value-constraint) in a declaration, `<inherit>` indicates that the value of a property, or a segment of its value, must be the same as a property ([&lt;prop>](#prop-element--property)) higher in the containment hierarchy of a control object. That is, if a property with `@class='number'` is constrained with `value/inherit`, it must be the same as is assigned on the closest ancestor ([&lt;part>](#part-element--part), [&lt;subcontrol>](#subcontrol-element--control-extension), [&lt;control>](#control-element--control), or [&lt;group>](#group-element--group)) with the given property.

Usually, `<inherit>` is used in conjunction with [&lt;autonum>](#autonum-element--autonumbered-generated-value). Using the two elements in combination, for example, the number (property) assigned to a subcontrol appearing inside a control numbered "A1" may be constrained to be "A1-a", "A1-b", etc., depending on the position of the subcontrol within the control.

If a value must inherit from a property of a different class from the containing control object, `inherit/@from` can be used to indicate the applicable property (by its class). By default, `<inherit>` indicates a property value should match an ancestor's property with the same [@class](#class-attribute--class) (the most usual case).

* attribute [@from](#from-attribute--alternative-property-class-from-which-to-inherit) (optional)

### `@from` attribute | Alternative property (class) from which to inherit 

When used, this element indicates a class for a property value to be considered for inheritance.

If this attribute is ommitted, the target class is considered the same as the calling (inheriting) property. Sometimes, however, a property may wish to inherit a value from a property with a different class assignment (i.e. a differently-named property). In these cases, use this attribute.

An example of this attribute in use appears in the declarations model for a COBIT5 mockup.
* Allowed on [&lt;inherit>](#inherit-element--inherited-value)

## Profiling

By means of its profiling functionality, OSCAL provides ways of specifying and documenting configurations or "overlays" of catalog, as profile documents. Although they may contain fragments of OSCAL catalogs, for the most part, profiles are an entirely distinct means or mechanism for working with OSCAL.

Roughly speaking, a profile document is a specification of a *selection* of controls and subcontrols from a catalog, along with a series of *operations* over those controls and their use.

The profiling model is also documented with examples in profile semantics documentation.

### `<profile>` element | Profile 

In reference to a catalog (or other resource such as profile or framework), a selection and configuration of controls, maintained separately

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([&lt;import>](#import-element--import-resource)), merged or (re)structured ([&lt;merge>](#merge-element--merge-controls)), and emended ([&lt;modify>](#modify-element--modify-controls)). OSCAL profiles may select subsets of control sets, set parameter values for them in application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.

* element [&lt;title>](#title-element--title) (mandatory)
* element [&lt;import>](#import-element--import-resource) (at least one)
* element [&lt;merge>](#merge-element--merge-controls) (optional)
* element [&lt;modify>](#modify-element--modify-controls) (optional)
* attribute [@id](#id-attribute--id--identifier) (required) valid to constraints for type 'ID'

### `<import>` element | Import resource 

Designating a catalog, profile or other resource for controls

An `<import>` indicates a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given ("by value"), or a profile with its own control imports. In the latter case, profiles are expected to be resolved recursively.

The contents of the `<import>` element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [&lt;include>](#include-element--include-controls) element) or de-selected (using an [&lt;exclude>](#exclude-element--exclude-controls) element) from the source catalog or profile.

* element [&lt;include>](#include-element--include-controls) (optional)
* element [&lt;exclude>](#exclude-element--exclude-controls) (optional)
* attribute [@href](#href-attribute--hypertext-reference) (optional)

### `<merge>` element | Merge controls 

Merge controls in resolution

Indicates (by its presence) that controls included in a profile via different and multiple import pathways, are to be merged in resolution. Element contents of the `<merge>` can be used to "reorder" or "restructure" controls (that is, indicate their order and/or structure in resolution).

Implicitly, a merge statement is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a merge statement, will not be merged into (will be dropped) in the resulting resolution.

* element [&lt;combine>](#combine-element--combination-rule) (optional)
* as needed (at least one):
  * element [&lt;as-is>](#as-is-element--structure-as-is-retain-source-structure)
  * element [&lt;custom>](#custom-element--customized-structure-for-controls)

### `<modify>` element | Modify controls 

Set parameters or emend controls in resolution

* as needed:
  * element [&lt;set-param>](#set-param-element--parameter-setting)
  * element [&lt;alter>](#alter-element--alteration)

### `<include>` element | Include controls 

Which controls and subcontrols to include from the resource (source catalog) being imported

To be schema-valid, this element must contain either (but not both) a single [&lt;all>](#all-element--include-all) element, or a sequence of [&lt;call>](#call-element--call-control-or-subcontrol) elements.

If this element is not given, it is assumed to be present with contents [&lt;all>](#all-element--include-all) (qv); i.e., all controls are included by default, unless the `<include>` instruction calls controls specifically.

* as needed (at least one):
  * element [&lt;all>](#all-element--include-all)
  * as needed (at least one):
    * element [&lt;call>](#call-element--call-control-or-subcontrol)
    * element [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)

### `<exclude>` element | Exclude controls 

Which controls and subcontrols to exclude from the resource (source catalog) being imported

Within `<exclude>`, [&lt;all>](#all-element--include-all) is not an option since it makes no sense. However, it also makes no sense (think about it) to use `exclude/call` except with `include/all` (it makes no sense to call in by ID only to exclude by ID). The only error condition reported, however, is when the same control is both included (explicitly, by ID) and excluded.

* as needed (at least one):
  * element [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)
  * element *call*, containing: 
    * attribute [@control-id](#control-id-attribute--control-identifier) (optional) valid to constraints for type 'NCName'
    * attribute [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) (optional) valid to constraints for type 'NCName'

### `<all>` element | Include all 

Include all controls from the imported resource (catalog)

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [&lt;include>](#include-element--include-controls) element is given in an [&lt;import>](#import-element--import-resource); so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'`

Importing a catalog with all controls included:

```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all/>
  </include>
</import>
```



can also be done implicitly (with the same outcome):

```
<import href="canonical-catalog-oscal.xml"/>
```



However these are not the same as

```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all with-subcontrols="yes"/>
  </include>
</import>
```



(Since `with-subcontrols` is assumed to be "no" unless stated to be "yes".)

* attribute [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) (optional)

### `<call>` element | Call (control or subcontrol) 

Call a control or subcontrol by its ID

Inside [&lt;include>](#include-element--include-controls), If [@control-id](#control-id-attribute--control-identifier) is used (to indicate the control being referenced), [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) cannot be used, and vice versa. (A single `<call>` element is used for each control.) This constraint is enforced by the schema. Likewise, [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) can be used only along with [@control-id](#control-id-attribute--control-identifier) not with [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier).

If [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) is "yes" on the call to a control, no sibling `<call>`elements need to be used to call its subcontrols. Accordingly it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.

* attribute [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) (optional)
* attribute [@control-id](#control-id-attribute--control-identifier) (optional) valid to constraints for type 'NCName'
* attribute [@with-control](#with-control-attribute--include-controls-with-subcontrols) (optional)
* attribute [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) (optional) valid to constraints for type 'NCName'

### `@control-id` attribute | Control Identifier 

control-id
* Allowed on [&lt;call>](#call-element--call-control-or-subcontrol), [&lt;alter>](#alter-element--alteration)

### `@subcontrol-id` attribute | Subcontrol Identifier 

subcontrol-id
* Allowed on [&lt;call>](#call-element--call-control-or-subcontrol), [&lt;alter>](#alter-element--alteration)

### `<match>` element | Match controls and subcontrols by identifier 

Select controls by (regular expression) match on ID

* attribute [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) (optional)
* attribute [@with-control](#with-control-attribute--include-controls-with-subcontrols) (optional)
* attribute [@pattern](#pattern-attribute--match-id-with-pattern-regular-expression) (required)
* attribute [@order](#order-attribute--control-reorder) (optional)

### `@pattern` attribute | Match ID with pattern (regular expression) 

A regular expression to be matched against an ID value for purposes of control selection
* Required on [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)

### `@order` attribute | Control (re)order 

When matching multiple controls, what order to use in emitting them: `keep`, `ascending`(alphabetically by ID) or `descending` (alphabetically by ID)
* Allowed on [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)

### `@with-subcontrols` attribute | Include subcontrols with controls 

Say "yes" to include subcontrols with their controls
* Allowed on 

### `@with-control` attribute | Include controls with subcontrols 

with-control
* Allowed on 

### `<set-param>` element | Parameter setting 

Set a parameter's value or rewrite its label or description

[@param-id](#param-id-attribute--parameter-id) indicates the parameter (within the scope of the referenced catalog or resource). The [&lt;value>](#value-element--value-constraint) element is used to provide a value for insertion of a value for the parameter when the catalog is resolved and rendered. A [&lt;desc>](#desc-element--parameter-description) element can be presented (made available) to a calling profile – that is, it is a parameter description helping to set the parameter in higher layers, not this one (when profiles are expected to provide baselines, for example).

* element [&lt;desc>](#desc-element--parameter-description) (optional)
* element [&lt;label>](#label-element--parameter-label) (optional)
* element [&lt;value>](#value-element--value-constraint) (optional)
* element [&lt;link>](#link-element--link) (zero or more)
* attribute [@param-id](#param-id-attribute--parameter-id) (required) valid to constraints for type 'NMTOKEN'
* attribute [@class](#class-attribute--class) (optional)

### `<alter>` element | Alteration 

Specifies changes to be made to an included control or subcontrol when a profile is resolved

Use `@targets` to indicate the classes of elements (typically [&lt;part>](#part-element--part) or [&lt;prop>](#prop-element--property) elements) to erase or remove from a control, when a catalog is resolved.

It is an error for two `<alter>` elements to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion.

* element [&lt;remove>](#remove-element--removal) (zero or more)
* element [&lt;add>](#add-element--addition) (zero or more)
* attribute [@control-id](#control-id-attribute--control-identifier) (optional) valid to constraints for type 'NCName'
* attribute [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) (optional) valid to constraints for type 'NCName'

### `<remove>` element | Removal 

Elements to be removed from a control or subcontrol, in resolution

Use [@class-ref](#class-ref-attribute--select-by-class), [@id-ref](#id-ref-attribute--reference-by-id) or [@item-name](#item-name-attribute--item-name) to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control or subcontrol, when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) [&lt;alter>](#alter-element--alteration) element.

To change an element, use `<remove>` to remove the element, then [&lt;add>](#add-element--addition) to add it back again with changes.

* attribute [@class-ref](#class-ref-attribute--select-by-class) (optional) valid to constraints for type 'NMTOKENS'
* attribute [@id-ref](#id-ref-attribute--reference-by-id) (optional) valid to constraints for type 'NCName'
* attribute [@item-name](#item-name-attribute--item-name) (optional) valid to constraints for type 'NCName'

### `@class-ref` attribute | Select by class 

Classes of items within controls or subcontrols in scope for removal
* Allowed on [&lt;remove>](#remove-element--removal)

### `@id-ref` attribute | Reference by ID 

ID values on items within controls or subcontrols in scope for removal
* Allowed on [&lt;remove>](#remove-element--removal)

### `@item-name` attribute | Item name 

The (element) name of an item within controls or subcontrols in scope for removal

To select the [&lt;title>](#title-element--title) element use the value "title" etc.
* Allowed on [&lt;remove>](#remove-element--removal)

### `<add>` element | Addition 

Element contents to be added to a control or subcontrols, in resolution

* as needed:
  * element [&lt;title>](#title-element--title)
  * element [&lt;param>](#param-element--parameter)
  * element [&lt;prop>](#prop-element--property)
  * element [&lt;part>](#part-element--part)
* attribute [@position](#position-attribute--placement-position) (required)

### `<combine>` element | Combination rule 

Whether and how to combine multiple (competing) versions of the same control

* attribute [@method](#method-attribute--control-combination-method) (required)

### `@method` attribute | Control combination method 

The method to be used when combining controls or subcontrols in resolving a profile

Whenever combining controls from multiple (import) pathways, an issue arises of what to do with clashing invocations (multiple competing versions of a control or a subcontrol). This setting permits a profile designer to apply a rule for the resolution of such cases. In a well-designed profile, such collisions would ordinarily be avoided; but this setting can be useful for defining what to do when it occurs.

Three values are provided: `use-first`, [&lt;merge>](#merge-element--merge-controls) or `keep`. The latter two may produce invalid/broken results in some cases (where upstream profiles compete over control contents). In a profile with no collisions, the three values all have the same results.
* Required on [&lt;combine>](#combine-element--combination-rule)

### `<as-is>` element | Structure as-is; retain source structure 

Structure the controls in resolution as they are structured in their source catalogs

This element is empty

### `<custom>` element | Customized structure for controls 

Frame a structure wherein represented controls will be embedded in resolution

* element [&lt;title>](#title-element--title) (optional)
* as needed:
  * element *group*, containing: 
    * element [&lt;title>](#title-element--title) (optional)
    * as needed:
      * element [&lt;group>](#group-element--group)
      * element [&lt;call>](#call-element--call-control-or-subcontrol)
      * element [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)
  * element [&lt;call>](#call-element--call-control-or-subcontrol)
  * element [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)
* attribute [@id](#id-attribute--id--identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-attribute--class) (optional)

## Attributes

### `@position` attribute | Placement position 

The position of insertion when adding to control contents (in alteration)

## Experimental elements

rnc: ../../schema/xml/RNC/oscal-catalog.rnc

### `<framework>` element | Framework 

A collection of components for formal reference into and among control catalogs

This element represents a collection of structured data objects ("components", see [&lt;component>](#component-element--framework-component)) that present information in ways organized to facilitate coordinated access (both manual and automated) both with one another and with controls documented in control catalogs. This is a suitable element for representing, not a control catalog, but an overlay or customization that has its own organization, making many-to-many links across catalogs, their profiles, and other canonical reference documents. (A customization that does not reorganize, but only selects from and configures a control, can be a [&lt;profile>](#profile-element--profile).)

Despite their very different roles in the system (catalogs for canonical collections of controls, frameworks for most anything else), components inside frameworks and controls inside catalogs have the same kinds of content objects subject to similar kinds of restrictions. With respect to their internals, that is, they are closely aligned, which simplifies processing of information across the boundaries between them.

### `<worksheet>` element | Worksheet 

An arbitrary, working collection of components

Functionally this element is an alias of [&lt;framework>](#framework-element--framework). But it is expected to be used for much more ad-hoc collections of components than formalized (much less published) frameworks.

### `<component>` element | Framework component 

Within a framework, a structured information object typically referencing one or more security controls

Components may be grouped using [&lt;group>](#group-element--group) and be further divided into parts. They may also contain components (recursively), although this may not generally be advisable.

In a spreadsheet format, components will frequently be analogous to rows; ideally their child elements (properties, links and other structured contents) will map directly to cells.

In a direct mapping from catalog to framework formats, both [&lt;control>](#control-element--control) and [&lt;subcontrol>](#subcontrol-element--control-extension) may be regarded as "components" of their "frameworks" (catalogs) in the general sense; however components in use are not likely to be much like the controls they reference.

### `<xdm-datatype>` element | XDM datatype lexical constraint 

(TBD) Indicates that the value of a property ([&lt;prop>](#prop-element--property)) or parameter ([&lt;param>](#param-element--parameter)) must be castable to the given XDM datatype

TBD. Another alternative is to permit arbitrary XPath (cast to Boolean), which would encompass this and more.

XDM datatypes include integers and numeric formats; dates, durations, date-times etc. An even more general functionality would be an xpath-satisfies that would support arbitrary XPath, so `castable as xs:integer` but also `xs:date(.) gt xs:date(../prop[@class='in-date'])` or `number(.) ge 0 and number(.) le 10.00`

## Constraints outside the core schema

Over and above what can be validated with a grammar (in the schema at the "core" level, but also distinct from OSCAL-flavor-specific validations, is a small set of constraints governing usage of @class assignments and element occurrence. Validations enforcing them can be implemented via Schematron or another process capable of static analysis of the data.

### Order of items inside controls

The schema does not enforce any particular order among the element contents of controls, except that title elements must appear first. Applications may accordingly re-sequence contents of controls and subcontrols. Since such re-ordering is inimical to prose or any linguistic representation that depends on sequencing, "islands of prose" are expected in OSCAL to appear not directly within controls or subcontrols, but rather within their components. These components themselves should be typed and labeled clearly enough to support arbitrary re-ordering.

A particular application or "flavor" of OSCAL might impose tighter constraints on the contents of controls or subcontrols, or of designated types (classes) of controls and subcontrols.

This is for maximum flexibility in OSCAL, in particular when it comes to mapping between XML representations and object representations (such as JSON) whose object types (such as maps) do not respect analogous constraints on cardinality (frequency and order) as XML does. OSCAL leaves it to its applications and implementations to enforce ordering.

Note that parameters in particular are "floating values" and may appear almost anywhere, in OSCAL that is otherwise unconstrained. It is not an error for a parameter value to be inserted into a document at a point before the parameter itself has been declared; absent other constraints imposed over the XML, parameters may be set even very late in document order, and their values injected "proactively" (before the setting itself appears in the file). This is mitigated by the fact that parameter ID values must be unique, making parameters easily findable from their points of insertion.

How or whether an implementation may respect the order of properties, parts and components in general, within a control type, may be expected to vary among applications or "flavors" of OSCAL; but order among components is not presently enforced under its declarations model. (Such a functionality could be discussed.)

### Reserved @class assignments

No control, component, object within a control, framework component or group can have a class assignment that overlaps with an element name in OSCAL

Forbidden names include (at last check): [&lt;control>](#control-element--control), [&lt;subcontrol>](#subcontrol-element--control-extension), [&lt;component>](#component-element--framework-component), [&lt;group>](#group-element--group), [&lt;part>](#part-element--part), [&lt;prop>](#prop-element--property),[&lt;param>](#param-element--parameter), or [&lt;title>](#title-element--title). Using the [&lt;title>](#title-element--title) element for nominal titles is better than using a property.

This constraint may be relaxed by failing to run the `OSCAL-strict.sch` Schematron.