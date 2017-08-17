# OSCAL Schema and Instance Document Workspace

This part of the repository contains artifacts that comprise the implementation of OSCAL catalog and profile layers.

The 'working' subdirectory contains the following:

 * '[lib](lib)' - schemas along with Schematron, CSS and XSLT
 * '[doc](doc)' - documentation including mapping documentation plus supporting code; any tag set docs will also be here
 * '[SP800-53](SP800-53)' - OSCAL demo, NIST SP800-53
 * '[ISO27002](ISO27002)' - OSCAL demo, ISO 27002
 * '[COBIT5](COBIT5)' - OSCAL demo, COBIT 5

## Controls, not (only) the documents that describe them

OSCAL represents a domain-specific language for the expression of collections of security and privacy controls in a control catalog.

Inevitably there is a metaphysical grey zone between controls, and the language by which they are defined and described. OSCAL attempts to normalize the semantics used to describe controls providing a single format for which multiple control catalogs (e.g., NIST SP 800-53/53a, ISO/IEC 27001/2, COBIT) can be expressed. Through normalizing the semantics across control catalogs, control information can be expressed more consistently, allowing similar types of information provided in different control catalogs to be expressed in the same format. This degree of normalization allows related concepts such as baselines and overlays to be expressed in a common format, called a profile, that can reference controls from one or more catalogs in a consistent format.

### Validation

In order to enable catalog and profile specific validation, we have developed an alternative validation model. This additional validation model, called "declarations", provides support for a second "document level" validation layer. This allows much of the complexity that OSCAL must support to be moved away from the base schema. This results in a simpler schema (base tag set). For a given catalog or profile, OSCAL can be configured, extended and fitted to new control types and applications, with no schema modification at all using declarations.

The new OSCAL offers a new validation model that will provide for easier customization. Instead of requiring schema aggregation or extension, customizing OSCAL is now accomplished by describing an "application usage" of OSCAL elements and class values (much like an HTML/CSS microformat). This set of constraints on controls can be expressed and codified in a set of OSCAL declarations, which can also provide a means of formal (run-time) enforcement. OSCAL declarations give to developers and users the capability to define OSCAL control types, without having to write any schema code.

### Relationship to Other Document Formats
 
OSCAL captures chunks of transcribed natural/literate/technical language, i.e. "prose", but it also permits the rational arrangement of such chunks of language with more tightly controlled values (control properties and parameters). Applied systematically and at scale, such regular and rational arrangements enable higher-order transparencies that can translate into functionalities. In this, OSCAL goes farther than documentary-description XML formats such as JATS, NISO STS, DITA, or other viable alternatives, not in providing a "semantics" for "controls", but in offering a means by which an OSCAL application (or user or developer) may do so.  Accordingly, it is expected that OSCAL would be complementary to any of the formats just mentioned.

## oXygen demo guidelines

Validations and "prettified" (formal) editing are configured for oXygen XML Editor, and sample documents are provided with the necessary glue code. However, software components invoked by these bindings, including XSLTs and CSSs, are standards-based and everything done here with oXygen, could be done on a different platform. Likewise demonstrations we have produced thus far only *scratch the surface* of what is possible with OSCAL.

