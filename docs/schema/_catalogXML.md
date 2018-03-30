
> * [XML Schema _catalog.xsd](#)
>   * [Controls and their contents](#controls-and-their-contents)
>     * [&lt;catalog> Catalog](#&lt;catalog>-element:-catalog)
>     * [&lt;control> Control](#&lt;control>-element:-control)
>     * [&lt;subcontrol> Control extension](#&lt;subcontrol>-element:-control-extension)
>     * [&lt;prop> Property](#&lt;prop>-element:-property)
>     * [&lt;part> Part](#&lt;part>-element:-part)
>     * [&lt;link> Link](#&lt;link>-element:-link)
>     * [@rel rel](#rel-rel)
>     * [@id ID / identifier](#id-id-/-identifier)
>     * [@href hypertext reference](#href-hypertext-reference)
>     * [@class Class](#class-class)
>   * [Functional elements](#functional-elements)
>     * [&lt;param> Parameter](#&lt;param>-element:-parameter)
>     * [&lt;label> Parameter label](#&lt;label>-element:-parameter-label)
>     * [&lt;desc> Parameter description](#&lt;desc>-element:-parameter-description)
>     * [&lt;insert> Parameter insertion](#&lt;insert>-element:-parameter-insertion)
>     * [@param-id Parameter ID](#param-id-parameter-id)
>     * [&lt;withdrawn> Withdrawn](#&lt;withdrawn>-element:-withdrawn)
>   * [Structural elements](#structural-elements)
>     * [&lt;section> Section](#&lt;section>-element:-section)
>     * [&lt;group> Group](#&lt;group>-element:-group)
>     * [&lt;title> Title](#&lt;title>-element:-title)
>     * [&lt;references> References](#&lt;references>-element:-references)
>     * [&lt;ref> Reference](#&lt;ref>-element:-reference)
>     * [&lt;std> Standard](#&lt;std>-element:-standard)
>     * [&lt;citation> Citation](#&lt;citation>-element:-citation)
>   * [Prose](#prose)
>     * [&lt;p> Paragraph](#&lt;p>-element:-paragraph)
>     * [&lt;pre> Preformatted text](#&lt;pre>-element:-preformatted-text)
>     * [&lt;ol> Ordered List](#&lt;ol>-element:-ordered-list)
>     * [&lt;ul> Unordered list](#&lt;ul>-element:-unordered-list)
>     * [&lt;li> List item](#&lt;li>-element:-list-item)
>     * [&lt;em> Emphasis](#&lt;em>-element:-emphasis)
>     * [&lt;i> Italics](#&lt;i>-element:-italics)
>     * [&lt;b> Bold](#&lt;b>-element:-bold)
>     * [&lt;a> Anchor](#&lt;a>-element:-anchor)
>     * [&lt;q> Quoted text](#&lt;q>-element:-quoted-text)
>     * [&lt;code> Code](#&lt;code>-element:-code)
>     * [&lt;sup> Superscript](#&lt;sup>-element:-superscript)
>     * [&lt;sub> Subscript](#&lt;sub>-element:-subscript)
>     * [&lt;span> Span](#&lt;span>-element:-span)

# XML Schema _catalog.xsd

## Controls and their contents

xsd: ../../schema/xml/XSD/_catalog.xsd

The foundations of OSCAL are in control objects, such as controls and subcontrols, and the structured information they represent or contain (loosely "objects", represented as valid XML elements). These contents will include both structured contents (using element types as described here) and (within those) relatively uncontrolled or free-form contents (described elsewhere as [prose](#prose)).

### `&lt;catalog>` element: Catalog 

A (canonical) control catalog: a structured set of security controls

##### Content declaration (reduced)

* element `title` (mandatory)
* element `declarations` (optional)
* as needed:
  * element `section`
  * element `group`
  * element `control`
* element `references` (optional)

### `&lt;control>` element: Control 

A structured information object representing a security control

Controls may be grouped using `group`, and controls may be partitioned using `part` or extended using `subcontrol`.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element `title` (optional)
* as needed:
  * element `param`
  * element `link`
  * element `prop`
  * element `part`
  * element `subcontrol`
* element `references` (optional)

### `&lt;subcontrol>` element: Control extension 

An associated or dependent control object; an enhancement to a control

A nominal subcontrol or "control extension" permits catalogs to offer access to structured control objects within controls. Further levels down can be achieved using `part` (both controls and subcontrols may be partitioned), which may contain their own parts; however, knowing in advance which "controls" and "subcontrols" are especially significant is helpful.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element `title` (optional)
* as needed:
  * element `param`
  * element `link`
  * element `prop`
  * element `part`
* element `references` (optional)

### `&lt;prop>` element: Property 

A value with a name, attributed to the containing control, subcontrol, component, part, or group

The notation used by a property is up to an application; otherwise, properties are distinguished in OSCAL by not permitting inline markup of any kind. They are expected to be simple scalar values or to use machine-readable/parseable notation (not XML), as defined by and for an application.

The lexical composition of properties may be constrained by declarations including matching to regular expressions or declaring known datatype notations (tbd).

Because properties are often used as selectors or identifiers for OSCAL operations, their values can be expected frequently to be flattened (markup stripped) and normalized (e.g., with respect to whitespace) in use; however, this is application defined.

For singletons (that is, the only element among siblings with its [@class](#class-class)), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf `declare-prop` in the declarations model (which also supports other constraints over property values).

Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls and parts and extensions), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.

##### Content declaration (reduced)

* text content *only* (and potentially further constrained)

### `&lt;part>` element: Part 

A partition, "piece" or section of a control, subcontrol, component or part

Like properties (`prop`) and parameters (`param`), parts can be distinguished from other elements within their controls by their assigned [@class](#class-class), such that they may be subjected to "declarations logic" using these values as bindings (and thereby getting open-ended extensibility).

An assigned class may frequently provide for a header in display, such that `part[@class='objectives']` is displayed under a header *Objectives*, etc. Parts may also however have their own titles (`title` elements).

Generally speaking, `part` elements will be of two kinds. Many parts are logical partitions or sections for prose; these may be called "statements" and may be expected to have simple prose contents, even just one paragraph. Other parts may be more formally constructed out of properties (`prop` elements) and/or their own parts. Such structured objects (sometimes called "features") may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements"). Since the composition of parts can be constrained using OSCAL declarations (of the items or components to be given in a part or in this type of part), their use for encoding "objects" of arbitrary complexity within controls, is effectively open-ended.

##### Content declaration (reduced)

* element `title` (optional)
* as needed:
  * element `param`
  * element `link`
  * element `prop`
  * element `part`
  * element `p`
  * element `ul`
  * element `ol`
  * element `pre`

### `&lt;link>` element: Link 

A line or paragraph with a hypertext link

Works like an HTML anchor (`a`) except this is a line-oriented (block) element.

##### Content declaration (reduced)

* attribute [@rel](#rel-rel) (optional)
* attribute [@href](#href-hypertext-reference) (optional)
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`

### rel rel 

The stipulated relation of a link to its target or vice versa
* Allowed on `link`, `declare-link`

### id ID / identifier 

A value on @id unique within local document scope, i.e. across a given catalog or representation of catalog contents (controls).

No mechanism is proposed to ensure that [@id](#id-id-/-identifier) values do not collide across different catalogs. Use profiling without "merge" to detect such clashes.
* Allowed on `section`, `group`, `control`, `subcontrol`, `param`, `ref`, `pre`, `li`, `insert`, `custom`
* Required on `profile`

### href hypertext reference 

A link to a document or document fragment (actual, nominal or projected)

Note in particular that [@href](#href-hypertext-reference) targets include elements (locations) in representations of documents that exist only by virtue of dynamic application, such as (for example) the results of profile resolution.
* Allowed on `link`, `std`, `citation`, `a`, `declarations`, `import`

### class Class 

Nominal semantic binding(s) for any element (whitespace-separated list of name tokens)

Overloading this attribute with more than one value is permitted, but not recommended.
* Required on `declare-prop`, `declare-part`, `declare-p`
* Allowed on `section`, `group`, `control`, `subcontrol`, `param`, `prop`, `li`, `code`, `em`, `i`, `b`, `sub`, `sup`, `span`, `custom`, `set-param`

## Functional elements

xsd: ../../schema/xml/XSD/_catalog.xsd

Functional elements appear inside control content to provide "hooks" to OSCAL processors for retrievability, manipulation (including mapping and transformation), and semantic traversal.

### `&lt;param>` element: Parameter 

A parameter setting, to be propagated to points of insertion

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element `desc` (mandatory)
* element `label` (optional)
* element `value` (optional)

### `&lt;label>` element: Parameter label 

A placeholder for a missing value, in display

Contains text

### `&lt;desc>` element: Parameter description 

Indicates and explains the purpose and use of a parameter

##### Content declaration (reduced)

* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`

### `&lt;insert>` element: Parameter insertion 

A "call" (reference) to a parameter for dynamic content transclusion

This element is empty

### param-id Parameter ID 

Applicable parameter

Identifies the parameter element target (`param`) that governs content insertion at this location (when on an `insert`), or to which a parameter setting applies (when on a `set-param`).
* Required on `insert`, `set-param`

### `&lt;withdrawn>` element: Withdrawn 

Indicates that a containing control or subcontrol is no longer applicable

Used to mark a control or subcontrol included in a catalog as a placeholder, to maintain its semantic integrity in obsolescence. Links should be provided to superseding controls or components.

The functionality provided by this element might better be offered by a property or some other controlled value, at which point it may be removed; it is included to support (some) legacy content.

##### Content declaration (reduced)

* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`

## Structural elements

xsd: ../../schema/xml/XSD/_catalog.xsd

### `&lt;section>` element: Section 

A partition within a catalog or section (prose text not controls)

Echoes HTML5 `section`. May contain controls (`control`) or groups of controls (`group`).

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element `title` (mandatory)
* as needed:
  * element `p`
  * element `ul`
  * element `ol`
  * element `pre`
* element `section` (zero or more)
* element `references` (optional)

### `&lt;group>` element: Group 

A set of related controls or groups (of controls or groups)

In addition to controls or groups, groups may be titled and may have their own properties, statements, parameter settings, and references, subject to declaration. In this respect they are like controls, subcontrols or parts, but their properties apply to the entire group and must be acquired in processing via inheritance.

Unlike sections (`section` elements), groups may not contain arbitrary prose (paragraphs and lists). They may, however, contain statements (stmt), which may be untyped (no [@class](#class-class)) and therefore unconstrained by declarations.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* element `title` (optional)
* as needed:
  * element `param`
  * element `link`
  * element `prop`
  * element `part`
* as needed (at least one):
  * element `group`
  * element `control`
* element `references` (optional)

### `&lt;title>` element: Title 

A fallback for display and navigation, exclusive of more specific properties

##### Content declaration (reduced)

* text content, possibly mixed with 
  * element `q` (zero or more)

### `&lt;references>` element: References 

A group of reference descriptions

##### Content declaration (reduced)

* element `ref` (at least one)

### `&lt;ref>` element: Reference 

A reference, with one or more citations to standards, related documents, or other resources

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* as needed:
  * element `std`
  * element `citation`
  * element `p`
  * element `ul`
  * element `ol`
  * element `pre`

### `&lt;std>` element: Standard 

Citation of a formal published standard

Echoes the NISO JATS (and NISO STS) `std` element

##### Content declaration (reduced)

* attribute [@href](#href-hypertext-reference) (optional) valid to constraints for type 'anyURI'
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`

### `&lt;citation>` element: Citation 

Citation of a resource

Echoes the NISO JATS (and NISO STS) `mixed-citation` element.

For references to standards, `std` may be preferred.

##### Content declaration (reduced)

* attribute [@href](#href-hypertext-reference) (optional) valid to constraints for type 'anyURI'
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`

## Prose

xsd: ../../schema/xml/XSD/_catalog.xsd

Prose may ordinarily appear anywhere except directly inside controls or subcontrols, where they will ordinarily be relegated to the control's partitions or statements (`part`s). OSCAL prose elements echo HTML semantics, although they are deliberately and specifically a narrow subset of HTML element types. This is intended to be the bare minimum of stripped down text as is appropriate for control documentation. Graphics, diagrams, and tables are all out of scope for OSCAL (although arbitrary feature sets can always be modeled in OSCAL as nested parts).

Among prose elements, `p` elements in particular are of interest in that they may be constrained by declarations like other contents of controls (or components) – although this may not often be as useful as imposing constraints over properties and parts. Frequently, a part organization will be used to assign prose to specific known "sections" or "enhancements" of a control (modeled as `part` or `subcontrol`).

### `&lt;p>` element: Paragraph 

Running text: a paragraph or paragraph fragment

This element echoes HTML `p`. As in HTML, it is not limited to indicating complete or discrete (compositional or logical) paragraphs, but can be used for any text set off on its own line.

##### Content declaration (reduced)

* as needed:
  * element `withdrawn`
  * element `insert`
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`

### `&lt;pre>` element: Preformatted text 

Retains whitespace in display

Echoes HTML `pre`.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`

### `&lt;ol>` element: Ordered List 

Appears with numbering in ordinal position

Although this echoes HTML `ol`, renditional aspects of this element are not offered by OSCAL. How lists are to be numbered is left to implementations; it is likely that specific control catalogs will have their own schemes.

At present there is no support for "continued lists", as we have not seen any in documents in scope for analysis.

##### Content declaration (reduced)

* element `li` (at least one)

### `&lt;ul>` element: Unordered list 

A series of items kept in order but without indicators of sequence; likely bulleted

As in HTML, "unordered" does not indicate that the order of contained list items is not respected, only that they are not displayed with any notation indicating their order: that is, bullets, not numbers.

Note that when sequences or lists appear, it may be as common in OSCAL to list (and control) them as sequences of properties or paragraphs, perhaps grouped in parts or subcontrols. This is very much a display element, convenient when what we have is really prose, not highly organized or "semantic".

OSCAL has (as of yet) no "simple" or unadorned list element; it is suggested that an [@class](#class-class) added to `ul` should be rendered as such in any application that wants it.

##### Content declaration (reduced)

* element `li` (at least one)

### `&lt;li>` element: List item 

An item demarcated with a bullet or numerator

OSCAL uses a lightweight HTML-like approach to lists, in which list items are unstructured (mixed content) except for permitting sublists directly, without separation from other text. The expectation is that items in lists will not need further internal ("paragraph") demarcation.

Lists that are really (brief) subsections may be expressed as (nested, unclassed) `part` elements. Generally speaking, structured feature sets (in the form of parts with regular property sets), are more likely to be easily addressable than lists.

##### Content declaration (reduced)

* attribute [@id](#id-id-/-identifier) (optional) valid to constraints for type 'ID'
* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element `withdrawn`
  * element `insert`
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`
  * element `ol`
  * element `ul`

### `&lt;em>` element: Emphasis 

Rhetorical emphasis as typically indicated by a font shift

In display, this element can be expected to "toggle", i.e. provide for italics when appearing within roman text, but roman when appearing within italic text.

Particular semantics (indicating types of emphasis for finer resolution in display or retrieval) may be provided via [@class](#class-class).

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`

### `&lt;i>` element: Italics 

Typographical shift to italics

An implementation may toggle, i.e., display contents using a roman face when the surrounding text is already italic.

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`

### `&lt;b>` element: Bold 

Typographical shift to bold

In display, when the surrounding text is already bold, an implementation may indicate "bold" by means of double-bold or some other typographical distinction.

As of yet, OSCAL does not support underlining directly (no `u` element or designated property, which makes underlining, like color and strikethrough, a feature exploitable (with less ambiguity) at the application level.

In ordinary use, `b` and `i` should perhaps be deprecated in favor of more "semantic" elements such as `em`, `code` or even `span>` especially with [@class](#class-class) attributes.

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`

### `&lt;a>` element: Anchor 

An HTML-style anchor (inline linking element)

As in HTML, the link target is indicated by [@href](#href-hypertext-reference), with a '#' prefix for an internal cross-reference matching an [@id](#id-id-/-identifier) elsewhere in the document.

Anchors without [@href](#href-hypertext-reference) are not invalid to the OSCAL schema (base validation), but may be reported by a Schematron. An application may promote the contents of an `a` element, when a valid URI, to serve as the link target if [@href](#href-hypertext-reference) is missing or not a URI.

As in HTML, `a` appears inline (in mixed content), while `link` is a "paragraph-level" link (that appears next to paragraphs or components in a control).

##### Content declaration (reduced)

* attribute [@href](#href-hypertext-reference) (optional)
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element *em*, containing: 
    * attribute [@class](#class-class) (optional)
    * text content

### `&lt;q>` element: Quoted text 

An inline segment to appear within quotation marks

This element is intended for use producing "smart quotes" around short phrases, not for extended quotations. Ordinarily it has no special semantics other than to provide quotation marks in display.

##### Content declaration (reduced)

* text content, possibly mixed with 
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`

### `&lt;code>` element: Code 

Inline code

Strictly, this element should identify formal code or code fragments. Like anything else, it may be "enhanced" using its class.

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`

### `&lt;sup>` element: Superscript 

Superscripted text

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content

### `&lt;sub>` element: Subscript 

Subscripted text

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content

### `&lt;span>` element: Span 

Generic inline container

As in HTML, this is an escape hatch for arbitrary (inline) semantic (or other) tagging.

The OSCAL declarations model does not presently support validating properties of arbitrary spans. But it might. Please share your requirements.

##### Content declaration (reduced)

* attribute [@class](#class-class) (optional)
* text content, possibly mixed with 
  * element `q`
  * element `code`
  * element `em`
  * element `i`
  * element `b`
  * element `sub`
  * element `sup`
  * element `span`
  * element `a`