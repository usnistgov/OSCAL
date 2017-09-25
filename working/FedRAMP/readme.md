# FedRAMP in OSCAL: a demonstration

This directory contains the data conversion pipeline we have used to produce the creation of "starter OSCAL" profiles for each of three provided FedRAMP baselines of SP800-53, namely HIGH, MEDIUM and LOW. Each of these was made available to us as an Excel spreadsheet (see the `/sources/FedRAMP` directory). XML from extracted from each of these using a commodity tool (Excel Import in oXygen XML Editor) to "dump" the Excel contents into a simple ad-hoc ("flat") XML format. The three files resulting are given in the `lib` directory: see `excel-HIGH-extract.xml`, etc.

The `lib` subdirectory also contains logic for an XProc pipeline that can in turn produce a "starter" OSCAL profile for each of these, based on analysis of the file structure and contents in reference to the set of catalogs (sources or authorities) that are to be invoked. The catalogs used are the three baseline profiles of SP800-53, plus SP800-53 itself (in toto, per se) as a backup catalog (for controls not found in the others). These external sources are invoked first when calls on controls and subcontrols matched with them for allocation, then again for their parameter settings to be added in. Without support of the `saxon:memo-function` extension expect performance to be s l o w.

When all goes well, what results is an OSCAL profile containing all the information from the spreadsheets, cast into OSCAL in the form of a *profile* -- which is to say, not as a catalog or mock-catalog, but a layer to be applied to a catalog, conforming to the OSCAL rules for such layers, and ready for subsequent editing.

When it doesn't go so well, the casting can be diagnosed by running the XProc and (when necessary) the XSLTs. See the `lib` directory.

Keep in mind that the results of the transformation pipeline are not intended to be final and will require editing. For these examples, the editing happens over in the `/examples/FedRAMP` directory, not here.

A Schematron, `fedramp-profile.sch` can support this process.
