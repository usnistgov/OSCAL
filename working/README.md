# OSCAL Schema and Instance Document Workspace

This part of the repository contains artifacts that comprise the implementation of the OSCAL catalog and profile layers.

The 'working' subdirectory contains the following, produced in various sprints:

 * [lib](lib) - schemas along with Schematron, CSS, and XSLT files
 * [ISO-27002](ISO-27002) - OSCAL demo files for ISO 27002
 * [SP800-53](SP800-53) - OSCAL demo files for NIST SP 800-53 (revs 4 and 5) with derivation pipelines (conversion from NVD XML)
 * [FedRAMP](FedRAMP) - prototype heading towards representing FedRAMP spreadsheet as a profile (customization) of a baseline derived from SP800-53: currently, we have a profile calling SP800-53; working towards a profile calling an SP800-53 baseline (profile)
 * [COBIT5](COBIT5) - OSCAL demo files for COBIT 5 (e.g., XML files for representing COBIT 5 excerpts in OSCAL format for demonstration purposes)
 * [CSF](CSF) - represented as an OSCAL framework (valid to our schema). Working from a YAML representation of a Cybersecurity Framework document (cf Issue #5)
 * [JSON-mapping](JSON-mapping) - prototype pathway from JSON representation of 'implementation' layer data, into an OSCAL format, and its coordination/integration with extant catalogs.
 
Validations and "prettified" (formal) editing are configured for oXygen XML Editor, and sample documents are provided with the necessary glue code. However, software components invoked by these bindings, including XSLTs and CSSs, are standards-based, and everything done here with oXygen could be done on a different platform. Likewise, demonstrations we have produced thus far only *scratched the surface* of what is possible with OSCAL.

See [docs/prose/Schema-Decisions.md](docs/prose/Schema-Decisions.md) for insights into decisions of interest made for XML schema design and validation.
