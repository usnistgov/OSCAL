## Catalog XML Schema

The topmost element in the OSCAL catalog XML schema is [`<catalog>`](#code-lt-catalog-gt-code-element).

### `<catalog>` element

Each OSCAL catalog is defined by a `<catalog>` element. A `<catalog>` element may contain the following:

* `<title>` (mandatory)
* [`<declarations>`](#code-lt-declarations-gt-code-element) (zero or more)
* [`<section>`](#code-lt-section-gt-code-element), [`<group>`](#code-lt-group-gt-code-element), and/or [`<control>`](#code-lt-control-gt-code-element) (zero or more of each)
* [`<references>`](#code-lt-references-gt-code-element) (optional)

> This example shows how the high-level structure of a  ``<catalog>`` element might look. It leaves out details such as multiple references and the contents of the ``<group>`` element so you can get a better feel for the structure and top-level elements.

```xml
<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0">
   <title>The Ultimate Catalog of Security Controls</title>
   <declarations href="ultimate_catalog_declarations.xml"/>
   <references>
      <ref id="ref1">
         <citation href="http://www.example.xyz">The Ultimate Catalog of Security Controls, Version 1.2.3</citation>
      </ref>
      ...
   </references>
   <group class="family">
   ...
   </group>
</catalog>

```

### `<section>` element

Catalogs may use `<section>` elements for partitioning a catalog itself or another `<section>` element. A `<section>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (mandatory)
* `<p>`, `<ul>`, `<ol>`, and/or `<pre>` (zero or more of each)
* `<section>` (zero or more)
* [`<references>`](#code-lt-references-gt-code-element) (optional)

> TBD: This example will show how the high-level structure of a  ``<section>`` element might look.

### `<group>` element

Catalogs may use `<group>` elements to reference related controls or control groups. `<group>` elements may have their own properties, statements, parameters, and references, which are inherited by all members of the group. Unlike `<section>` elements, `<group>` elements may not contain arbitrary prose. A `<group>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* [`<param>`](#code-lt-param-gt-code-element), [`<link>`](#code-lt-link-gt-code-element), [`<prop>`](#code-lt-prop-gt-code-element), and/or [`<part>`](#code-lt-part-gt-code-element) (zero or more of each)
* `<group>` or [`<control>`](#code-lt-control-gt-code-element) (one or more total)
* [`<references>`](#code-lt-references-gt-code-element) (optional)

> This example shows how the high-level structure of a ``<group>`` element might look. Note that this example omits the optional ``@id`` attribute while including the optional ``@class`` attribute and ``<title>`` element. The only other element this example contains is ``<control>``, which is shown in more detail below.

```xml
<group class="family">
   <title>Miscellaneous Protection</title>
   <control class="MP001" id="mp-1">
      ...
   </control>
</group>
```

### `<control>` element

Each security or privacy control within the catalog is defined by a `<control>` element. A `<control>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* [`<param>`](#code-lt-param-gt-code-element), [`<link>`](#code-lt-link-gt-code-element), [`<prop>`](#code-lt-prop-gt-code-element), [`<part>`](#code-lt-part-gt-code-element), and/or [`<subcontrol>`](#code-lt-subcontrol-gt-code-element) elements (zero or more of each)
* [`<references>`](#code-lt-references-gt-code-element) (optional)

> This example shows how the high-level structure of a ``<control>`` element might look. It leaves out details such as the full contents of the ``<param>`` and ``<part>``elements so you can get a better feel for the structure and top-level elements.

```xml
<control class="MP001" id="mp-1">
   <title>Miscellaneous Security Mode</title>
   <param id="mode">
      <label>organization-selected miscellaneous security mode</label>
   </param>
   ...
   <prop class="name">MP-1</prop>
   <part class="statement">
      <p>The organization:</p>
      <part class="item" id="mp-1-s">
         <prop class="name">MP-1.</prop>
         <p>uses miscellaneous security mode <insert param-id="mode"/>:</p>
      </part>
   </part>
   ...
   <references>
      <link href="#mp001" rel="reference">The Ultimate Miscellaneous Security Guide</link>
   </references>
</control>
```

### `<subcontrol>` element

An OSCAL `<subcontrol>` element is very similar to an OSCAL `<control>` element in its composition. A `<subcontrol>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* [`<param>`](#code-lt-param-gt-code-element), [`<link>`](#code-lt-link-gt-code-element), [`<prop>`](#code-lt-prop-gt-code-element), and/or [`<part>`](#code-lt-part-gt-code-element) (zero or more of each)
* [`<references>`](#code-lt-references-gt-code-element) (optional)

> This example shows excerpts from a possible ``<subcontrol>`` element related to the ``<control>`` element example presented earlier. More details on the various ``<part>`` element classes is presented later.

```xml
<subcontrol class="MP001-A" id="mp-1-A">
   <title>Miscellaneous Security Mode Index</title>
   <prop class="name">MP-1-A</prop>
   <part class="statement">
      <p>The application enforces the use of the designated miscellaneous security mode index.</p>
   </part>
   <part class="guidance">
      <p>This control enhancement ensures that the miscellaneous security mode index is set so that the principle of least functionality is enforced.</p>
      <link href="#qr-13" rel="related"/>
   </part>
   <part class="objective">
      <p>Determine if the system enforces the use of the designated miscellaneous security mode index.</p>
   </part>
   <part class="assessment">
      <prop class="method">EXAMINE</prop>
      <part class="objects">
         <p>Miscellaneous security policy</p>
         <p>System configuration settings</p>
      </part>
   </part>
```

#### `<prop>` element

A `<prop>` element is a value with a name. It is attributed to the containing control, subcontrol, component, part, or group. Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls and parts and extensions), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.

A `<prop>` element may contain the following:

* `@id` (optional)
* text content

> The ``<subcontrol>`` element example also provided two examples of the ``<prop>`` element. They are duplicated here.

```xml
<prop class="name">MP-1-A</prop>

<prop class="method">EXAMINE</prop>
```

#### `<part>` element

A `<part>` element is a partition, piece, or section of a control, subcontrol, component, or part. Generally speaking, `<part>` elements will be of two kinds. Many parts are logical partitions or sections for prose; these may be called "statements" and may be expected to have simple prose contents, even just one paragraph. Other parts may be more formally constructed out of properties (`<prop>` elements) and/or their own parts. Such structured objects (sometimes called "features") may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements"). Since the composition of parts can be constrained using OSCAL declarations (of the items or components to be given in a part or in this type of part), their use for encoding "objects" of arbitrary complexity within controls is effectively open-ended.

A `<part>` element may contain the following:

* `<title>` (optional)
* [`<param>`](#code-lt-param-gt-code-element), [`<link>`](#code-lt-link-gt-code-element), [`<prop>`](#code-lt-prop-gt-code-element), `<part>`, `<p>`, `<ul>`, `<ol>`, and/or `<pre>` (zero or more of each)

> The examples show the use of the ``<part>`` element with five different classes specified: statement, guidance, objective, assessment, and objects. TBD: explain what those five classes mean. The examples also show that a ``<part>`` can have a ``@class`` attribute. TBD: the text above does not list that attribute is an option.

```xml
<part class="statement">
   <p>The application enforces the use of the designated miscellaneous security mode index.</p>
</part>
<part class="guidance">
   <p>This control enhancement ensures that the miscellaneous security mode index is set so that the principle of least functionality is enforced.</p>
   <link href="#qr-13" rel="related"/>
</part>
<part class="objective">
   <p>Determine if the system enforces the use of the designated miscellaneous security mode index.</p>
</part>
<part class="assessment">
   <prop class="method">EXAMINE</prop>
   <part class="objects">
      <p>Miscellaneous security policy</p>
      <p>System configuration settings</p>
   </part>
</part>
```

#### `<link>` element

A `<link>` element is a line or paragraph with a hypertext link. A `<link>` element may contain the following:

* `@rel` (optional)
* `@href` (optional)
* text content, possibly mixed with zero or more of each of the following: `<q>`, `<code>`, `<em>`, `<i>`, `<b>`, `<sub>`, `<sup>`, and/or `<span>`

> The first example shows a simple link that references the ``@id`` of an existing entity within the catalog. If there was a ``<control>`` element with identifier "gr-8", this link would be pointing to it.

```xml
<link href="#gr-8"/>
```

> TBD: add a ``@rel`` example.

#### `<param>` element

A `<param>` element is a parameter setting to be propagated to one or more points of insertion. A `<param>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<desc>` (mandatory)
* `<label>` (optional)
* `<value>` (optional)

> The first example shows the definition of a parameter identified as "abc-123". The ``<desc>`` element TBD, and the ``<label>`` element TBD. In this example, the description and label explain what the ``<value>`` element should contain if it is subsequently set by an OSCAL profile ``<set-param>`` element.

```xml
<param id="abc-123">
   <desc>organization-defined key length</desc>
   <label>organization-defined key length</label>
</param>
```

> The second example shows how the parameter from the first example would be referenced from a statement in the catalog.

```xml
<part class="statement">
    <p class="description">The organization requires a minimum key length of <insert param-id="abc-123"/> bytes.</p>
 </part>
```

> TBD: add a param example with the value and the class set.

### `<references>` element

A `<references>` element contains one or more reference descriptions, each contained within a `<ref>` element. Each `<ref>` element may contain the following:

* `@id` (optional)
* `<std>` (citation of a formal published standard), `<citation>` (citation of a resource), `<p>`, `<ul>`, `<ol>`, and/or `<pre>` (zero or more of each)

> The first example shows the two references for a particular control, each defined using a ``<ref>`` element within the same ``<references>`` element. In this example, both references are citations because they are not formal standards. Each ``<citation>`` includes an ``@href`` specifying the URL for accessing the reference, as well as a string containing a human-readable name for the resource.

```xml
<references>
   <ref>
       <citation href="https://doi.org/10.6028/NIST.SP.800-153">NIST Special Publication 800-153</citation>
   </ref>
   <ref>
       <citation href="https://doi.org/10.6028/NIST.SP.800-179">NIST Special Publication 800-179</citation>
   </ref>
</references>
```

> The second example illustrates usage of the ``@id`` attribute within the ``<ref>`` element. The reference is being assigned the identifier "SP800-153". TBD: how can that ID be used? Do we have an example of the format for a ``<std>`` element we could use here instead of ``<citation>``?

```xml
<references>
   <ref id="SP800-153">
       <citation href="https://doi.org/10.6028/NIST.SP.800-153">NIST Special Publication 800-153</citation>
   </ref>
</references>
```

### `<declarations>` element

A `<declarations>` element is used for extra-schema validation of data given within controls. More information on this will be added to the documentation in the future.
