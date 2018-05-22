# OSCAL Libraries and Other Supporting Files

This directory contains a variety of supporting files. For example, it holds core XSLT stylesheets for processing OSCAL. It also contains scripts and utilities used internally by the OSCAL developers.

The structure and contents of the directory are as follows:

* [CSS](CSS): This directory contains CSS files useful for styling OSCAL in an editor or browser.
* [XProc](XProc): This directory contains XProc pipeline configurations (scripts) used for general processes, such as resolving a profile against its catalogs and producing an HTML file from the results.
* [XSLT](XSLT): This directory contains core XSLT stylesheets for processing OSCAL.
* [sketch](sketch): This directory contains XSLT and XProc files used for a specific pipeline in support of documentation. The XSLTs  can read an XML file (such as an OSCAL file) and draw a picture of it, producing the picture in SVG. It has been tested for viability, but not demonstrated or used. However, it will be potentially useful once we have integrated unit testing and wish to validate processes.
* [util](util): This directory contains utility XSLTs and others. It includes some "scratch" XQueries plus the XSLT that produces the file manifests in Markdown.
