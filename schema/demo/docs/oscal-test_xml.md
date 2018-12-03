

## FAKEUP Testing Schema: XML Schema

The short name (file identifier) for this schema shall be *oscal-test*. It is used internally when an identifier is called for, and may appear in file names of schema artifacts.urn:fakeup

A test schema for prototyping and demonstrating the metaschema feature set.

### **Base**: `<kit>` element

Wrapper for other stuff

The `<kit>` element has the following contents :

* Attribute [@id](#an-id-id-attribute)* (required)*
* Attribute [@some_string](#a-string-flag-somestring-attribute)* (required)*
* [&lt;thing>](#base-thing-element) elements (*zero or more*)

The kit can have all kinds of Things.

feature set for testing (schemas): enforcement of addressability constraints (distinctiveness of values)

feature set for conversions: 'succinct JSON'; mapping nodes to element types in collapsed syntax.

Also to do: find a case of variability in controls and show it off... parts?

```xml
<kit some_string="string">
  <thing some_string="aha" id="thing001">
    <single-required-field>Required</single-required-field>
    <single-field>
    </single-field>
    <single-mixed-field>Mixed content? <i>here be content?</i></single-mixed-field>
  </thing>
</kit>
```


### **Base**: `<thing>` element

Wrapper for other stuff

The `<thing>` element has the following contents (in order):

* Attribute [@id](#an-id-id-attribute)* (required)*
* Attribute [@some_string](#a-string-flag-somestring-attribute)* (required)*
* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)
* An [&lt;acquired-model>](#acquired-model-acquired-model-element) element (*zero or one*)
* A [&lt;single-mixed-field>](#single-string-but-with-mixed-content-single-mixed-field-element) element (*one*)
* [&lt;plural-field>](#a-single-occurrence-of-a-plural-ha-plural-field-element) elements (*zero or more*)
* [&lt;plural-mixed-field>](#only-one-plural-but-possibly-mixed-plural-mixed-field-element) elements (*zero or more*)
* A [&lt;single-chunk>](#chunk-single-chunk-element) element (*zero or one*)
* [&lt;chunk-among-chunks>](#chunk-among-chunks-chunk-among-chunks-element) elements (*zero or more*)
* A choice between 
  * A [&lt;vanilla>](#one-choice-vanilla-element) element (*zero or one*)
  * A [&lt;chocolate>](#another-choice-chocolate-element) element (*zero or one*)

A thing can be whatever: flags, fields of various sorts mixed and not, and assemblies. Also the various sorts of addressing should be demonstrated. The model described should be demonstrated in companion instances (XML and JSON), which can in turn be used as targets for mutual conversion.

### **Single string (required)**: `<single-required-field>` element

As it says

```xml
<single-required-field>Required</single-required-field>
```


### **Acquired Model**: `<acquired-model>` element

Supports inline encoding

A string field, with mixed content

Defined in its own module!

```xml
<acquired-model>what's <em>up with this?</em></acquired-model>
```


### **Single string but with mixed content**: `<single-mixed-field>` element

Supports inline encoding

As it says

### **A single occurrence of a plural (ha)**: `<plural-field>` element

As it says

### **Only one plural, but possibly mixed.**: `<plural-mixed-field>` element

As it says

### **Chunk**: `<single-chunk>` element

As it says

The `<single-chunk>` element has the following contents (in order):

* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)
* Prose contents (paragraphs and lists)

### **Chunk among chunks**: `<chunk-among-chunks>` element

As it says

The `<chunk-among-chunks>` element has the following contents (in order):

* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)
* Prose contents (paragraphs and lists)

### **One Choice**: `<vanilla>` element

As it says

The `<vanilla>` element has the following contents :

* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)

### **Another Choice**: `<chocolate>` element

As it says

The `<chocolate>` element has the following contents :

* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)

### **A string flag**: `@some_string` attribute

As it says

### **An ID**: `@id` attribute

As it says