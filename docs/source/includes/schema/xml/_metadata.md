

## OSCAL Document Metadata Description: XML Schema

The short name (file identifier) for this schema shall be oscal-metadata. It is used internally when an identifier is called for, and may appear in file names of schema artifacts.

### Link: `<link>` element

 A line or paragraph with a hypertext link 

The `<link>` element has the following contents (in order):

* Attribute [@href](#) (required)
* Attribute [@rel](#relation-rel-attribute) (optional)
* Attribute [@media-type](#media-type-media-type-attribute) (optional)
* A [&lt;title>](#) element (zero or one)
* [&lt;hash>](#) elements (zero or more)

Clashes with the present catalog model for [&lt;link>](#link-link-element), which is a field not an assembly, and has no `title`.

### Relation: `@rel` attribute

Purpose of the link

### Media type: `@media-type` attribute

Describes the media or MIME type of a linked resource