To do:

Build out examples
 - catalog (pointing to its source material)
   - w/ pointer to "latest version"
   - also w/ pointer to exact same version online
 - profile 
   - same, plus
   - catalog(s)

A profile showing links
  to catalog (pointing to its source material)
  PDF version (source material) of profile

title: "XYZ"
version-title: "XYZ, revision 4" 

In profiles and other citing documents:

```
<resource rel="self | baseline | catalog | metaschema | documentation" href="path/to/resource">
  <title> ... </title>
  <doc-id type="...">uuid or other identifier for document</doc-id>
  <prop>Any other property or tracking info but see also meta-group
   (mirrors?)
</resource>
```

then in the metadata of any OSCAL document (catalog, profile or other)

```
<mirror media-type="zip | application-xml | json | pdf | text/html

www [media type]"
status="superseding | current | subsumed | superseded">
  <title>...</title> 
  <doc-id>...</doc-id>
  <link>...</link>
  <hash href="link-to-hash">hash</hash>
</mirror>
```



`superseding` points at a "best available, updated" version elsewhere. Even without a hash literal (as the target document may be mutable), it can offer a link expected to deliver a hash, which can then be checked against a delivered resource (allowing for its nominal format).

Needless to say, there should be no expectation that a superseding version must or will be backward compatible; but its existence may be informative.

`current` means that the mirror is the "same version" or release as this file, albeit (possibly) expressed using a different notation, and that they can be compared directly to establish this. "Current" means (nominally) current with the instance and ostensibly "concurring"; so examining what is flagged as "current" is the easiest way for an auditor to see which versions of resources are referenced in an OSCAL artifact.

This kind of mirror can be used both to point to canonical or published versions of resources, and can also relate alternatives e.g. XML/JSON of "the same thing".

NB one of the tasks carried out by a complete conversion btw XML and JSON versions will have to be this bit of metadata patching.

Loading a current zip mirror with a hash is a secure way of acquiring an authorized version of a resource either directly for use or for comparison with files in cache. An XML or JSON version delivered in a zip may then be XML- or JSON-compared reliably with a local copy.

Even without the hash, pointing to XML or JSON mirrors is a convenient way to maintain a verifiable chain of authority.

`aligned` means that the mirror may be consulted as an alternative version or expression (indeed sometimes an authoritative one) of the current version, but that this claim is not practically speaking, checkable by automated means - typically we'll see this for PDF or Word versions: it means "this is the same, but that can't be reliably checked without help".

To declare alignment with Word (or ODT) documents I suggest format="zip" status="aligned".

This is also how an OSCAL version can reference its (non-OSCAL) sources when it is converted.

`subsumed` means that the mirror is a prior version, while the differences are not "significant" and backward compatibility may be expected. Presumably, again, direct comparison of resources can show the details (XML to XML, JSON to JSON or even across format boundaries).

Providing a subsumed mirror with appropriate document-identifiers can be enough to permit resolution (with a warning) to a later/better version of its catalog, when the earlier catalog is listed among the mirrors of the later one as "subsumed".

`superseded` means that the mirror is superseded by the current version, and that the differences are "significant". While this kind of mirror is provided mainly for reference, it also enables forward tracking across versions.

## content handling by format

We'll use media types of the normal sort, i.e. 
application/xml
application/json
application/pdf, application/vnd.openxmlformats-officedocument.wordprocessingml.document
etc

Note that putatively comparable or "the same" XML and JSON versions can be checked against each other, given a metaschema to cast the conversion.

