# FedRAMP in OSCAL: a demonstration

We aim here to represent a FedRAMP specification spreadsheet, produced as a customization (OSCAL profile) of an SP800-53 baseline (also an OSCAL profile, referencing an OSCAL catalog).

For each of LOW, MODERATE and HIGH, we have:

* An Excel spreadsheet dump (straight-up mapping into XML) giving a (somewhat structured) FedRAMP specification
* An OSCAL worksheet produced by an XSLT running over this XML
* A 'naive profile' produced from this worksheet - enables validating against catalogs
* Enhancements of this profile adding in parameter values etc.

