 

# OSCAL Control Catalog Schema 

## Define assembly `catalog` (group as `control-catalog`)

Supports (optionally) an id flag 

#### [Formal name] Catalog 

A collection of controls 

#### Contents (in order):
 
* A [title](#define-field-title) (required) 
* A [declarations](#define-field-declarations) 
* A [references](#define-assembly-references) 
* Any number of `sections`, named [section](#define-assembly-section-group-as-sections) 
* A choice between  
  * Any number of `groups`, named [group](#define-assembly-group-group-as-groups) 
  * Any number of `controls`, named [control](#define-assembly-control-group-as-controls)   

#### Example

```
<catalog>
  <title>A Miniature Catalog</title>
  <control id="single">
    <title>A Single Control</title>
  </control>
</catalog>
```

  

## Define field `declarations` 

Supports flag [href](#define-flag-href-nominal-data-type-anyuri) (nominal data type `anyURI`) 

#### [Formal name] Declarations 

Either a reference to a declarations file, or a set of declarations  

## Define assembly `section` (group as `sections`)

Supports (optionally) an id flag 

Supports flag [class](#define-flag-class-nominal-data-type-nmtoken) 

#### [Formal name] Section 

Prose content, unstructured except as sections, set apart from controls or control groups 

#### Contents (in order):
 
* A [title](#define-field-title) (required) Prose contents 
* Any number of `sections`, named [section](#define-assembly-section-group-as-sections) 
* A [references](#define-assembly-references)   

## Define assembly `group` (group as `groups`)

Supports (optionally) an id flag 

Supports flag [class](#define-flag-class-nominal-data-type-nmtoken) 

#### [Formal name] Control group 

A group of controls, or of groups of controls 

#### Contents (in order):
 
* A [title](#define-field-title) (required) 
* Any number of `params`, named [param](#define-assembly-param-group-as-params) 
* Any number of `props`, named [prop](#define-field-prop-group-as-props) 
* Any number of `parts`, named [part](#define-assembly-part-group-as-parts) 
* A choice between  
  * Any number of `groups`, named [group](#define-assembly-group-group-as-groups) 
  * Any number of `controls`, named [control](#define-assembly-control-group-as-controls)  
* A [references](#define-assembly-references)  

#### Example

```
<group id="xyz">
  <title>My Group</title>
  <prop class="required">some property</prop>
  <control id="xyz1">
    <title>Control</title>
  </control>
</group>
```

  

## Define assembly `control` (group as `controls`) 

Supports flag [id](#define-flag-id-nominal-data-type-id) (nominal data type `ID`) (required) 

Supports flag [class](#define-flag-class-nominal-data-type-nmtoken) 

#### [Formal name] Control 

A structured information object representing a security control 

#### Remarks 

Controls may be grouped using [group](#define-assembly-group-group-as-groups), and controls may be partitioned using [part](#define-assembly-part-group-as-parts) or extended using [subcontrol](#define-assembly-subcontrol-group-as-subcontrols).  

#### Contents (in order):
 
* A [title](#define-field-title) (required) 
* Any number of `params`, named [param](#define-assembly-param-group-as-params) 
* Any number of `props`, named [prop](#define-field-prop-group-as-props) 
* Any number of `links`, named [link](#define-field-link-group-as-links) 
* Any number of `parts`, named [part](#define-assembly-part-group-as-parts) 
* Any number of `subcontrols`, named [subcontrol](#define-assembly-subcontrol-group-as-subcontrols) 
* A [references](#define-assembly-references)  

#### Example

```
<control id="x">
  <title>Control 1</title>
</control>
```

  

## Define assembly `subcontrol` (group as `subcontrols`)

Flag [id](#define-flag-id-nominal-data-type-id) is required 

Supports flag [class](#define-flag-class-nominal-data-type-nmtoken) 

#### [Formal name] Subcontrol 

A control extension or enhancement 

#### Contents (in order):
 
* A [title](#define-field-title) (required) 
* Any number of `params`, named [param](#define-assembly-param-group-as-params) 
* Any number of `props`, named [prop](#define-field-prop-group-as-props) 
* Any number of `links`, named [link](#define-field-link-group-as-links) 
* Any number of `parts`, named [part](#define-assembly-part-group-as-parts) 
* A [references](#define-assembly-references)   

## Define field `title`

Supports inline encoding 

#### [Formal name] Title 

A title for display and navigation, exclusive of more specific properties  

## Define field `prop` (group as `props`)

Supports (optionally) an id flag 

Supports flag [class](#define-flag-class-nominal-data-type-nmtoken) (required) 

#### [Formal name] Property 

A value with a name, attributed to the containing control, subcontrol, part, or group 

#### Remarks 

The notation used by a property is up to an application; otherwise, properties are distinguished in OSCAL by not permitting inline markup of any kind. They are expected to be simple scalar values or to use machine-readable/parseable notation (not XML), as defined by and for an application. 

The lexical composition of properties may be constrained by declarations including matching to regular expressions or declaring known datatype notations. 

Because properties are often used as selectors or identifiers for OSCAL operations, their values can be expected frequently to be normalized (e.g., with respect to whitespace) in use; however, this is application defined. 

For singletons (that is, the only element among siblings with its `@class`), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf `declare-prop` in the declarations model (which also supports other constraints over property values). 

Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls and parts and extensions), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.  

#### Example

```
<o:prop class="name">A1</o:prop>
```

  

## Define assembly `param` (group as `params`)

Flag [id](#define-flag-id-nominal-data-type-id) is required 

Supports flag [class](#define-flag-class-nominal-data-type-nmtoken) 

Supports flag [depends-on](#define-flag-depends-on-nominal-data-type-idref) (nominal data type `IDREF`) 

#### [Formal name] Parameter 

 A parameter setting, to be propagated to points of insertion  

#### Contents (in order):
 
* A [label](#define-field-label) 
* Any number of `descriptions`, named [desc](#define-field-desc-group-as-descriptions) 
* Any number of `constraints`, named [constraint](#define-field-constraint-group-as-constraints) 
* A choice between  
  * A [value](#define-field-value) 
  * A [select](#define-assembly-select)  
* Any number of `links`, named [link](#define-field-link-group-as-links) 
* Any number of `parts`, named [part](#define-assembly-part-group-as-parts)   

## Define field `label`

Supports inline encoding 

#### [Formal name] Parameter label 

 A placeholder for a missing value, in display   

## Define field `desc` (group as `descriptions`)

Supports inline encoding 

#### [Formal name] Parameter description 

Indicates and explains the purpose and use of a parameter  

## Define field `constraint` (group as `constraints`)

Supports (optionally) an id flag 

Supports flag [test](#define-flag-test-nominal-data-type-string) 

#### [Formal name] Constraint 

A formal or informal expression of a constraint or test  

## Define field `value`

Supports inline encoding 

#### [Formal name] Value constraint 

Indicates a permissible value for a parameter or property 

#### Remarks 

In a declaration, [value](#define-field-value) will commonly be given in groups, indicating a set of enumerated permissible values (i.e., for an element to be valid to a value constraint, it must equal one of the given values). 

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".   

## Define assembly `select`

Supports (optionally) an id flag 

Supports flag [how-many](#define-flag-how-many-nominal-data-type-string) 

#### [Formal name] Selection 

Presenting a choice among alternatives 

#### Contents :
 
* Any number of `alternatives`, named [choice](#define-field-choice-group-as-alternatives)   

## Define field `choice` (group as `alternatives`)

Supports inline encoding

Supports (optionally) an id flag 

#### [Formal name] Choice 

A value selection among several such options  

## Define assembly `part` (group as `parts`)

Supports (optionally) an id flag 

Supports flag [class](#define-flag-class-nominal-data-type-nmtoken) 

#### [Formal name] Part 

A partition or component of a control, subcontrol or part 

#### Remarks 

Like properties ([prop](#define-field-prop-group-as-props)) and parameters ([param](#define-assembly-param-group-as-params)), parts can be distinguished from other elements within their controls by their assigned `@class`, such that they may be subjected to "declarations logic" using these values as bindings (and thereby getting open-ended extensibility). 

An assigned class may frequently provide for a header in display, such that `part[@class='objectives']` is displayed under a header *Objectives*, etc. Parts may also however have their own titles ([title](#define-field-title) elements). 

Many parts are logical partitions or sections for prose. Other parts may be more formally constructed out of properties ([prop](#define-field-prop-group-as-props) elements) and/or their own parts. Such structured objects may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements").  

#### Contents (in order):
 
* A [title](#define-field-title) 
* Any number of `props`, named [prop](#define-field-prop-group-as-props) Prose contents 
* Any number of `parts`, named [part](#define-assembly-part-group-as-parts) 
* Any number of `links`, named [link](#define-field-link-group-as-links)   

## Define field `link` (group as `links`)

Supports inline encoding

Supports (optionally) an id flag 

Supports flag [href](#define-flag-href-nominal-data-type-anyuri) (nominal data type `anyURI`) 

Supports flag [rel](#define-flag-rel-nominal-data-type-ncname) (nominal data type `NCName`) 

#### [Formal name] Link 

 A line or paragraph with a hypertext link  

#### Remarks 

Works like an HTML anchor (`a`) except this is a line-oriented (block) element.   

## Define assembly `references`

Supports (optionally) an id flag 

#### [Formal name] References 

 A group of reference descriptions  

#### Contents (in order):
 
* Any number of `links`, named [link](#define-field-link-group-as-links) 
* Any number of `refs`, named [ref](#define-assembly-ref-group-as-refs)   

## Define assembly `ref` (group as `refs`)

Supports (optionally) an id flag 

#### [Formal name] Reference 

 A reference, with one or more citations to standards, related documents, or other resources  

#### Contents (in order):
 
* Any number of `citations`, named [citation](#define-field-citation-group-as-citations) Prose contents   

## Define field `citation` (group as `citations`)

Supports inline encoding

Supports (optionally) an id flag 

Supports flag [href](#define-flag-href-nominal-data-type-anyuri) (nominal data type `anyURI`) 

#### [Formal name] Citation 

Citation of a resource 

#### Remarks 

Echoes the NISO JATS (and NISO STS) `mixed-citation` element.  

#### Example

```
<o:citation>Some <o:strong>citation</o:strong> of some sort</o:citation>
```

  

## Define flag `id` (nominal data type `ID`) 

#### [Formal name] ID / identifier 

Unique identifier 

#### Remarks 

No mechanism is proposed to ensure that `@id` values do not collide across different catalogs. Use profiling without "merge" to detect such clashes.  

#### Example

```
<o:citation id="xyz2">Some <o:strong>citation</o:strong> of some sort</o:citation>
```

  

## Define flag `class` (nominal data type `NMTOKEN`) 

#### [Formal name] Class 

Identifies the property or object within the control; a semantic hint 

#### Remarks 

Overloading this attribute with more than one value is permitted, but not recommended.   

## Define flag `href` (nominal data type `anyURI`) 

#### [Formal name] hypertext reference 

A link to a document or document fragment (actual, nominal or projected) 

#### Remarks 

Note in particular that `@href` targets include elements (locations) in representations of documents that exist only by virtue of dynamic application, such as (for example) the results of profile resolution.   

## Define flag `test` (nominal data type `string`) 

#### [Formal name] Constraint test 

A formal (executable) expression of a constraint  

## Define flag `rel` (nominal data type `NCName`) 

#### [Formal name] Relation 

Purpose of the link  

## Define flag `how-many` (nominal data type `string`) 

#### [Formal name] Cardinality 

When selecting, a requirement such as one or more  

## Define flag `depends-on` (nominal data type `IDREF`) 

#### [Formal name] Depends on 

Another parameter invoking this one  