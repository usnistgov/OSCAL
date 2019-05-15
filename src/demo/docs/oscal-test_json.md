 

## FAKEUP Testing Schema: JSON Schema 

The short name (file identifier) for this schema shall be *oscal-test*. It is used internally when an identifier is called for, and may appear in file names of schema artifacts. urn:fakeup  

A test schema for prototyping and demonstrating the metaschema feature set.  

### **Base**: `kit` object

Wrapper for other stuff

A [kit](#base-kit-object) will appear as 

A [kit](#base-kit-object) object has the following properties:

* String [id](#an-id-id-object)
* String [some_string](#a-string-flag-somestring-object) 
* An array `things` containing [thing](#base-thing-object) data items   

The kit can have all kinds of Things. 

feature set for testing (schemas): enforcement of addressability constraints (distinctiveness of values) 

feature set for conversions: 'succinct JSON'; mapping nodes to element types in collapsed syntax. 

Also to do: find a case of variability in controls and show it off... parts?

```json
{"some_string":"string","things":[{"id":"thing001","some_string":"aha","single-required-field":"Required","single-mixed-field":"Mixed content? *here be content?*"}]}
```
p  

### **Base**: `thing` object

Wrapper for other stuff

A [thing](#base-thing-object) will appear as a data value in an array property.

A [thing](#base-thing-object) object has the following properties:

* String [id](#an-id-id-object)
* String [some_string](#a-string-flag-somestring-object) 
* A [single-required-field](#single-string-required-single-required-field-object) object * (required)*  
* An [acquired-model](#acquired-model-acquired-model-object) object  
* A [single-mixed-field](#single-string-but-with-mixed-content-single-mixed-field-object) object * (required)*  
* An array `plurals` containing [plural-field](#a-single-occurrence-of-a-plural-ha-plural-field-object) data items  
* An array `plurals-mixed` containing [plural-mixed-field](#only-one-plural-but-possibly-mixed-plural-mixed-field-object) data items  
* A [single-chunk](#chunk-single-chunk-object) object  
* An array `chunks-together` containing [chunk-among-chunks](#chunk-among-chunks-chunk-among-chunks-object) data items  
* A choice between  
  * A [vanilla](#one-choice-vanilla-object) object  
  * A [chocolate](#another-choice-chocolate-object) object    

A thing can be whatever: flags, fields of various sorts mixed and not, and assemblies. Also the various sorts of addressing should be demonstrated. The model described should be demonstrated in companion instances (XML and JSON), which can in turn be used as targets for mutual conversion.  

### **Single string (required)**: `single-required-field` object

As it says

`single-required-field` will appear as a string property.

As an explicit property, `single-required-field` appears on [thing](#base-thing-object), [single-chunk](#chunk-single-chunk-object), [chunk-among-chunks](#chunk-among-chunks-chunk-among-chunks-object), [vanilla](#one-choice-vanilla-object) and [chocolate](#another-choice-chocolate-object).

The `single-required-field` object has a property:

* String `STRVALUE`

```json
{"single-required-field":"Required"}
```
p  

### **Acquired Model**: `acquired-model` object

A string field, with mixed content

`acquired-model` will appear as a string property.

The `acquired-model` object has a property:

* String `RICHTEXT` (supports OSCAL markdown) 

Defined in its own module!  

### **Single string but with mixed content**: `single-mixed-field` object

As it says

`single-mixed-field` will appear as a string property.

As an explicit property, `single-mixed-field` appears on [thing](#base-thing-object).

The `single-mixed-field` object has a property:

* String `RICHTEXT` (supports OSCAL markdown) 

### **A single occurrence of a plural (ha)**: `plural-field` object

As it says

`plural-field` will appear as a string property.

The `plural-field` object has a property:

* String `STRVALUE` 

### **Only one plural, but possibly mixed.**: `plural-mixed-field` object

As it says

`plural-mixed-field` will appear as a string property.

The `plural-mixed-field` object has a property:

* String `STRVALUE` 

### **Chunk**: `single-chunk` object

As it says

A [single-chunk](#chunk-single-chunk-object) will appear as a property on an object.

As an explicit property, `single-chunk` appears on [thing](#base-thing-object).

A [single-chunk](#chunk-single-chunk-object) object has the following properties:
 
* A [single-required-field](#single-string-required-single-required-field-object) object * (required)*  
* An array `prose`, containing strings of markdown.  

### **Chunk among chunks**: `chunk-among-chunks` object

As it says

A [chunk-among-chunks](#chunk-among-chunks-chunk-among-chunks-object) will appear as a data value in an array property.

A [chunk-among-chunks](#chunk-among-chunks-chunk-among-chunks-object) object has the following properties:
 
* A [single-required-field](#single-string-required-single-required-field-object) object * (required)*  
* An array `prose`, containing strings of markdown.  

### **One Choice**: `vanilla` object

As it says

A [vanilla](#one-choice-vanilla-object) will appear as a property on an object.

As an explicit property, `vanilla` appears on [thing](#base-thing-object).

A [vanilla](#one-choice-vanilla-object) object has the property
 
* A [single-required-field](#single-string-required-single-required-field-object) object * (required)*   

### **Another Choice**: `chocolate` object

As it says

A [chocolate](#another-choice-chocolate-object) will appear as a property on an object.

As an explicit property, `chocolate` appears on [thing](#base-thing-object).

A [chocolate](#another-choice-chocolate-object) object has the property
 
* A [single-required-field](#single-string-required-single-required-field-object) object * (required)*   

### **A string flag**: `some_string` object 

As it says 

`some_string` will appear as a string property except as noted.

As an explicit property, `some_string` appears on [kit](#base-kit-object) and [thing](#base-thing-object). 

### **An ID**: `id` object 

As it says 

`id` will appear as a string property except as noted.

As an explicit property, `id` appears on [kit](#base-kit-object) and [thing](#base-thing-object). 