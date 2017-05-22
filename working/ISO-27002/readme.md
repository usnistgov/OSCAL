# ISO 27002

## OSCAL working/test rendition of ISO 27002 controls

Find the data in file [ISO-27002-OSCAL-refined.xml](ISO-27002-OSCAL-refined.xml).

Note that while the structure has been represented in OSCAL, the main file contents have been obfuscated to protect ISO intellectual property.

## Converting ISO 27002 into OSCAL

As described below, conversion of ISO 27002 controls into OSCAL occurs in two stages.

For convenience, an XProc pipeline is offered that combines the two steps into a single call on an XProc processor such as XML Calabash. The source file should be an XML-well-formed ("tidied") copy of HTML extracted from the published EPUB version of the ISO specification. If you do not have this file, you cannot run this transformation.

XML Calabash can be invoked inside oXygen XML Editor or Developer; use [ISO-27002-extraction.xpl](ISO-27002-extraction.xpl) in an XProc scenario with the necessary bindings. (The XML-wf HTML file must be bound to the `source` port. The results are given on the `final` port.) This is convenient for development/debugging as intermediate results may be inspected without writing them to the file system.

Alternatively, XML Calabash (a Java application) can be run from the command line or via Apache Maven or Gradle. See http://xmlcalabash.com.

Or the two processes can be run separately, in sequence (i.e., run the second XSLT over the results of the first one).

### Extraction

Sections of ISO 27002 (comprising the control descriptions) are systematic enough in their EPUB format for automated conversion via XSLT, with reasonable results, into OSCAL.

The stylesheet is designed to run on HTML extracted from the EPUB published version of the standard. In order to respect IP use restrictions of this document, significant contents are masked in the result.

Run the XSLT [Convert-ISO-epub-to-OSCAL.xsl](Convert-ISO-epub-to-OSCAL.xsl) over the source file to produce OSCAL.

### Enhancement

Over the (OSCAL) results of this transformation, run an additional transformation [Enhance-iso-27002.xsl](Enhance-iso-27002.xsl) to infer internal links and perform adjustments.

Functionality of the enhancement XSLT (but double check in case this is out of date):

* Adds `@id` to controls and subcontrols
* Adds `a[@href]` for internal cross-references when the target can be recognized as a control or subcontrol in the file
  
The XSLT assumes all controls and subcontrols have a `prop[@class='number']` (which is used to produce an ID).

## Also in this subdirectory

There may be relics of analysis and post-processing of this resource.
  
