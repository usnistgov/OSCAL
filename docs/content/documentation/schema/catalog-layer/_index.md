---
title: Catalog Layer
heading: "OSCAL Catalog Layer"
description: Provides the OSCAL [catalog model](/documentation/schema/catalog-layer/catalog/), which represents a [control catalog](/learnmore/concepts/catalog/).
weight: 70
---

Privacy and security documentation today often discusses **controls** and **catalogs**. A [control](/learnmore/concepts/control/) represents a security requirement, guideline, procedure or activity. A [control catalog](/learnmore/concepts/catalog/) is an organized collection of controls.

Typically, catalogs are represented in human readable documentary form, in which controls are represented as parts of a catalog document. Controls, as defined and described in catalogs, may also be referenced and configured in other documents; thus control information must be composed in a way to make it possible to migrate across different types of documents for different purposes, while maintaining "identity" and referential integrity for traceability.

Additionally, catalogs may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls is supported in OSCAL because some control catalog formats, such as COBIT 5, address assessment information directly. Others have it separately, like 800-53A. Including assessment objectives within the OSCAL catalog model simplifies the entire OSCAL operational model.

The OSCAL Catalog layer provides the OSCAL [catalog model](catalog/), which defines structured, machine-readable XML, JSON, and YAML representations of the information contained within a [control catalog](/learnmore/architecture/catalog/). The OSCAL catalog model is the sole model in the OSCAL catalog layer of the OSCAL [architecture](/learnmore/architecture/).

The NIST SP 800-53 revision 4 and 5 control catalogs are provided as catalog model [examples](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/) in the OSCAL GitHub repository.
