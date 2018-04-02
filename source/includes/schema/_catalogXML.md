## Catalog XML Schema

The topmost element in the OSCAL catalog XML schema is [`<catalog>`](#catalog-element).

### `<catalog>` element

Each OSCAL catalog is defined by a `<catalog>` element. A `<catalog>` element may contain the following:

* `<title>` for the catalog (mandatory)
* [`<declarations>`](#declarations-element) (zero or more)
* [`<section>`](#section-element), [`<group>`](#group-element), and/or [`<control>`](#control-element) (zero or more of each)
* [`<references>`](#references-element) (optional)

### `<section>` element

Catalogs may use `<section>` elements for partitioning a catalog itself or another `<section>` element. A `<section>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (mandatory)
* `<p>`, `<ul>`, `<ol>`, and/or `<pre>` (zero or more of each) 
* `<section>` (zero or more)
* [`<references>`](#references-element) (optional)

### `<group>` element

Catalogs may use `<group>` elements to reference related controls or control groups. `<group>` elements may have their own properties, statements, parameters, and references, which are inherited by all members of the group. Unlike `<section>` elements, `<group>` elements may not contain arbitrary prose. A `<group>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* [`<param>`](#param-element), [`<link>`](#link-element), [`<prop>`](#prop-element), and/or [`<part>`](#part-element) (zero or more of each)
* `<group>` or [`<control>`](#control-element) (one or more total)
* [`<references>`](#references-element) (optional)

### `<control>` element

Each security or privacy control within the catalog is defined by a `<control>` element. A `<control>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* [`<param>`](#param-element), [`<link>`](#link-element), [`<prop>`](#prop-element), [`<part>`](#part-element), and/or [`<subcontrol>`](#subcontrol-element) elements (zero or more of each)
* [`<references>`](#references-element) (optional)

### `<subcontrol>` element

An OSCAL `<subcontrol>` element is very similar to an OSCAL `<control>` element in its composition. A `<subcontrol>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* [`<param>`](#param-element), [`<link>`](#link-element), [`<prop>`](#prop-element), and/or [`<part>`](#part-element) (zero or more of each)
* [`<references>`](#references-element) (optional)

##### `<prop>` element

A `<prop>` element is a value with a name. It is attributed to the containing control, subcontrol, component, part, or group. Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls and parts and extensions), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities. 

A `<prop>` element may contain the following:

* `@id` (optional)
* text content

##### `<part>` element

A `<part>` element is a partition, piece, or section of a control, subcontrol, component, or part. Generally speaking, `<part>` elements will be of two kinds. Many parts are logical partitions or sections for prose; these may be called "statements" and may be expected to have simple prose contents, even just one paragraph. Other parts may be more formally constructed out of properties (`<prop>` elements) and/or their own parts. Such structured objects (sometimes called "features") may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements"). Since the composition of parts can be constrained using OSCAL declarations (of the items or components to be given in a part or in this type of part), their use for encoding "objects" of arbitrary complexity within controls is effectively open-ended.

A `<part>` element may contain the following:

* `<title>` (optional)
* [`<param>`](#param-element), [`<link>`](#link-element), [`<prop>`](#prop-element), `<part>`, `<p>`, `<ul>`, `<ol>`, and/or `<pre>` (zero or more of each)

##### `<link>` element

A `<link>` element is a line or paragraph with a hypertext link. A `<link>` element may contain the following:

* `@rel` (optional)
* `@href` (optional)
* text content, possibly mixed with zero or more of each of the following: `<q>`, `<code>`, `<em>`, `<i>`, `<b>`, `<sub>`, `<sup>`, and/or `<span>`

##### `<param>` element

A `<param>` element is a parameter setting to be propagated to one or more points of insertion. A `<param>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<desc>` (mandatory)
* `<label>` (optional)
* `<value>` (optional)

### `<references>` element

A `<references>` element contains one or more reference descriptions, each contained within a `<ref>` element. Each `<ref>` element may contain the following:

* `@id` (optional)
* `<std>` (citation of a formal published standard), `<citation>` (citation of a resource), `<p>`, `<ul>`, `<ol>`, and/or `<pre>` (zero or more of each)

### `<declarations>` element

A `<declarations>` element is used for extra-schema validation of data given within controls or framework components. More information on this will be added to the documentation in the future.
