# OSCAL Library Files - XSLT

This directory contains XSLT transformations. Production stylesheets, which map each of our sample control sets into OSCAL, are kept elsewhere (in the subdirectories with the samples). The stylesheets in here are a mix of utilities, starter stylesheets, and generic processors. See inline comments per stylesheet to get an idea of what each does.

Note that XSLT stylesheets may sometimes be version 1.0 - this was done *only* so that XML documents invoking those stylesheets using the W3C-specified PI `<?xml-stylesheet href='lookhere.xsl'>`, would be able to apply the stylesheet so provided. YMMV. Works in Firefox, at least sometimes. In any case, when it does work, it is very handy to have XSLT in the browser natively. More commonly, XSLT stylesheets are version 2.0 or 3.0 and assume a modern processor to run. Tested under Saxon.

Code is meant as demonstration only, with no warrant of capability or fitness.
