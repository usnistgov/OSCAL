# Open Security Controls Assessment Language (OSCAL) 

> Current work is happening in the [sprint-8](https://github.com/usnistgov/OSCAL/tree/sprint-8) branch.

NIST is proposing the development of the Open Security Controls Assessment Language, or OSCAL, a hierarchical, formatted, XML-based (and JSON translation) schema that provides a standard for representing different categories of information pertaining to the publication, implementation, and assessment of security controls. 

This repository consists of the following directories pertaining to the OSCAL project:

  * [docs](docs): Documentation graphics, prose, progress updates, and presentation slides
  * [examples](examples): OSCAL examples, including both demo (unit test) and "real world" examples
  * [schema](schema): OSCAL schemas and validation tools
  * [sources](sources): Resources used to produce OSCAL artifacts that are not maintained by the OSCAL project (e.g., a copy of the NIST SP 800-53 control data feed schema)
  * [working](working): Development artifacts (e.g., XML, XSLT, CSS, script, Markdown, and sample files, plus supporting files); additional documentation is posted under [working/doc](working/doc): 

See [docs/prose/OSCAL-Overview.md](docs/prose/OSCAL-Overview.md) for an introduction to OSCAL and [docs/schema/oscal-tag-library.md](docs/schema/oscal-tag-library.md) for detailed information on the OSCAL data models and XML schema compositions.

As the result of a new OSCAL initiative undertaken in May 2017, this repository was updated in August 2017. With this effort, we are stressing the agile development of a *minimal* format that is both generic enough to capture the breadth of data in scope (controls specifications), while also capable of ad-hoc tuning and extension to support peculiarities of both (industry or sector) standard and new control types.
