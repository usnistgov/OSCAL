# Decisions of Interest for XML Schema Design and Validation


* We need XML, because we have peculiar functional requirements in dealing with arbitrary but semi-regular mixed data, specifically "documentary" contents; this is XML's sweet spot  
* Syntactically, it would be good to use something as close to MicroXML as possible (we want Python programmers to want to write against this)
* Despite this discipline (or because of it) the XML stack is useful because it is available, performant for our purposes, and standards-based.
* We can aim for the widest distributed support via XSD for validation (for ubiquity of tools) but perform modeling work in RNC (flexibility) as long as possible (and perhaps provide/support other validation methodologies?)
  * Schema maintenance is going to require tools support anyway; we may as well start early: so RNC + docs => XSD+docs
* Provide for customization by restriction, not extension. Flavors of OSCAL will take the form of particular usages, not of formal schemas.
  * Ergo, no schema extension mechanism is called for -- much less yet another one.
* The element set should be as minimal as possible for now - minimum to get the job done (we can aim for decoration later)
* This implies that semantic modeling (of "control types" in different catalogs) work predominantly via a microformat mechanism (semantics overlaid on generic element types via a class mechanism)
  * This was prototyped and found to work (see below)
  * An optional layer (the OSCAL Declarations layer) is implicit so we built one out as a POC
* Standing something up quickly and changing names as we go gives us a chance to try things on, not just debate principles


## Controls, not (only) the documents that describe them

OSCAL is a domain-specific language for the description and specification of collections of security and privacy controls in a control catalog. Inevitably there is a metaphysical grey zone between controls and the language by which they are defined and described. OSCAL attempts to normalize the semantics used to describe controls by providing a single format for which multiple control catalogs (e.g., NIST SP 800-53/53a, ISO/IEC 27001/2, COBIT 5) can be expressed. It does this by presenting a generalized descriptive "slate" or "tablet" upon which the particular patterns of a particular catalog, may be drawn. Not all catalogs in OSCAL will be the same -- the design of controls in different catalogs and of different kinds and species, may be different -- but because they will all be OSCAL, it will be easier to see their differences, easier to relate them to one another, and easier to do alike things, in alike ways.

Not only controls information itself, but a set of structured documents that describes and makes reference to such controls, that is, is in scope for OSCAL. Baselines, profiles, overlays and frameworks written in reference to controls catalogs, are all capabilities we aim to offer and support.

## Validation

In order to enable catalog and profile-specific validation, we have developed an alternative validation model. This additional validation model, called "declarations", provides support for a second "document level" validation layer. This allows much of the complexity that OSCAL must support to be moved away from the base schema. This results in a simpler schema (base tag set). For a given catalog or profile, OSCAL can be configured, extended, and fitted to new control types and applications, with no schema modification at all, using declarations.

The new OSCAL offers a new validation model that will provide for easier customization. Instead of requiring schema aggregation or extension, customizing OSCAL is now accomplished by describing an "application usage" of OSCAL elements and class values (much like an HTML/CSS microformat). This set of constraints on controls can be expressed and codified in a set of OSCAL declarations, which can also provide a means of formal (runtime) enforcement. OSCAL declarations give developers and users the capability to define OSCAL control types without having to write any schema code.

## Relationship to other document formats
 
OSCAL captures chunks of transcribed natural/literate/technical language, i.e. "prose", but it also permits the rational arrangement of such chunks of language with more tightly controlled values (control properties and parameters). Applied systematically and at scale, such regular and rational arrangements enable higher-order transparencies that can translate into functionalities. In this, OSCAL goes further than documentary-description XML formats such as the National Information Standards Organization (NISO) Journal Article Tag Suite (JATS), the NISO Standard Tag Set (STS), the Darwin Information Typing Architecture (DITA), and other viable alternatives. This is not from OSCAL providing a "semantics" for "controls", but in offering a means by which an OSCAL application (or user or developer) may do so. Accordingly, it is expected that OSCAL would be complementary to any of the formats just mentioned.
