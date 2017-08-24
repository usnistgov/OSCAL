 

## OSCAL: the Open Security Controls Assessment Language 

## OSCAL namespace 

The element population of an OSCAL document (set) may be determined by means of XPath distinct-values(//*/node-name()), or analogous query. 

Conformant (valid) OSCAL documents will not contain elements not described in this specification. While OSCAL may be mixed with other tag sets, or extended, neither of these uses is described or circumscribed by this document, which provides only bare-bones information about the OSCAL "core". 

For its XML names, OSCAL uses the namespace XXX http://scap.nist.gov/schema/oscal XXX. Commonly, this will be assigned to (unprefixed) names in an OSCAL document by default, and in this document, OSCAL elements (and attributes, presumed to be in no-namespace) are referenced without a prefix, oscal: or any other. 

By design, OSCAL looks a lot like HTML on the inside. Transformations to HTML, however, should always strip the OSCAL namespace, to produce HTML in the appropriate namespace for the target application. (Or the target application could learn to consume OSCAL.) Only some parts of HTML, however, make their way into OSCAL, which is designed to address its own requirements. 

## OSCAL organization 

OSCAL catalogs are built out of controls. Essentially, OSCAL is a lightweight and free-form "documentary" format, which includes semantic "islands" of structured information. These are "semantic" not only because they are addressable in principle, but more importantly because their organizations and values may be known (at least with respect to certain operations and relations), before processing occurs, even (at the most general level) before operations are designed and deployed. OSCAL offers a Yin to the Yang of query and processing. 

At the broadest level, "control objects" in OSCAL, as it is formally defined, include controls, subcontrols (i.e. control extensions), parts of controls or subcontrols, and control groups. In other words, "control" over OSCAL data structures is offered at many levels at once. It will be the job of a particular OSCAL application domain to determine what the most appopriate level of description, for that domain, to describe best as "control", "subcontrol" etc. 

This organization is governed by an XML schema, which enforces containment constraints among these elements. In particular, the OSCAL schema declares elements for [&lt;control>](#control-control), [&lt;subcontrol>](#subcontrol-control-enhancement) and [&lt;part>](#part-part). According to its rules, subcontrols may only appear within controls. Either controls or subcontrols may be partitioned (may contain parts), and parts may contain their own parts. Any of these objects may be "controlled" in the sense that they may be used, consistently, to carry regular sets of properties, whose names and value spaces may be known in advance, or discovered dynamically. 

## Interoperability with other data formats 

OSCAL should map easily and straightforwardly to any generic XML or tag-based markup language including HTML, Markdown and its variants, NISO JATS, DITA, etc. etc. Additionally, OSCAL documents may be taken as "warrants for inference" for serialization of linked data objects or other application binding formats including JSON. 

Because OSCAL is semantically richer and denser than most markup languages as used, however, automated conversion into OSCAL from any of these formats is likely to require tuning or customization per instance - that is, each one will be a one-off conversion.  

## Controls and control components 

### &lt;catalog> Catalog   

Top-level element for a (canonical) control catalog   

### &lt;collection> Collection   

Top-level element for a set of controls, not considered to be a catalog  

##### remarks 

Most often, a collection element will be used for a set of controls derived from one or more control catalogs (such as a profile, baseline or overlay), which do not themselves serve as a catalog. 

However, collections may contain everything that catalogs may contain, and OSCAL does not prohibit their use as (source or interim) catalogs for profiling. (Although an application might).   

### &lt;control> Control   

A structured information object representing a security control  

##### remarks 

Controls may be grouped using [&lt;group>](#group-group), and controls may be partitioned, using either formal [&lt;subcontrol>](#subcontrol-control-enhancement) or (informally) [&lt;part>](#part-part).   

### &lt;subcontrol> Control enhancement   

Within a control, a component or enhancement  

##### remarks 

A nominal subcontrol or "control enhancement", permitting catalogs easily to provide access to structured data at two levels. Further levels down can be achieved using [&lt;part>](#part-part) (both controls and subcontrols may be partitioned), which may contain their own parts; however having "controls" and "subcontrols" known in advance to be especially significant, is helpful.   

### &lt;prop> Property   

A value with a name, attributed to the containing control, subcontrol, feature or group  

##### remarks 

The notation used by a property is up to an application; otherwise, properties are distinguished in OSCAL by their not permitting inline markup of any kind. They are expected to be simple scalar values or at any rate, to use machine-readable / parseable notation (not XML), as defined by and for an application. 

The lexical composition of properties may be constrained by declarations including matching to regular expressions or declaring known datatype notations (tbd). 

Inasmuch as properties are often used as selectors or identifiers for OSCAL operations, their values can be expected frequently to be flattened (markup stripped) and normalized (e.g., with respect to whitespace) in use; however this is application defined. 

When singletons (that is, the only element among siblings with its @class), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf property in the declarations model (which also supports other constraints over property values). 

Properties the deployment and management of arbitrary controlled values, with and among control objects (controls and their formal enhancements), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order and arrange controls or relate them to one another or to class hierarchies, taxonomies or external authorities.   

### &lt;part> Part   

A component or partition in a control, subcontrol or part  

##### remarks 

Like properties ([&lt;prop>](#prop-property)) and parameters ([&lt;param>](#param-parameter)), parts can be distinguished from other elements within their controls by their assigned @class, such that they may be subjected to "declarations logic" using these values as bindings (and thereby getting open-ended extensibility). 

An assigned class may frequently provide for a header in display, such that part[@class='objectives'] is displayed under a header *Objectives*, etc. Unlike groups, controls or subcontrols, however, they may not have [&lt;title>](#title-title) element children (they are not "first class objects" in this sense). Thus in OSCAL, if the components of your controls have their own titles, they are something else): to accommodate data like this, consider using a property (e.g. prop[@class='part-title'] as an escape hatch.   

### &lt;link> Link   

A line or paragraph with a hypertext link   

### &lt;param> Parameter   

A parameter setting, to be propagated to points of insertion     

## Functional elements 

Functional elements appear inside control content to provide "hooks" to OSCAL processors for dynamic insertion. 

### &lt;withdrawn> Withdrawn   

Indicates that a containing control or subcontrol is no longer applicable  

##### remarks 

Used to mark a control or subcontrol included in a catalog as a placeholder,    

### &lt;insert> Parameter insertion   

A reference to a parameter for dynamic content transclusion   

### &lt;select> Selection   

A selection requiring designation via parameter   

### &lt;choice> Choice   

A choice of values, to be designated via parameter     

## Declarations elements 

### &lt;declarations> Declarations   

For extra-schema validation of control components within controls  

##### remarks 

The OSCAL validation model supports not only validation against a formal schema (describing elements, attributes, and their permitted contents, described generally and generically), but also against a set of declarations provided specifically for the catalog or catalog type within which they appear. Constraints described in these declarations, and bound via assignments of @class (for control components) and @context (indicating control, subcontrol or features wherein the components may appear), enable automated checking for consistency of controls, subcontrols and features, specific to the types or kinds of control items that appear within a particular catalog or control collection.   

### &lt;declare-property> Property declaration   

Constraints applicable to a class or classes of [&lt;p>](#p-paragraph) elements within a control object   

### &lt;declare-p> Paragraph declaration   

Indicates constraints to be enforced on paragraphs in context   

### &lt;declare-part> Part declaration   

Indicates constraints to be imposed on parts in context   

### &lt;declare-link> Link declaration   

Indicates constraints to be imposed on links in context   

### &lt;singleton> Singleton constraint   

The declared component may occur only once in its context  

##### remarks 

When this element is present in the declaration of an OSCAL control component, the component ([&lt;prop>](#prop-property), [&lt;param>](#param-parameter), stmt or feat) must be the only component of that class given in its context. i.e., no other element child of the same parent may have the same @class value (at the level of syntax), or be bound to the same component type (at the semantic level).   

### &lt;required> Requirement constraint   

The declared component is required in its context  

##### remarks 

When this element is present in the declaration of an OSCAL control component, the component ([&lt;prop>](#prop-property), [&lt;param>](#param-parameter), stmt or feat) is required to appear, at least once, in its context.   

### &lt;identifier> Identifier constraint   

The declared component has a value unique within the document, among components of the same type  

##### remarks 

This constraint is generally only used for properties to be used as identifiers for their control object (control, subcontrol or feature). Guaranteeing their uniqueness means that these values can be used to effect one-to-one retrieval or reference to the objects to which they are assigned.   

### &lt;regex> Regular expression constraint   

Indicates that the value of a property (prop) or parameter ([&lt;param>](#param-parameter)) must match the given regular expression  

##### remarks 

Matching against a regular expression is conducted on the normalized lexical value of the given parameter or property: that is, with leading and trailing whitespace stripped, interim whitespace (space, tab or line feed) normalized to single spaces, and inline markup stripped.   

### &lt;value> Value constraint   

Indicates a permissible value for a parameter or property  

##### remarks 

In a declaration, [&lt;value>](#value-value-constraint) will be given in groups, indicating a set of enumerated permissible values. 

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".   

### &lt;autonum> Autonumbered (generated) value   

Generates a formatted numeric value based on the position of a control object among its siblings, the text contents providing a template for the numbering format (arabic, alphabetic, roman etc)  

##### remarks 

In a declaration, [&lt;value>](#value-value-constraint) will be given in groups, indicating a set of enumerated permissible values. 

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack". 

The *contents*, not the value of any attribute, will be taken by the processor to be a formatting code. The format should follow the spec for XSLT xsl:number/@format. For example, if the value is "A." then numbering will appear in the sequence A., B., C., etc (as punctuated). Recognized formats include upper and lower case alphabetic numbering, arabic numbering, and upper- and lower-case roman numbering as described for XSLT.   

### &lt;inherit> Inherited value constraint   

Indicates that a value or part of a value will be inherited from a property on a containing control object  

##### remarks 

[&lt;inherit>](#inherit-inherited-value-constraint) is typically used to enforce hierarchical numbering within control objects. When given in a [&lt;value>](#value-value-constraint) in a declaration, [&lt;inherit>](#inherit-inherited-value-constraint) indicates that the value of a property, or a segment of its value, must be the same as a property ([&lt;prop>](#prop-property)) higher in the containment hierarchy of a control object. That is, if a property with @class='number' is constrained with value/inherit, it must be the same as is assigned on the closest ancestor (feature, subcontrol, control or group) with the given property. 

Usually, [&lt;inherit>](#inherit-inherited-value-constraint) is used in conjunction with [&lt;autonum>](#autonum-autonumbered-(generated)-value) (qv). Using the two elements in combination, for example, the number (property) assigned to a subcontrol appearing inside a control numbered "A1" may be constrained to be "A1-a", "A1-b" etc., depending on the position of the subcontrol within the control. 

If a value must inherit from a property of a different class from the containing control object, inherit/@from can be used to indicate the applicable property (by its class). By default, [&lt;inherit>](#inherit-inherited-value-constraint) indicates a property value should match an ancestor's property with the same @class (the most usual case).   

### &lt;desc> Parameter description   

Indicates and explains the purpose and use of a parameter     

## Structural elements 

### &lt;section> Division   

A chapter, section or subsection partitioning a catalog, collection or section therein  

##### remarks 

Echoes HTML5 [&lt;section>](#section-division). 

Like groups, sections ([&lt;section>](#section-division))   

### &lt;group> Group   

Related controls or groups (of controls or groups)  

##### remarks 

In addition to controls or groups, groups may be titled and may have their own properties, statements, parameter settings and references, subject to declaration. In this respect they are like control objects (control, subcontrol and feature), albeit their properties apply to the entire group – and must be acquired in processing via inheritance. 

Unlike sections ([&lt;section>](#section-division) elements), groups may not contain arbitrary prose (paragraphs and lists). They may however contain statements (stmt), which may be untyped (no @class) and therefore unconstrained by declarations.   

### &lt;title> Title    

### &lt;references> References    

### &lt;ref> Reference    

### &lt;std> Standard   

Citation of a formal published standard  

##### remarks 

Echoes the NISO JATS (and NISO STS) [&lt;std>](#std-standard) element   

### &lt;citation> Citation   

Citation of a resource  

##### remarks 

Echoes the NISO JATS (and NISO STS) mixed-citation element. 

For references to standards, [&lt;std>](#std-standard) (qv) may be preferred.     

## Prose 

### &lt;p> Paragraph   

Or paragraph fragment  

##### remarks 

This element echoes HTML [&lt;p>](#p-paragraph); like its forebear, it is not limited to indicating complete or discrete (compositional or logical) paragraphs, but can be used for any text set off on its own line.   

### &lt;pre> Preformatted text   

Retains whitespace in display  

##### remarks 

Echoes HTML [&lt;pre>](#pre-preformatted-text).   

### &lt;ol> Ordered List    

### &lt;li> List item    

### &lt;ul> Unordered list   

##### remarks 

As in HTML, "unordered" does not indicate that the order of contained list items is not respected, only that they are not displayed with any notation indicating their order: that is, bullets, not numbers.   

### &lt;em> Emphasis   

Rhetorical emphasis as indicated typically by a font shift  

##### remarks 

In display, this element can be expected to "toggle", i.e. provide for italics when appearing within roman text, but roman when appearing within italic text. 

Particular semantics (indicating types of emphasis for finer resolution in display or retrieval) may be provided via @class.   

### &lt;i> Italics   

Typographical shift to italics  

##### remarks 

An implementation may toggle, i.e. display contents using a roman face when the surrounding text is already italic.   

### &lt;b> Bold   

Typographical shift to bold  

##### remarks 

In display, when surrounding text is already bold, an implementation may indicate "bold" by means of double-bold or some other typographical distinction.   

### &lt;a> Anchor   

An HTML-style anchor (inline linking element)  

##### remarks 

As in HTML, the link target is indicated by @href, with a '#' prefix for an internal cross-reference matching an @id elsewhere in the document. 

Anchors without @href are not invalid to the OSCAL schema (base validation), but may be reported by a Schematron. In use, an application may promote the contents of a [&lt;a>](#a-anchor) element, when a valid URI, to serve as the link target, if @href is missing or not a URI.   

### &lt;q> Quoted text   

An inline segment to appear within quotation marks  

##### remarks 

For practical purposes, this is a cosmetic element with no special semantics other than to provide quotation marks in display.   

### &lt;code> Code   

Inline code  

##### remarks 

Strictly, this element should identify formal code or code fragments.   

### &lt;sup> Superscript   

Superscripted text   

### &lt;sub> Subscript   

Subscripted text  

##### remarks 

Strictly, this element should identify formal code or code fragments.   

### &lt;span> Span   

Generic inline container  

##### remarks 

As in HTML, an escape hatch for arbitrary (inline) semantic (or other) tagging.     

## Structural constraints 

####  

Over and above what is validable with a grammar (in Level 0), there is a small set of constraints governing usage. Validations enforcing them can be implemented via Schematron or another process capable of static analysis of the data.  

### Within a control, properties, statements and parameters may occur in any order.  

This specification does not govern how or whether an implementation may respect the order of properties and statements given within a control type. Among properties, statements and parameters (that is, named things) within a control, cardinality constraints (where enforced) can help ensure a canonical order. An order may be imposed locally (for example, by a schema that requires all properties to appear before all statements), but this is for its convenience not because an order is mandated.    

## Customization layers 

Like many tag languages and machine-readable syntaxes, OSCAL is intended to be extended and customized. Unlike most other formats, however, OSCAL's extension mechanism includes a set of features, supported natively in the language, for extension by the simplest possible mechanism, without requiring modification of any schemas, using a simple, native set of declarations for controls. 

OSCAL's validation model consists of several layers. At base is schema validation, which ensures that all tags in use are recognized as OSCAL tagging and that their arrangement in the document (with regard to both structure, and certain "semantic" relations) is consistent with regular usage of OSCAL. In a second layer, other relationships can be tested and rules enforced, over and above what a schema imposes. Implemented in Schematron or any technology with analogous capabilities, such as second layer is more flexible and configurable than the base layer. 

In a third layer, an OSCAL document is validated to constraints it declares for itself, that is locally in its own declarations. (Call this a "consistency check" rather than validation, for clarity.) Such a validation may be useful to an OSCAL implementation, which can take advantage of contracts implicit in such validation to provide functionalities; OSCAL itself does not provide such functionality, but only the hooks – and the mechanism by which users and developers can easily create and manage new control types. 