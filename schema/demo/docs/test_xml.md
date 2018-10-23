

## FAKEUP Testing Schema: XML Schema

The short name (file identifier) for this schema shall be *oscal-test*. It is used internally when an identifier is called for, and may appear in file names of schema artifacts.

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

### **Base**: `<thing>` element

Wrapper for other stuff

The `<thing>` element has the following contents (in order):

* Attribute [@id](#an-id-id-attribute)* (required)*
* Attribute [@some_string](#a-string-flag-somestring-attribute)* (required)*
* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)
* A [&lt;single-field>](#single-string-single-field-element) element (*zero or one*)
* A [&lt;single-mixed-field>](#single-string-but-with-mixed-content-single-mixed-field-element) element (*one*)
* [&lt;plural-field>](#a-single-occurrence-of-a-plural-ha-plural-field-element) elements (*zero or more*)
* [&lt;plural-mixed-field>](#only-one-plural-but-possibly-mixed-plural-mixed-field-element) elements (*zero or more*)
* A [&lt;single-chunk>](#chunk-single-chunk-element) element (*zero or one*)
* [&lt;chunk-among-chunks>](#chunk-among-chunks-chunk-among-chunks-element) elements (*zero or more*)
* A choice between 
  * A [&lt;tweedledee>](#one-choice-tweedledee-element) element (*zero or one*)
  * A [&lt;tweedledum>](#another-choice-tweedledum-element) element (*zero or one*)

A thing can be whatever: flags, fields of various sorts mixed and not, and assemblies. Also the various sorts of addressing should be demonstrated. The model described should be demonstrated in companion instances (XML and JSON), which can in turn be used as targets for mutual conversion.

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


### **Single string (required)**: `<single-required-field>` element

As it says

> An example in a remote document

```xml
<single-required-field>Required</single-required-field>
```


### **Single string**: `<single-field>` element

As it says

### **Single string but with mixed content**: `<single-mixed-field>` element

Supports inline encoding

As it says

### **A single occurrence of a plural (ha)**: `<plural-field>` element

As it says

### **Only one plural, but possibly mixed.**: `<plural-mixed-field>` element

As it says

### **Chunk**: `<single-chunk>` element

As it says

The `<single-chunk>` element has the following contents :

* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)

### **Chunk among chunks**: `<chunk-among-chunks>` element

As it says

The `<chunk-among-chunks>` element has the following contents :

* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)

### **One Choice**: `<tweedledee>` element

As it says

The `<tweedledee>` element has the following contents :

* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)

### **Another Choice**: `<tweedledum>` element

As it says

The `<tweedledum>` element has the following contents :

* A [&lt;single-required-field>](#single-string-required-single-required-field-element) element (*one*)

### **A string flag**: `@some_string` attribute

As it says

### **An ID**: `@id` attribute

As it says