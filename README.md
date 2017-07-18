# OSCAL
Open Security Controls Assessment Language (OSCAL) 

The Cloud First policy established by the U.S. Federal CIO in December 2010, mandates that agencies take full advantage of cloud computing benefits to maximize capacity utilization, improve IT flexibility and responsiveness, and minimize cost. By 2012, a subsequent report to Congress showed that more than half of all federal agencies had adopted cloud computing for at least one application. The rapid adoption of cloud computing under this mandate is not voiding any of the agencies’ FISMA requirements for adequate security and privacy protection of data. 

NIST is proposing the development of the Open Security Controls Assessment Language, or OSCAL, a hierarchical, formatted, XML-based (and JSON translation) schema that provides a standard for encoding different categories of information pertaining to the security controls’ implementation and assessment process.  

OSCAL aims to:
1.	Standardize the description of a control based upon the standard used (NIST SP 800.53, ISO/IEC 27001/2, PCI, SOX, etc), 
2.	standardize the reporting format of a security control implementation for a particular ‘technology’ (cloud computing, cyber physical systems, mobile, etc.) – for an Overlay (see NIST SP 800-53 R4 for more details) -  or for a particular ‘scope’ or 'purpose' for which the control is implemented (e.g. the control is implemented for physical access or logical access to a, b, c layers). 
3.	standardize the format of the documented assessment criteria, 
4.	standardize the format of the metrics and measurements for the continuous monitoring of the control, and 
5.	other custom information standardization.

--------------

## Update July 2017

A new OSCAL initiative was undertaken starting in mid-May. Our current work is reflected in the `develop` branch. With this effort, we are stressing the agile development of a *minimal* format that is both generic enough to capture the breadth of data in scope (controls specifications), while also capable of ad-hoc tuning and extension to support peculiarities of both (industry or sector) standard and new control types.

https://github.com/usnistgov/OSCAL/tree/develop

In order to enable such a format, we have developed an alternative validation model: the provision for a second "document level" validation layer (by means of declarations also written in OSCAL) means that much of the complexity that OSCAL must support, can be moved away from the base schema. The schema (base tag set) is simpler, while OSCAL can be configured, extended and fitted to new control types and applications, with no schema modification at all. (OSCAL is instead extended using its own declarations.)

In the `develop` branch, ignore the `old` subdirectory: it is an archive. What you want is in the `draft` directory.

In its `working` subdirectory https://github.com/usnistgov/OSCAL/tree/develop/draft/working find the following:

 * `lib` - schemas along with Schematron, CSS and XSLT
 * `doc` - documentation including mapping documentation plus supporting code; any tag set docs will also be here
 * `SP800-53` - OSCAL demo, NIST SP800-53
 * `ISO27002` - OSCAL demo, ISO 27002
 * `COBIT5` - OSCAL demo, COBIT 5

## oXygen demo guidelines

Validations and "prettified" (formal) editing are configured for oXygen XML Editor, and sample documents are provided with the necessary glue code. However, software components invoked by these bindings, including XSLTs and CSSs, are standards-based and everything done here with oXygen, could be done on a different platform. Likewise demonstrations we have produced thus far only *scratch the surface* of what is possible with OSCAL.

The new OSCAL offers a new validation model that will provide for easier customization. Instead of requiring schema aggregation or extension, customizing OSCAL is now accomplished by describing an "application usage" of OSCAL elements and class values (much like an HTML/CSS microformat). This set of constraints on controls can be expressed and codified in a set of OSCAL declarations, which can also provide a means of formal (run-time) enforcement. OSCAL declarations give to developers and users the capability to define OSCAL control types, without having to write any schema code.

So defined, application subsets of OSCAL can be put to use in the development of profiles and overlays in the senses described in SP800-53 Rev 4, but also of more free-form and adaptive control models, which perhaps hybridize, combine or synthesize requirements from different control families. As a fairly well-defined XML language, OSCAL *by itself* -- that is, over and above any benefits from having a common format for negotiating among these different information types -- will permit a kind of document transparency and traceability simply impossible in the past, with either published specifications or standards (which were never machine-readable and tractable in these ways) or with the profiles, overlays, derivatives or productions that reference them.

## Controls, not (only) the documents that describe them

OSCAL permits the deployment of an application-specific language for the management of 'controls', defined in a very broad sense.

Inevitably there is a metaphysical grey zone between controls, and the language by which they are defined and described.

OSCAL captures chunks of transcribed natural/literate/technical language, i.e. "prose", but it also permits the rational arrangement of such chunks of language with more tightly controlled values (control properties and parameters). Applied systematically and at scale, such regular and rational arrangements enable higher-order transparencies that can translate into functionalities. In this, OSCAL goes farther than documentary-description XML formats such as JATS, NISO STS, DITA, or other viable alternatives, not in providing a "semantics" for "controls", but in offering a means by which an OSCAL application (or user or developer) may do so.

Accordingly, it is expected that OSCAL would be complementary to any of the formats just mentioned. At the same time, OSCAL is not complete by itself - it requires a 'profile' or 'pattern' among controls in a catalog to be useful, and its best "semantics" are not its own - which is no worse than any standard interchange format.

--------------

[old - to be removed -]
General Notes, 20170313:
Most recent additions are example xml file and schema extensions for a system-implementation. (MI - ?)
The system-implementation example includes tags from FedRAMP template and links to another hypothetical document that contains an enumerated list of system components. (MI - ?)
The component list is included in "attachment 13" of the FedRAMP template; referred to as a component inventory. (MI - ??)
I am trying (for expedience) to (re)use structures already defined in the OSCAL-core schema.  (MI - ?)
In system-implementation, statements defined for security control catalog are reused as statements for implementing the security controls. (MI - ?)

NOTES on schema:
OSCAL-core contains the information structures that are most highly developed
OSCAL-common contains link definitions and some additional structures to facilitate human readability (MI - ?)
OSCAL-extensions define information structures outside the core that are unique to specific catalogs or other specifications.

NOTES on processing of guidance information:
Since the function of profile (overlay) xml documents is to select, augment, and sometimes overwrite requirements/controls, schemas and XML examples require further development in terms of explicit methods for reconciling specific tags that come from multiple sources.  The OSCAL-core schema document defines a RationaleChangeType information object that includes restrictions for augmenting, changing, or scoping-out (eliminating) text.

NOTES on (re)use of authorization bodies of evidence (MI - ?):
System implementation documents should include a method to capture links to pre-existing bodies of evidence (e.g. a component ID with links to a FedRAMP authorization number) referring that a system or system component has been assessed before.  When accessible, such links are associated with increased levels of trust in the component.  The scope of an assessment process may be greatly reduced by accepting pre-existing bodies of assessment evidence and focusing on assessment of new (untested) or modified components.  Closely related, are component links or aliases to CPE names, SWID names, and other standardized identifiers; which may be associated with known vulnerabilities (e.g. CVEs).

