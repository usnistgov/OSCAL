# FedRAMP in OSCAL: a demonstration

Working files for the creation of "starter OSCAL" profiles for each of three provided FedRAMP baselines of SP800-53, namely HIGH, MEDIUM and LOW. Each of these is made available to us as an Excel spreadsheet, here:

Each of these has been extracted using a commodity tool (Excel Import in oXygen XML Editor) to "dump" the Excel contents into a simple ("flat") XML format. The three files resulting appear here as `excel-HIGH-extract.xml`, etc.

The `lib` subdirectory contains logic for an XProc pipeline that can in turn produce a "starter" OSCAL profile for each of these, based on analysis of the file structure and contents in reference to the set of catalogs that are to be invoked.

When all goes well, what results is an OSCAL profile containing all the information from the spreadsheets, cast into OSCAL and ready for subsequent editing.

When it doesn't, the casting can be diagnosed by running the XProc and (when necessary) the XSLTs, which are all documented to describe how we go from loosely described "semantic" tabular data in the spreadsheets, into the more rigorous OSCAL format, then how we coordinate it with the canonical catalog and profile files (already in OSCAL) -- or the closest we have to these -- in order to produce the final results.

Of course, the results of the transformation pipeline are not final, but have to be edited. But they have exposed the editorial issue such that it can be addressed (by staff with the appropriate skills) much more easily and expeditiously than heretofore, when process overhead is so significant.

The resulting "Working OSCAL profile" should be edited to provide parameter values, which are "blanks" as it is emitted (clean).

A Schematron, `fedramp-working.sch` can help find parameters that remain to be corrected.
