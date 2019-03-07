---
title: Relationships
description: Relationships
permalink: /learnmore/relationships/
layout: post
---

## OSCAL in relation to other document encoding formats

If we have these others, why do we need OSCAL?

### HTML

HTML is the lingua franca of the web.

OSCAL seeks to be complementary with HTML and other common web technologies such as Markdown which we leverage heavily in our own toolkits. However, this in itself demonstrates why we need OSCAL: if we didn't, we would already be doing the work without it.

### MS Word format `.docx`

Microsoft's Office Open XML is tractable using tools built to its APIs and data model, but as machine readable formats go it is fairly illegible: information stored and presented in Word documents is typically difficult to migrate onto other systems (supporting features beyond your word processor) with either semantic or representational fidelity. This is a primary reason and driver for OSCAL: that in order to achieve greater data interoperability among disparate systems, the specialized and peculiar semantics of security controls must be *isolable*, *identifiable* and *controllable* without mediation through other representations which requires externalizing the data.

Migrating security data away from MS Word and `.docx` formats is an important goal. (Note - this does not mean doing away with Microsoft Word itself, which we expect to remain valuable and useful in workflows supporting OSCAL.)

### OpenOffice format `.odt`

ODF, the Open Document Format, is an open-source alternative to `.docx` developed for Apache OpenOffice, While internally it is somewhat more readable than MS Office Open XML, it presents similar problems and opportunities for OSCAL to solve.

### NISO JATS / NLM BITS

[National Information Standards Organization (NISO) Journal Article Tag Suite (JATS)](https://www.niso.org/standards-committees/jats) was originally developed at the US National Library of Medicine and the National Institute of Health for the aggregation of large numbers of journal articles in online text bases. While it is not as close to the application domain of OSCAL as the [NISO Standards Tagging Suite (STS)](https://www.niso.org/standards-committees/sts) (which is built on the JATS architecture), it presents similar opportunities for integrators. [NLM Book Interchange Tag Suite (BITS)](https://jats.nlm.nih.gov/extensions/bits/) is the related data description standard for monograph and book publication.

### NISO STS XML

NISO STS is an XML-based document model being adopted within the community of Standards Development Organizations (SDOs) for encoding technical standards.

Since OSCAL has XML foundations, and STS is also XML-based and designed to use the same or a similar stack of standards-conformant tools, they are highly compatible.

However, the two data models are designed to cater to the needs of very different data professionals. OSCAL data is not likely to ever be "published" while STS documents are often published for a specific audience or market. OSCAL also has requirements for our documents to be in machine-readable form. The machines we will develop OSCAL documents (for purpose of analysis, integration, and assessment) will be different and complementary to the machines that publish STS documents (on or off the Internet). Consequently, the design of the data model will be optimized for different work than in traditional editorial and publishing workflows aimed at document production.

Due to their commonalities and potential overlap, however, STS and OSCAL (whether catalog, implementation- or assessment-related or other exchangeable data) can be used together. For example, dropping OSCAL data into an STS-based system, to support editing and production in a published form, would be a simple exercise in XML transformation pipelining.

### DITA

OSCAL will be a good fit with documentary systems based [Darwin Information Typing Architecture (DITA)](https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture). The issues will be similar to integrating with STS or JATS -- whether or where to embed one in the other (probably OSCAL into DITA), or alternatively to map and enforce semantics across a bridge. 

Since OSCAL is designed to be easier than most formats to map into other formats, the OSCAL team is interested in collaborating in this area.

### Other Industry Vertical Encoding Standards

XML has been widely used in many industries. Wherever XML data repositories exist that could benefit from an OSCAL description, some sort of functional mapping to an OSCAL-based format is possible.

However, XML is only one vehicle. To the extent that relevant data sets exist (whether in standardized or non-standardized form), OSCAL can provide translation and serialization services such as JSON or YAML to expose this data in a standards-compliant way to downstream applications and services.

## Prior Art in the Compliance/RM space?

Placeholder for OpenControl ...