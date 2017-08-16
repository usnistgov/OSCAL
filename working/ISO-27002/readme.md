# ISO 27002

## Converting ISO 27002 into OSCAL

### Extraction

Sections of ISO 27002 are systematic enough in their EPUB format for automated conversion via XSLT, with reasonable results, into OSCAL.

The stylesheet is designed to run on HTML extracted from the EPUB published version of the standard. In order to respect IP use restrictions of this document, significant contents are masked in the result.

Run the XSLT `Convert-ISO-epub-to-OSCAL.xsl` over the source file to produce OSCAL. The source file will be HTML discovered in the published EPUB of the ISO 27002 standard, modified as necessary for XML well-formedness.

### Enhancement

Over the (OSCAL) results of this transformation, run an additional transformation (`Enhance-iso-27002.xsl`) to induce internal links and perform adjustments.

Functionality of enhancement XSLT (but double check in case this is out of date):

* Adds `@id` to controls and subcontrols
* Adds `@href` for internal cross-references to `a` elements when the target is given in the file
  
Asumes all controls and subcontrols have a `prop[@class='number']` (which is used to produce an ID).

## Also in this subdirectory

There may be relics of analysis and post-processing of this resource.
  