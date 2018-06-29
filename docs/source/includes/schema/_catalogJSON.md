 

## OSCAL Control Catalog Format: JSON Schema 

The short name (file identifier) for this schema shall be oscal-catalog. It is used internally when an identifier is called for, and may appear in file names of schema artifacts.  

The OSCAL Control Catalog format can be used to describe a collection of security controls and related sub-controls, along with a variety of control metadata. The root of the Control Catalog format is [catalog](#catalog-catalog-object). 

An XML Schema is provided for the OSCAL Catalog XML model.  

### Catalog: `catalog` object

A collection of controls

A [catalog](#catalog-catalog-object) will appear as an object, a property of the root object.

A [catalog](#catalog-catalog-object) object has the following properties:

* String [id](#id--identifier-id-object)
* String [model-version](#model-version-model-version-object) 
* A [title](#title-title-object) object  (required)  
* A [declarations](#declarations-declarations-object) object  
* A [references](#references-references-object) object  
* An array `sections` containing [section](#section-section-object) data items  
* A choice between  
  * An array `groups` containing [group](#control-group-group-object) data items  
  * An array `controls` containing [control](#control-control-object) data items    

Catalogs may use [section](#section-section-object) to subdivide the textual contents of a catalog. 

```
<description>A small catalog with a single control</description>
<catalog id="simple-example" model-version="0.99">
  <title>A Miniature Catalog</title>
  <control id="single">
    <title>A Single Control</title>
  </control>
</catalog>
```
 

### Declarations: `declarations` object

Either a reference to a declarations file, or a set of declarations

A [declarations](#declarations-declarations-object) will appear as a property on an object.

As an explicit property, `declarations` appears on [catalog](#catalog-catalog-object).

The `declarations` object has a property:

* String [href](#hypertext-reference-href-object) 

### Section: `section` object

Allows the inclusion of prose content within a Catalog.

A [section](#section-section-object) will appear as a data value in an array property.

A [section](#section-section-object) object has the following properties:

* String [id](#id--identifier-id-object)
* String [class](#class-class-object) 
* A [title](#title-title-object) object  (required)  
* An array `prose`, containing strings of markdown. 
* An array `sections` containing [section](#section-section-object) data items  
* A [references](#references-references-object) object   

### Control Group: `group` object

A group of controls, or of groups of controls.

A [group](#control-group-group-object) will appear as a data value in an array property.

A [group](#control-group-group-object) object has the following properties:

* String [id](#id--identifier-id-object)
* String [class](#class-class-object) 
* A [title](#title-title-object) object  (required)  
* An array `params` containing [param](#parameter-param-object) data items  
* An array `props` containing [prop](#property-prop-object) data items  
* An array `parts` containing [part](#part-part-object) data items  
* A choice between  
  * An array `groups` containing [group](#control-group-group-object) data items  
  * An array `controls` containing [control](#control-control-object) data items   
* A [references](#references-references-object) object   

Catalogs can use groups to provide collections of related controls or Control Groups. A `group` may have its own properties, statements, parameters, and references, which are inherited by all members of that group. Unlike a [section](#section-section-object), a `group` may not contain arbitrary prose directly, only inside its [part](#part-part-object) or [control](#control-control-object) components. 

```
<group id="xyz">
  <title>My Group</title>
  <prop class="required">some property</prop>
  <control id="xyz1">
    <title>Control</title>
  </control>
</group>
```
 

### Control: `control` object

A structured information object representing a security or privacy control. Each security or privacy control within the Catalog is defined by a distinct control instance.

A [control](#control-control-object) will appear as a data value in an array property.

A [control](#control-control-object) object has the following properties:

* String [id](#id--identifier-id-object)
* String [class](#class-class-object) 
* A [title](#title-title-object) object  (required)  
* An array `params` containing [param](#parameter-param-object) data items  
* An array `props` containing [prop](#property-prop-object) data items  
* An array `links` containing [link](#link-link-object) data items  
* An array `parts` containing [part](#part-part-object) data items  
* An array `subcontrols` containing [subcontrol](#sub-control-subcontrol-object) data items  
* A [references](#references-references-object) object   

Controls may be grouped using [group](#control-group-group-object), and controls may be partitioned using [part](#part-part-object) or enhanced using [subcontrol](#sub-control-subcontrol-object). 

```
<control id="x">
  <title>Control 1</title>
</control>
```
 

### Sub-Control: `subcontrol` object

A control extension or enhancement

A [subcontrol](#sub-control-subcontrol-object) will appear as a data value in an array property.

A [subcontrol](#sub-control-subcontrol-object) object has the following properties:

* String [class](#class-class-object) 
* A [title](#title-title-object) object  (required)  
* An array `params` containing [param](#parameter-param-object) data items  
* An array `props` containing [prop](#property-prop-object) data items  
* An array `links` containing [link](#link-link-object) data items  
* An array `parts` containing [part](#part-part-object) data items  
* A [references](#references-references-object) object   

### Title: `title` object

A title for display and navigation, exclusive of more specific properties

`title` will appear as a string property.

As an explicit property, `title` appears on [catalog](#catalog-catalog-object), [section](#section-section-object), [group](#control-group-group-object), [control](#control-control-object), [subcontrol](#sub-control-subcontrol-object) and [part](#part-part-object).

The `title` object has a property:

* String `RICHTEXT` (supports OSCAL markdown) 

### Property: `prop` object

A value with a name, attributed to the containing control, subcontrol, part, or group.

A [prop](#property-prop-object) will appear as a (labeled) property of an object `props`.

The `prop` object has properties:

* String [id](#id--identifier-id-object)
* String [class](#class-class-object)
* String `STRVALUE` 

Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls, parts, and extensions), for any purpose useful to an application or implementation of those controls. Typically, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities. 

The value of a property is a simple scalar value or list of values. 

The lexical composition of properties may be constrained by declarations including matching to regular expressions or by declaring a known datatype. 

Because properties are often used as selectors or identifiers for OSCAL operations, their values can be expected frequently to be normalized (e.g., with respect to whitespace) in use; however, this is application defined. 

For singletons (that is, the only element among siblings with its [class](#class-class-object)), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf `declare-prop` in the declarations model (which also supports other constraints over property values). 

```
<o:prop class="name">A1</o:prop>
```
 

### Parameter: `param` object

Parameters provide a mechanism for the dynamic assignment of value(s) in a control.

A [param](#parameter-param-object) will appear as a (labeled) property of an object `params`.

A [param](#parameter-param-object) object has the following properties:

* String [class](#class-class-object)
* String [depends-on](#depends-on-depends-on-object) 
* A [label](#parameter-label-label-object) object : A short name for the parameter. The label value should be suitable for inline display in a rendered catalog.  
* An array `descriptions` containing [desc](#parameter-description-desc-object) data items : A short summary of the parameter's intended use. A label is optional, but should be provided unless a [select](#selection-select-object) (selection) is provided. 
* An array `constraints` containing [constraint](#constraint-constraint-object) data items : A rule describing the permissible parameter values. Currently, OSCAL does not standardize any formal rules language for value constraints. A [test](#constraint-test-test-object) option may be used to specify a formal rule that may be automatically used if recognized by an OSCAL tool. Further development is needed to support the declaration of a rule language and value.  
* An array `guidance` containing [guideline](#guideline-guideline-object) data items : Additional recommendations for the use of the parameter, or around what values should be provided. 
* A choice between  
  * A [value](#value-constraint-value-object) object : A recommended parameter value or set of values. A value provided in a catalog can be redefined at any higher layer of OSCAL (e.g., Profile).  
  * A [select](#selection-select-object) object : A set of parameter value choices, that may be picked from to set the parameter value. .   
* An array `links` containing [link](#link-link-object) data items :   

In a catalog, a parameter is typically used as a placeholder for the future assignment of a parameter value, although the OSCAL model allows for the direct assignment of a value if desired by the control author. The [value](#value-constraint-value-object) may be optionally used to specify one or more values. If no value is provided, then it is expected that the value will be provided at the Profile or Implementation layer. 

A parameter can include a variety of metadata options that support the future solicitation of one or more values. A [label](#parameter-label-label-object) provides a textual placeholder that can be used in a tool to solicit parameter value input, or to display in catalog documentation. The [desc](#parameter-description-desc-object) provides a short description of what the parameter is used for, which can be used in tooling to help a user understand how to use the parameter. A [constraint](#constraint-constraint-object) can be used to provide criteria for the allowed values. A [guideline](#guideline-guideline-object) provides a recommendation for the use of a parameter.  

### Parameter label: `label` object

A placeholder for a missing value, in display.

`label` will appear as a string property.

As an explicit property, `label` appears on [param](#parameter-param-object).

The `label` object has a property:

* String `RICHTEXT` (supports OSCAL markdown) 

### Parameter description: `desc` object

Indicates and explains the purpose and use of a parameter

A [desc](#parameter-description-desc-object) will appear as a (labeled) property of an object `descriptions`.

The `desc` object has properties:

* String [id](#id--identifier-id-object)
* String `RICHTEXT` (supports OSCAL markdown) 

### Constraint: `constraint` object

A formal or informal expression of a constraint or test

A [constraint](#constraint-constraint-object) will appear as a (labeled) property of an object `constraints`.

The `constraint` object has properties:

* String [test](#constraint-test-test-object)
* String `STRVALUE` 

### Guideline: `guideline` object

A prose statement that provides a recommendation for the use of a parameter.

A [guideline](#guideline-guideline-object) will appear as a (labeled) property of an object `guidance`.

A [guideline](#guideline-guideline-object) object has the following properties:
 
* An array `prose`, containing strings of markdown.  

### Value constraint: `value` object

Indicates a permissible value for a parameter or property

`value` will appear as a string property.

As an explicit property, `value` appears on [param](#parameter-param-object).

The `value` object has a property:

* String `RICHTEXT` (supports OSCAL markdown) 

In a declaration, `value` will commonly be given in groups, indicating a set of enumerated permissible values (i.e., for an element to be valid to a value constraint, it must equal one of the given values). 

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".  

### Selection: `select` object

Presenting a choice among alternatives

A [select](#selection-select-object) will appear as a property on an object.

As an explicit property, `select` appears on [param](#parameter-param-object).

A [select](#selection-select-object) object has the following properties:

* String [how-many](#cardinality-how-many-object) 
* An array `alternatives` containing [choice](#choice-choice-object) data items   

### Choice: `choice` object

A value selection among several such options

`choice` will appear as a string property.

The `choice` object has a property:

* String `RICHTEXT` (supports OSCAL markdown) 

### Part: `part` object

A partition or component of a control, subcontrol or part

A [part](#part-part-object) will appear as a (labeled) property of an object `parts`.

A [part](#part-part-object) object has the following properties:

* String [id](#id--identifier-id-object)
* String [class](#class-class-object) 
* A [title](#title-title-object) object  
* An array `props` containing [prop](#property-prop-object) data items  
* An array `prose`, containing strings of markdown. 
* An array `parts` containing [part](#part-part-object) data items  
* An array `links` containing [link](#link-link-object) data items   

Like properties ([prop](#property-prop-object)) and parameters ([param](#parameter-param-object)), parts can be distinguished from other elements within their controls by their assigned [class](#class-class-object), such that they may be subjected to "declarations logic" using these values as bindings (and thereby getting open-ended extensibility). 

An assigned class may frequently provide for a header in display, such that `part``[@class='objectives']` is displayed under a header *Objectives*, etc. Parts may also however have their own titles ([title](#title-title-object) elements). 

Many parts are logical partitions or sections for prose. Other parts may be more formally constructed out of properties ([prop](#property-prop-object) elements) and/or their own parts. Such structured objects may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements").  

### Link: `link` object

 A line or paragraph with a hypertext link 

A [link](#link-link-object) will appear as a (labeled) property of an object `links`.

The `link` object has properties:

* String [href](#hypertext-reference-href-object)
* String [rel](#relation-rel-object)
* String `RICHTEXT` (supports OSCAL markdown) 

Works like an HTML anchor (`a`) except this is a line-oriented (block) element.  

### References: `references` object

 A group of reference descriptions 

A [references](#references-references-object) will appear as a property on an object.

As an explicit property, `references` appears on [catalog](#catalog-catalog-object), [section](#section-section-object), [group](#control-group-group-object), [control](#control-control-object) and [subcontrol](#sub-control-subcontrol-object).

A [references](#references-references-object) object has the following properties:

* String [id](#id--identifier-id-object) 
* An array `links` containing [link](#link-link-object) data items  
* An array `refs` containing [ref](#reference-ref-object) data items   

### Reference: `ref` object

 A reference, with one or more citations to standards, related documents, or other resources 

A [ref](#reference-ref-object) will appear as a data value in an array property.

A [ref](#reference-ref-object) object has the following properties:

* String [id](#id--identifier-id-object) 
* An array `citations` containing [citation](#citation-citation-object) data items  
* An array `prose`, containing strings of markdown.  

### Citation: `citation` object

Citation of a resource

A [citation](#citation-citation-object) will appear as a data value in an array property.

The `citation` object has properties:

* String [id](#id--identifier-id-object)
* String [href](#hypertext-reference-href-object)
* String `RICHTEXT` (supports OSCAL markdown) 

Semantics of any contents within citation are implicit, not encoded. To mitigate problems establishin matches with bibliograpical databases, it is recommended a canonical identifier such as a DOI be provided for any citation. 

```
<o:citation>Some <o:strong>citation</o:strong> of some sort</o:citation>
```
 

### ID / identifier: `id` object 

Unique identifier  

No mechanism is proposed to ensure that `id` values do not collide across different catalogs. Use profiling without "merge" to detect such clashes.  

```
<o:citation id="xyz2">Some <o:strong>citation</o:strong> of some sort</o:citation>
```
 

`id` will appear as a string property except as noted.

 This value is given implicitly as the label of a property [subcontrol](#sub-control-subcontrol-object) (on object `subcontrols`) or [param](#parameter-param-object) (on object `params`). The property name (label) value is taken to be its [id](#id--identifier-id-object).

As an explicit property, `id` appears on [catalog](#catalog-catalog-object), [section](#section-section-object), [group](#control-group-group-object), [control](#control-control-object), [subcontrol](#sub-control-subcontrol-object), [prop](#property-prop-object), [param](#parameter-param-object), [desc](#parameter-description-desc-object), [part](#part-part-object), [references](#references-references-object), [ref](#reference-ref-object) and [citation](#citation-citation-object). 

### Class: `class` object 

Identifies the property or object within the control; a semantic hint  

Overloading this attribute with more than one value is permitted, but not recommended.  

`class` will appear as a string property except as noted.

As an explicit property, `class` appears on [section](#section-section-object), [group](#control-group-group-object), [control](#control-control-object), [subcontrol](#sub-control-subcontrol-object), [prop](#property-prop-object), [param](#parameter-param-object) and [part](#part-part-object). 

### hypertext reference: `href` object 

A link to a document or document fragment (actual, nominal or projected)  

Note in particular that `href` targets include elements (locations) in representations of documents that exist only by virtue of dynamic application, such as (for example) the results of profile resolution.  

`href` will appear as a string property except as noted.

As an explicit property, `href` appears on [declarations](#declarations-declarations-object), [link](#link-link-object) and [citation](#citation-citation-object). 

### Constraint test: `test` object 

A formal (executable) expression of a constraint 

`test` will appear as a string property except as noted.

As an explicit property, `test` appears on [constraint](#constraint-constraint-object). 

### Relation: `rel` object 

Purpose of the link 

`rel` will appear as a string property except as noted.

As an explicit property, `rel` appears on [link](#link-link-object). 

### Cardinality: `how-many` object 

When selecting, a requirement such as one or more 

`how-many` will appear as a string property except as noted.

As an explicit property, `how-many` appears on [select](#selection-select-object). 

### Depends on: `depends-on` object 

Another parameter invoking this one 

`depends-on` will appear as a string property except as noted.

As an explicit property, `depends-on` appears on [param](#parameter-param-object). 

### Model version: `model-version` object 

Declares a major/minor version for this metaschema 

`model-version` will appear as a string property except as noted.

As an explicit property, `model-version` appears on [catalog](#catalog-catalog-object). 