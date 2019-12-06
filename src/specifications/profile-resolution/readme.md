## Editing this specification

Find an oXygen project file inside the file `profile-resolution-spec.xpr`.

Features of the setup:

* XML authoring using raw tags or alternatively, in a structured editing environment with outlining, layout, formatting and UI widgets
* One-button production of a self-contained HTML file for preview in a browser
* Another button for production of a version for the web site (targeting NIST/USWDS/Hugo - in development
* Schematron support for ad-hoc rules
* Lightweight tagging is an HTML core plus a little healthy XML goodness for a few specification-oriented semantics

## Setup:

Extract the contents of `profile-resolution-spec-xpr.zip`: it is an `xpr` (oXygen project) file

Open the project in oXygen

Open the Specification working file in oXygen `profile=resolution-working-specml.xml`

Use the View tab buttons at the bottom of the screen to switch between 'Text' and 'Author' views.

Don't forget other oXygen features such as the outline view, support for editing the CSS, etc. etc.

## Schematron

So far, the Schematron performs only one test: it complains if the section numbering goes too deep.

The RNC schema does introduce ID/IDREF relations, which oXygen exploits