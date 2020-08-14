## Resolver pipeline

Profile resolution is implemented here as a set of XSLT transformations to be performed in sequence, applied to defined inputs (a **source profile** with imported **catalog** sources) to produce defined outputs (a **profile resolution result** in the form of a catalog). The word **baseline** is also used to refer to a particular profile in application, whether in its unprocessed form or its resolved, serialized form.

The sequence reflects and roughly corresponds to the three steps in profile resolution described for OSCAL in the [Profile Resolution Specification](https://pages.nist.gov/OSCAL/documentation/processing/profile-resolution/):

- **selection** (importing catalogs or profiles and selecting controls from them)

- **organization (merging)** i.e. specifying how selected controls are to be organized in representation

- **modification** - setting parameters and potentially supplementing, amending or editing control text

For demonstration, the expected interim results for test files are kept in the testing/\* folders

Note that these interim results are *not always valid to any OSCAL schema* while at the same time they are quite close to OSCAL profile and catalog syntax.

Testing files for profile resolution in general are kept [with the specification](../../../specifications/profile-resolution). The testing files in this subdirectory are only for this implementation.

### Invoking the XSLT:

Use a recent version of Saxon for best results -- although we would also be *very interested* to hear from users of other XSLT engines conformant to the 3.1 family of XML standards (XSLT/XPath/XDM/XQuery).

The main entry point for the transformation pipeline is the dynamic build XSLT called `oscal-profile-RESOLVE.xsl`, which invokes the core transformation steps in sequence, taking the source profile document as primary input. Load Saxon with your document and this stylesheet as follows (for example):

```bash
>  java -cp saxon-he-10.0.jar net.sf.saxon.Transform -t -s:YOUR_PROFILE_DOCUMENT.xml -xsl:path/to/oscal-profile-RESOLVE.xsl -o:YOUR_RESULT_BASELINE.xml
```

Alternatively, set up the bindings in an IDE or programmed environment that has XSLT 3.1 support.

Note that URIs (addresses) given in a profile document must link correctly as absolute or relative paths to their imported catalogs, as demonstrated in examples.

###

A captured and serialized profile resolution will take the form of an OSCAL catalog, and be valid to the catalog schema for correctly formed inputs.
