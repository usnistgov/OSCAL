Resolver pipeline

See folder OSCAL/docs/content/documentation/specification/processing for specification and examples.


Resolution is conceived as a sequence of three XSLT transformations to be performed in sequence

on defined inputs for defined outputs

the sequence corresponds to the three steps in profile resolution for OSCAL:

**selection** (importing catalogs or profiles and selecting controls from them)

**organization (merging)** i.e. specifying how selected controls are to be organized in representation

**modification** - setting parameters and potentially amending/editing control text

The expected interim results for test files are kept in the testing/\* folders

Note that these interim results are *not always valid to any OSCAL schema* while at the same time they are quite close to OSCAL profile and catalog syntax.


graph LR

P --> metadata
P --> import1
P --> import2
P --> import3
P --> merge
P --> modify
P --> back-matter

P --> import1--> profile.A1
profile.A1 --> catalog.A
P --> import2 --> catalog.A
P --> import3 
import3 --> catalog.B

graph LR

P --> import1[Selection]--> profile.A1[Selection]
profile.A1 --> catalog.A[CPG from Catalog A]
P --> import2[Selection] --> catalog.A
P --> import3[Selection] 
import3 --> catalog.B[CPG from Catalog B]

graph LR

P[Profile] --> import1[Selection]--> profile.A1[Profile]
profile.A1 --> importA1.1[Selection]
importA1.1 --> catalog.A1[CPG from Catalog A]
P --> import2[Selection] --> catalog.A2[CPG from Catalog A]
P --> import3[Selection] 
import3 --> catalog.B[CPG from Catalog B]

CPG is "controls, parameters and groups" remember parameters can be loose

merging disparate controls with a single origin into an original order is a goal of 'as-is' but can only be achieved if controls have some idea of what a "single origin" is.

Processors can define for themselves what constitutes "document identity" for these purposes, but any of these might serve:
document URI
instance ID
canonical (catalog) ID
document property such as DOI




