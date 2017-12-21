# Documentation for creators and maintainers of OSCAL tools and content

Summarize audiences from the "OSCAL users" section of OSCAL-Overview.md. 

Information to present to implementers includes:
* The high-level OSCAL model (how OSCAL is organized, what the function of each component is, how the components are related). "OSCAL components and high-level architecture" section of OSCAL-Overview.md shows the high-level architecture and defines each component. "Terminology" section of OSCAL-Overview.md defines "control", "catalog" and "profile". Profile-Catalog-Relationship.md explains the relationship between profiles and catalogs.
* The OSCAL document model and tagging specification (docs/schema/oscal-tag-library.md)
* OSCAL examples. Slides 14 through 18 in the OSCAL Overview presentation illustrate how prose becomes OSCAL.
* Pointers to schemas and Schematron files

Are there multiple audiences within implementers that will want distinct subsets of information? Or will different people need different combinations of information?

A good example of how to engage people is at https://docs.docker.com/machine/overview/. It briefly explains what is available, why it would be beneficial, and what to do next (with links to other docs for installing and setting up a local copy, etc.) More details are then provided at https://docs.docker.com/machine/concepts/, which explains the basic concepts, and the https://docs.docker.com/machine/reference/ landing page, which sets up a page for each command (explains what the command does and how it's related to other commands, and gives examples of its use.) Such an approach might be well adapted for OSCAL purposes, although having a separate page for every element would probably be too much.
