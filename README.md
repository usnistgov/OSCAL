# Open Security Controls Assessment Language (OSCAL) 

NIST is proposing the development of the Open Security Controls Assessment Language, or OSCAL, a hierarchical, formatted, XML-based (and JSON translation) schema that provides a standard for representing different categories of information pertaining to the publication, implementation, and assessment of security controls.

OSCAL aims to:
1. Standardize control, implementation, and assessment information using a open, machine readable formats. 
1. Normalize the semantics of controls, profiles/baselines/overlays across multiple control catalogs (e.g., NIST SP 800.53, ISO/IEC 27001/2, COBIT 5).
1. Provide interoperable formats to ensure that OSCAL information is used by tools in consistent ways.
1. Promote adoption of OSCAL by tool developers by ensuring that OSCAL information is easy to create, use, and customize. 

OSCAL consists of a number of layers:

![OSCAL layers](docs/graphics/oscal-layers.png "OSCAL Layer Diagram")

Starting from the bottom on the left, the OSCAL layers are:
  * __Catalog__: Defines a set of security controls (e.g., NIST SP 800-53 Appendix F); may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A).
  * __Profile__: Defines a set of security requirements, where meeting each requirement necessitates implementing one or more security controls; also called a _baseline_ or _overlay_.
  * __Implementation__: Defines how each profile item is implemented for a given system component (System Security Plan)
  * __Assessment__: Describes how the system assessment is to be performed
  * __Assessment Results__: Records the findings of the assessment
  
OSCAL will also integrate with: 
  * __Metrics__: Defines metrics and measurements for understanding the effectiveness of the system’s security
  * __Mechanism__: Describes methods used to monitor the system’s current security state (e.g., Security Content Automation Protocol (SCAP))

--------------

This repository consists of the following directories pertaining to the OSCAL project:
  * [docs](docs): Contains documentation resources.
  * [working](working): Current development artifacts.
  * [sources](sources): Supporting resources used to produce OSCAL artifacts that are not maintained by the OSCAL project

## Update August 10th, 2017

As the result of a new OSCAL initiative undertaken starting in mid-May, this repo has been updated. With this effort, we are stressing the agile development of a *minimal* format that is both generic enough to capture the breadth of data in scope (controls specifications), while also capable of ad-hoc tuning and extension to support peculiarities of both (industry or sector) standard and new control types.

