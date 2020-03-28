# OSCAL Utilities

Utilities offered include XSLT stylesheets (XSLT 3.0 for performance/power or XSLT 1.0 to run in a browser); CSS stylesheets; XProc pipelines and (a little) XQuery. Nothing here is authoritative as models are still evolving.

## [author](author)

At present, contains CSS applicable to OSCAL in an authoring environment (such as an XML editor supporting CSS styling)

## [convert](convert)

XSLT transformations for converting XML OSCAL into JSON OSCAL and vice versa. These transformations are machine-written from metaschema inputs. See [metaschema source](../../metaschema) for the metaschema inputs and [metaschema build support](../../../build/metaschema) for the mechanics.

## [lib](lib)

Various and miscellaneous utilities, in various stages of documentation and polish.

## [publish](publish)

Transformations (stylesheets) for converting OSCAL catalogs or (resolved) profiles into published outputs such as HTML and markdown.

## [resolver-pipeline](resolver-pipeline)

An XSLT transformation combining a pipeline of smaller transformations implementing OSCAL profile resolution. This implementation has unit tests for the phases of resolution.


## [resolver-experimental](resolver-experimental)

An experimental XSLT transformation that produces a custom profile resolver XSLT, which is then applied to the original profile to resolve it into its tailored catalog. Experimental and not feature complete (at time of writing).


