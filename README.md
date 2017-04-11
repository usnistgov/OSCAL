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
General Notes, 20170313:
The oscal-03 branch aded to simplify directory structures and consolidate latest example xml and schema files.
Most recent additions are example xml file and schema extension for a system-implementation.
The system-implementation example includes tags from FedRAMP template and links to another hypothetical document that contains an enumerated list of system components.
The component list is included in "attachment 13" of the FedRAMP template; referred to as a component inventory.
I am trying (for expedience) to (re)use structures already defined in the OSCAL-core schema.  
In system-implementation, statements defined for security control catalog are reused as statements for implementing the security controls.
Notes on schema:
OSCAL-core contains the information structures that are most highly developed
OSCAL-common contains link definitions and some additional structures to facilitate human readability
OSCAL-extensions define information structures outside the core that are unique to specific catalogs or other specialized XML documents.
Notes on processing of guidance information:
Since the function of profile (overlay) xml documents is to select, augment, and sometimes overwrite security control implementation guidance, schemas and XML examples require further development in terms of explicit methods for reconciling specific tags that come from multiple sources.  The OSCAL-core schema document defines a RationaleChangeType information object that includes restrictions for augmenting, changing, or scoping-out (eliminating) text.
Notes on (re)use of authorization bodies of evidence:
System implementation documents should include a method to capture links to pre-existing bodies of evidence (e.g. a component ID with links to a FedRAMP authorization number) referring that a system or system component has been assessed before.  When accessible, such links are associated with increased levels of trust in the component.  The scope of an assessment process may be greatly reduced by accepting pre-existing bodies of assessment evidence and focusing on assessment of new (untested) or modified components.  Closely related, are component links or aliases to CPE names, SWID names, and other standardized identifiers; which may be associated with known vulnerabilities (e.g. CVEs).
