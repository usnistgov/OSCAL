# Mapping documentation

OSCAL XML documents in this subdirectory describe mappings from published control catalogs into OSCAL. The OSCAL control catalogs themselves are not in this subdirectory: find them (with associated code) in other branches of this repository.

By means of an XSLT 1.0 stylesheet (also included and referenced from the files), these documents, once downloaded, may be opened and displayed in a web browser. TBD are HTML and Markdown renditions of this transformation.

However, as of 2017-08-25, these documents are *out of date* and must be reviewed and modified to reflect the current element set and mappings. Even so, they offer an idea of how it's done. (Edit this readme when mappings are current. Check their dates to see if this might have been done.)

Mappings described:

## NIST SP 800-53

Sources for this information are available to us in NIST NVD XML format. The conversion of this XML into OSCAL is a straightforward crosswalk, with some small enhancements.

## ISO 27002

Controls described in the ISO/IEC 27002:2013 are enumerated in a source document available in published form from ISO: cf https://www.iso.org/standard/54533.html. We have written an "uphill conversion" (inferencing) transformation in XSLT to render these contents into OSCAL. In respect of IP restrictions, we have obfuscated the main contents in doing so. The mapping describes how contents of this document *as rendered in display* are described using OSCAL tagging.

If/as this content becomes available in a more robust form (such as [NISO STS](http://www.niso.org/workrooms/sts/) rather than PDF, EPUB, or HTML), a more robust crosswalk into OSCAL should become technically feasible.

## COBIT 5

[COBIT 5: Enabling Processes](http://www.isaca.org/COBIT/Pages/default.aspx) is a set of security controls published by ISACA, an industry consortium and membership organization focused on enterprise IT. The OSCAL rendering of this control set was performed by hand with automated enhancement. Meant as a demonstration, it only covers five (5) controls (with 26 subcontrols or control enhancements) out of 37 controls (with over 200 subcontrols). Because this information is highly interlinked, a machine-readable OSCAL version will become practically useful only when the entire catalog is available. 

Again, this mapping describes how contents of this document *as rendered in display* may be described using OSCAL tagging. This mapping is provisional, as we have not yet performed an analysis to determine its comprehensiveness with regard to this complex specification. 

-----
