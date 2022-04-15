## Profile Resolver Pipeline

Profile resolution is implemented here as a sequence of XSLT transformations. The sequence applies to defined inputs (a **source profile** with imported **catalog** sources) and produces defined outputs (a **profile resolution result** in the form of a catalog). The word **baseline** also refers to a particular profile in application, whether in its unprocessed form or its resolved, serialized form.

The sequence of XSLT transformations reflects and roughly corresponds to the steps in profile resolution described for OSCAL in the [Profile Resolution Specification](https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/):

- **selection**: importing catalogs or profiles, and selecting controls from them

- **organization (merging)**: organizing the selected controls for the output representation

- **modification**: setting parameters and potentially supplementing, amending or editing control text

### Tests for this Implementation

The `testing/*` folders contain XSpec tests that indicate expected interim results of each XSLT transformation in the sequence.

Note that these interim results are *not necessarily valid to any OSCAL schema*, although they are quite close to OSCAL profile and catalog syntax.

The files in `testing/*` are only for this implementation. Implementation-independent tests and sample files for profile resolution are [with the specification](../../../specifications/profile-resolution).

### Invoking the XSLT

Use a recent version of Saxon for best results &#8212; although we would also be *very interested* to hear from users of other XSLT engines conformant to the 3.1 family of XML standards (XSLT/XPath/XDM/XQuery).

The entry point for the transformation pipeline is `oscal-profile-RESOLVE.xsl`, which invokes the transformation steps in sequence, taking the source profile document as primary input. Load Saxon with your document and this stylesheet as follows (for example):

```bash
>  java -cp saxon-he-10.0.jar net.sf.saxon.Transform -t -s:YOUR_PROFILE_DOCUMENT.xml -xsl:path/to/oscal-profile-RESOLVE.xsl -o:YOUR_RESULT_BASELINE.xml
```

You can optionally set one or more of the parameters listed in the following table, using syntax `name=value` at the end of the command above. The sequence of parameters is not significant.

For example,
```bash
>  java -cp saxon-he-10.0.jar net.sf.saxon.Transform -t -s:YOUR_PROFILE_DOCUMENT.xml -xsl:path/to/oscal-profile-RESOLVE.xsl -o:YOUR_RESULT_BASELINE.xml uuid-method=random-xslt hide-source-profile-uri=true
```
| Name  | Description  | Default  |
|---|---|---|
| `hide-source-profile-uri` | If `true`, the output catalog's metadata does not record the source profile's URI.  | `false` |
| `path-to-source`  | Path from output catalog to location of source profile. | None |
| `top-uuid` | UUID value for top-level element in output catalog, if `uuid-method` is `user-provided`. | None |
| `uuid-method` | Method for computing UUID of top-level element in output catalog. Valid values are: `random-xslt`, in which case the `random-number-generator` XPath function must be available; `random-java`, in which case the `java.util.UUID.randomUUID()` Java method must be available; `user-provided`, in which case you must specify the `top-uuid` parameter; `web-service`, referring to the `uuid-service` parameter value; and `fixed`. | `fixed`|
| `uuid-service` | URI for a web service that produces a UUID, if `uuid-method` is `web-service`.| `https://www.uuidgenerator.net/api/version4`|

Alternatively, set up the bindings in an IDE or programming environment that has XSLT 3.1 support.

Note that URIs (addresses) given in a profile document must link correctly as absolute or relative paths to their imported catalogs, as demonstrated in [examples](../../../specifications/profile-resolution/profile-resolution-examples).

A serialized output of profile resolution takes the form of an OSCAL catalog. Assuming inputs are correctly formed, the output is valid to the catalog schema.
