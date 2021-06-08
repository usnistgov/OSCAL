---
title: Relations to Other Documentary Encoding Standards
description: Explanation of how OSCAL relates to various documentary standards.
weight: 100
toc:
  enabled: true
aliases:
  - /docs/relations/
  - /documentation/relations-to-other/
---

Professionals working in the security domain are already familiar with numerous standards, specifications, guidelines and regulatory frameworks that define and describe practice in the systems security arena: NIST SP800-53, ISO 27002, FedRAMP, FISMA/FIPS, HIPAA and others. OSCAL's models are designed to capture the full range of these.

However, OSCAL is not the only text encoding technology available, and it is not always the most suitable, depending on the task at hand. Designed specifically to support operations related to security automation and assessment support, OSCAL may not be as optimal as other (standards-based, non-proprietary) formats for other applications including, notably, full text transcription, search and retrieval, or publication workflows. (OSCAL data may be shared among partners, even over networks including the Internet; but it is not necessarily suitable for publishing as such.)

More importantly, since OSCAL shares its technical foundations with other documentary encoding standards that serve other horizontal or neighboring vertical domains, it is important to recognize a *high degree of compatibility* with other XML-based formats. Investing in OSCAL and OSCAL-related tooling is a way of developing capability that applies to these other formats as well; likewise investing in these can have beneficial side effects related to OSCAL and related technologies.

## How OSCAL relates to other document encoding formats

### HTML (encoding for web pages)

OSCAL seeks to complement HTML and other web technologies such as Markdown, by framing and aligning them with a more rigorous and cleanly defined tagging semantics appropriate to the problem domain. Much of OSCAL will be familiar to HTML (web) developers.

### MS Word/Excel formats <code>.docx .xlsx</code> (word processor and spreadsheet)

Microsoft's Office Open XML is the format underlying its Word and Excel applications; it is documented as ISO. Ubiquitous as an application format, these formats are tractable using tools built to the applications' APIs and data models, but they are not designed to support application-independent data exchange. OSCAL enables greater data interoperability among disparate systems by capturing the semantics of controls, independent of how they may be displayed using various representations (such as word processors). However, we expect that word processors and spreadsheets will continue to be used in workflows supporting OSCAL, supported where necessary by data conversion utilities.

### OpenOffice formats <code>.odt .ods</code> (word processor and spreadsheet formats)

ODF, the Open Document Format, is an open-source alternative to Office Open XML (<code>.docx</code> and <code>.xlsx</code>), developed for Apache OpenOffice. It can play a similar role in OSCAL systems, for example as a production format for page layout.

### DITA (XML encoding for technical documentation)

OSCAL will be a good fit with documentary systems based [Darwin Information Typing Architecture (DITA)](https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture). The issues will be similar to integrating with STS or JATS – whether or where to embed one in the other (probably OSCAL into DITA), or alternatively to map and enforce semantics across a bridge.

Since OSCAL is designed to be easier than most formats to map into other formats, the OSCAL team is interested in collaborating in this area.

### NISO STS XML (encoding for standards documentation)

NISO STS is an XML-based document model being adopted within the community of Standards Development Organizations (SDOs) for encoding technical standards. Since OSCAL has XML foundations, and STS is also XML-based and designed to use the same or a similar stack of standards-conformant tools, they are compatible in many respects and share many characteristics.

However, the two data models are designed to cater to the needs of very different data professionals. STS is focused on the formal publication of technical standards, while OSCAL is focused on presenting a subset of (relatively) highly structured data from those standards and from other documents, for the purposes of integration with security automation and assessment support.

Due to their commonalities and potential overlap, however, STS and OSCAL (whether catalog, implementation- or assessment-related or other exchangeable data) can be used together. For example, dropping OSCAL data into an STS-based system, to support editing and production in a published form, would be a simple exercise in XML transformation pipelining. Or it may be found useful to author and edit documents in STS for purposes of their publication, and then produce an OSCAL version of those documents or parts of them, to expose to systems that can use OSCAL.

### NISO JATS / NLM BITS (XML encoding for publication of journals and books)

The National Information Standards Organization (NISO) [Journal Article Tag Suite (JATS)](https://www.niso.org/standards-committees/jats) was originally developed at the US National Library of Medicine and the National Institute of Health for the aggregation of large numbers of journal articles in online text bases. While it is not as close to the application domain of OSCAL as the [NISO Standards Tagging Suite (STS)](https://www.niso.org/standards-committees/sts) (which is built on the JATS architecture), it presents similar opportunities for integrators. [NLM Book Interchange Tag Suite (BITS)](https://jats.nlm.nih.gov/extensions/bits/) is the related data description standard for monograph and book publication.

### Other Industry Vertical Encoding Standards

XML has been widely used in many industries. Wherever XML data repositories exist that could benefit from an OSCAL description, some sort of functional mapping to an OSCAL-based format is possible.

However, XML is only one vehicle. To the extent that relevant data sets exist (whether in standardized or non-standardized form), OSCAL can provide translation and serialization services, leveraging formats including JSON or YAML, to expose this data in a standards-compliant way to downstream applications and services.
