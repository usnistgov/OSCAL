# NIST SP 800-53

## OSCAL copy of NIST SP 800-53, with objectives (SP 800-53A)

Find the data in file [SP800-53-OSCAL-refined.xml](SP800-53-OSCAL-refined.xml).

## Converting SP 800-53 into OSCAL

As described below, conversion of SP 800-53 controls into OSCAL occurs (currently) in three stages.

For convenience, an XProc pipeline is offered that combines the three steps into a single call on an XProc processor such as XML Calabash. The source file should be a copy of NIST NVD [800-53-controls.xml](https://nvd.nist.gov/800-53/800-53-controls.xml). Next to this file (in the same subdirectory) must also be a copy of [800-53a-objectives.xml](https://nvd.nist.gov/800-53/800-53a-objectives.xml), which will have its contents (control objectives) aggregated into the result. These files may be found here: https://nvd.nist.gov/800-53

XML Calabash can be invoked inside oXygen XML Editor or Developer; use [SP800-53-extraction.xpl](SP800-53-extraction.xpl) in an XProc scenario set up with appropriate bindings. (The primary source XML file must be bound to the `source` port. The results are given on the `final` port.) This is convenient for development/debugging as intermediate results may be inspected without writing them to the file system.

Alternatively, XML Calabash (a Java application) can be run from the command line or via Apache Maven or Gradle. See http://xmlcalabash.com.

Or the three processes can be run separately, in sequence (i.e., run the second XSLT over the results of the first one).

### Extraction

Run the XSLT [Convert-SP800-53-to-oscal.xsl](Convert-SP800-53-to-oscal.xsl) over the source file to produce OSCAL.

### Enhancement

Run the XSLT [Enhance-SP800-53-oscal.xsl](Enhance-SP800-53-oscal.xsl) over the results of the first transformation. This is a modified identity transformation that amends the source by adding IDs and inferring markup over structured text content.

### Tuneup

Further modifications are performed by the XSLT [Tuneup-SP800-53-oscal.xsl](Tuneup-SP800-53-oscal.xsl). This transformation adds IDs to new elements added in the previous transformation, maps ID values to a more concise form, and makes a few other small adjustments. Currently, this XSLT also re-maps certain elements to conform to the current draft schema. When the latter is more stable, we will move these mappings back into the Extraction stylesheet where they belong. 

## Also in this subdirectory

There may be relics of analysis and processing this resource.
  
