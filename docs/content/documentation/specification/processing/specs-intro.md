Profile resolution

These PRELIMINARY specifications describe how to render an OSCAL profile document in the form of an OSCAL catalog. We call this "profile resolution".

These specifications take the form of a tag set mapping between two XML applications, namely the OSCAL profile and OSCAL catalog document models. The same mapping (transformation from source to target) can be effected using other expressions of the OSCAL model such as JSON or YAML object serializations. In these specifications, there will be reference to XML constructs (such as 'element' where some might prefer 'object') and examples using XML syntax: these however are for illustrative purposes only and normative only with respect to the semantic mapping, not the syntax as such. The XML orientation of the specification of this mapping is an expediency; in the longer term we would like to have specifications that are format-agnostic.

In these specs there are references to "source", "target" and "result". "Source" refers sometimes to profile documents as a type (abstractly), and sometimes to instance profiles in operation (particular kinds of sources). "Target" refers to the intended output of the transformation, that is the catalog model as a type or, for particular source instances, particular targets.

"Result", used less frequently, refers to the actual results of transformation, as opposed to the intended or designed results. The aim is that the result always be identical to the target.

Organization

Why resolve a profile as a catalog

A profile is a representation of a delta, a "here to there". As such, a profile might be conceived of as a recipe or set of procedures, whereby to create an OSCAL catalog (set of controls describing security requirements) from an OSCAL catalog (set of controls describing security requirements).

This is because although catalogs - for example, the controls described in NIST SP 800-53 - are published, available for use, and even standardized, they can never be used exactly in the form in which they are acquired. They must be taken from the packaging and placed into operational context before they mean anything. This typically requires a few operations over "raw catalogs" be supported. We must be able to select controls; we must be able to arrange them in order (or not); and we must be able to condition them by setting parameters defined for them and making adjustments to them. 

By representing the steps by which a base catalog can be sliced, sifted, amended and edited, into a (nominally) "finished" set of control requirements, a profile makes it easier to codify and preserve even very temporary local revisions of a control catalog. Once expressed as a profile in OSCAL syntax, that is, a set of emendations to a catalog can be managed entirely separately and independently from the catalog.

This separation of concerns - between the originating catalog authors - who describe policy in only general terms - and the authors of the "user manual" catalog - who must describe policy in very particular and local terms - is a necessary factor in supporting sustainable processes with the potential for automation and process improvement.

In order for this to work however we need a process that can perform the necessary operations, to derive the local view of the catalog, from the catalog unmodified. This is profile resolution.

source profile format - walk through

Metadata
Body
Back Matter

For input X, result Y

target catalog format -
  variants
    flat
    as-is from single catalog
    custom

Tools We Would Like To Have
- Profile generator - as delta btw two catalog instances
- Profile validator(s)
  - static detection of control clashes, etc
    

