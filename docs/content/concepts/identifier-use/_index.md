---
title: Identifier Use
description: Provides details on the scope an duniqueness of dientifiers used within the OSCAL models.
suppresstopiclist: true
weight: 50
toc:
  enabled: true
sidenav:
  focusrenderdepth: 2
  activerenderdepth: 2
  inactiverenderdepth: 2
---

<<<<<<< HEAD
This page reviews important concepts to be aware of when declaring or referencing identifiers in OSCAL models, with in-depth explanations of identifier uniqueness and scope.  
=======
This page reviews important concepts to be aware of when declaring or referencing identifiers in OSCAL models.  
>>>>>>> f992e3ef (added identifier use page)

### **Identifier Type** 
By design, OSCAL supports [*machine-oriented*](/concepts/identifier-use/#machine-oriented) and [*human-oriented*](/concepts/identifier-use/#human-oriented) identifiers. The OSCAL models dictate which are used for different data items.

#### Machine-Oriented

*Machine-oriented* identifiers are implemented as Universally Unique Identifier (UUID) as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122) and are commonly used to (programmatically) identify or refer to unique information within OSCAL models.  Because OSCAL’s *`machine-oriented`* identifiers utilize UUID data types, they can be issued without a central authority, and used across OSCAL instances with low risk of identifier collisions. 

> **NOTE**: While UUIDs are used as machine-oriented identifiers catering to use cases where automated processing is desired, they are not ideal for wildcard matching scenarios.  UUIDs should only be used when exact matches are expected.


The [OSCAL Reference Index](/reference/latest/complete/xml-index/#/@uuid) provides a complete listing of UUIDs in OSCAL.  References to these identifiers typically follow a naming convention of the object type followed by “-uuid”.  For example, see the reference index for [location-uuid](/reference/latest/complete/xml-index/#/location-uuid).

#### Human-Oriented

OSCAL generally implements *`human-oriented`* identifiers as Token data types, which are non-colonized names (add link to data type).  These *`human-oriented`* identifiers have the benefit of allowing authors to incorporate semantics that support readability and processing by humans.  For example, control identifiers in a catalog may use a nomenclature that is familiar to the intended audience, allowing them to quickly determine what security control is being referred to, simply by its ID.  

The [OSCAL Reference Index](/reference/latest/complete/xml-index/#/@id) provides a comprehensive listing of the *`human-oriented`* IDs in OSCAL.  References to these IDs are typically named according to the referenced object type (e.g., control) followed by “-id”, as seen here in the [Reference Index](/reference/latest/complete/xml-index/#/@control-id).

### **Uniqueness** 
OSCAL identifier uniqueness are categorized as *`locally-unique`* or *`globally-unique`*.  As implied by the category name, *`locally-unique`* identifiers must be unique within the current document whereas *`globally-unique`* identifiers are guaranteed to be unique across all other identifiers.  OSCAL’s *`machine-oriented`* UUID identifiers are always *`globally-unique`*.  *`Human-oriented`* identifiers must be defined and managed organizationally and are more susceptible to identifier duplication or collisions. Thus, *`human-oriented`* identifiers are less likely to be *`globally-unique`*.  

### **Scope** 
Identifiers are declared so that data items in OSCAL instances can be referenced accurately and consistently.  In the most basic instance, references are made to data items in the same OSCAL instance, but because OSCAL supports instance importing, there are scenarios where data items in an external / imported OSCAL instance need to be referenced as well.  Identifiers that are only intended for use within the same OSCAL instance are categorized as *`instance`* scope, but identifiers that can be referenced (from other OSCAL instances) are considered *`cross-instance`* scoped. While *`human-oriented`* identifiers might not be globally unique, they may be *`cross-instance`* scoped.  In these cases, the appropriate import attribute (e.g. import, import-component-definitions, import-profile, import-ssp, and import-ap) should be used (similar to a namespacing) to deconflict identifiers with the same values in the associated OSCAL instances.  This would allow for the same control IDs to be used and referenced in a profile and its imported catalog(s) for example.  The tables below provides a summary of OSCAL unique identifier scoping.

#### **Catalog Identifiers**
Identifiers defined in a catalog may be referenced locally or from an importing profile.

|**Defining Model**|**Identifier**|**Catalog**|**Profile**|**Component**|**SSP**|**AP**|**AR**|**POA&M**|
|:------|:-------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|Catalog|Location uuid|&#9745;|&#9745;||||||
|Catalog|Party uuid|&#9745;|&#9745;||||||
|Catalog|Role id|&#9745;|&#9745;||||||
|Catalog|Resource uuid|&#9745;|&#9745;||||||
|Catalog|Property uuid|&#9745;|&#9745;||||||
|Catalog|Document Identifier scheme|&#9745;|&#9745;||||||
|Catalog|Part id|&#9745;|&#9745;||||||
|Catalog|Param id|&#9745;|&#9745;||||||
|Catalog|Catalog uuid|&#9745;|&#9745;||||||
|Catalog|Control id|&#9745;|&#9745;||||||
|Catalog|Group id|&#9745;|&#9745;||||||

#### **Profile Identifiers**
Identifiers defined in a profile may be referenced locally or from an importing profile or SSP.

|**Defining Model**|**Identifier**|**Catalog**|**Profile**|**Component**|**SSP**|**AP**|**AR**|**POA&M**|
|:------|:-------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|Profile|Location uuid||&#9745;||&#9745;||||
|Profile|Party uuid||&#9745;||&#9745;||||
|Profile|Role id||&#9745;||&#9745;||||
|Profile|Resource uuid||&#9745;||&#9745;||||
|Profile|Property uuid||&#9745;||&#9745;||||
|Profile|Document Identifier scheme||&#9745;||&#9745;||||
|Profile|Part id||&#9745;||&#9745;||||
|Profile|Param id||&#9745;||&#9745;||||
|Profile|Profile uuid||&#9745;||&#9745;||||
|Profile|Group id||&#9745;||&#9745;||||

#### **Component Definition Identifiers**
Identifiers defined in a component definition may be referenced locally or from an importing component definition instance.

|**Defining Model**|**Identifier**|**Catalog**|**Profile**|**Component**|**SSP**|**AP**|**AR**|**POA&M**|
|:------|:-------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|Component Definition|Location uuid|||&#9745;|||||
|Component Definition|Party uuid|||&#9745;|||||
|Component Definition|Role id|||&#9745;|||||
|Component Definition|Resource uuid|||&#9745;|||||
|Component Definition|Property uuid|||&#9745;|||||
|Component Definition|Document Identifier scheme|||&#9745;|||||
|Component Definition|Part id|||&#9745;|||||
|Component Definition|Param id|||&#9745;|||||
|Component Definition|Component Definition uuid|||&#9745;|||||
|Component Definition|Component uuid|||&#9745;|||||
|Component Definition|Capability uuid|||&#9745;|||||
|Component Definition|Control Implementation Set uuid|||&#9745;|||||
|Component Definition|Control Implementation uuid|||&#9745;|||||

#### **SSP Identifiers**
Identifiers defined in an SSP may be referenced locally or from an importing AP or POA&M.

|**Defining Model**|**Identifier**|**Catalog**|**Profile**|**Component**|**SSP**|**AP**|**AR**|**POA&M**|
|:------|:-------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|SSP|Location uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Party uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Role id||||&#9745;|&#9745;||&#9745;|
|SSP|Resource uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Property uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Document Identifier scheme||||&#9745;|&#9745;||&#9745;|
|SSP|Part id||||&#9745;|&#9745;||&#9745;|
|SSP|Param id||||&#9745;|&#9745;||&#9745;|
|SSP|SSP uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Information Type uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Information Type Systematized id||||&#9745;|&#9745;||&#9745;|
|SSP|Diagram uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Leveraged Authorization uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Control Requirement uuid||||&#9745;|&#9745;||&#9745;|
|SSP|By-Component uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Provided uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Responsibility uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Inherited uuid||||&#9745;|&#9745;||&#9745;|
|SSP|Satisfied uuid||||&#9745;|&#9745;||&#9745;|

#### **AP Identifiers**
Identifiers defined in an AP may be referenced locally or from an importing AR.

|**Defining Model**|**Identifier**|**Catalog**|**Profile**|**Component**|**SSP**|**AP**|**AR**|**POA&M**|
|:------|:-------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|AP|Location uuid|||||&#9745;|&#9745;||
|AP|Party uuid|||||&#9745;|&#9745;||
|AP|Role id|||||&#9745;|&#9745;||
|AP|Resource uuid|||||&#9745;|&#9745;||
|AP|Property uuid|||||&#9745;|&#9745;||
|AP|Document Identifier scheme|||||&#9745;|&#9745;||
|AP|Assessment Method uuid|||||&#9745;|&#9745;||
|AP|Assessment Activity uuid|||||&#9745;|&#9745;||
|AP|Step uuid|||||&#9745;|&#9745;||
|AP|Task uuid|||||&#9745;|&#9745;||
|AP|Assessment Subject Placeholder uuid||||&#9745;|&#9745;||
|AP|Assessment Platform uuid|||||&#9745;|&#9745;||
|AP|Observation uuid|||||&#9745;|&#9745;||
|AP|Risk uuid|||||&#9745;|&#9745;||
|AP|Mitigating Factor uuid|||||&#9745;|&#9745;||
|AP|Implementation uuid|||||&#9745;|&#9745;||
|AP|Risk Log Entry uuid|||||&#9745;|&#9745;||
|AP|Remediation uuid|||||&#9745;|&#9745;||
|AP|Required Asset uuid|||||&#9745;|&#9745;||
|AP|Part uuid|||||&#9745;|&#9745;||
|AP|Assessment Plan uuid|||||&#9745;|&#9745;||

#### **AR Identifiers**
Identifiers defined in an AR may be referenced locally or from an importing POA&M.

|**Defining Model**|**Identifier**|**Catalog**|**Profile**|**Component**|**SSP**|**AP**|**AR**|**POA&M**|
|:------|:-------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|AR|Location uuid||||||&#9745;|&#9745;|
|AR|Party uuid||||||&#9745;|&#9745;|
|AR|Role id||||||&#9745;|&#9745;|
|AR|Resource uuid||||||&#9745;|&#9745;|
|AR|Property uuid||||||&#9745;|&#9745;|
|AR|Document Identifier scheme||||||&#9745;|&#9745;|
|AR|Assessment Method uuid||||||&#9745;|&#9745;|
|AR|Assessment Activity uuid||||||&#9745;|&#9745;|
|AR|Step uuid||||||&#9745;|&#9745;|
|AR|Task uuid||||||&#9745;|&#9745;|
|AR|Assessment Subject Placeholder uuid|||||&#9745;|&#9745;|
|AR|Assessment Platform uuid||||||&#9745;|&#9745;|
|AR|Observation uuid||||||&#9745;|&#9745;|
|AR|Risk uuid||||||&#9745;|&#9745;|
|AR|Mitigating Factor uuid||||||&#9745;|&#9745;|
|AR|Implementation uuid||||||&#9745;|&#9745;|
|AR|Risk Log Entry uuid||||||&#9745;|&#9745;|
|AR|Remediation uuid||||||&#9745;|&#9745;|
|AR|Required Asset uuid||||||&#9745;|&#9745;|
|AR|Part uuid||||||&#9745;|&#9745;|
|AR|Assessment Results uuid||||||&#9745;|&#9745;|
|AR|Assessment Result uuid||||||&#9745;|&#9745;|
|AR|Assessment Log Entry uuid||||||&#9745;|&#9745;|
|AR|Finding uuid||||||&#9745;|&#9745;|

#### **POA&M Identifiers**
Identifiers defined in a POA&M may be referenced locally.

|**Defining Model**|**Identifier**|**Catalog**|**Profile**|**Component**|**SSP**|**AP**|**AR**|**POA&M**|
|:------|:-------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|POA&M|Location uuid|||||||&#9745;|
|POA&M|Party uuid|||||||&#9745;|
|POA&M|Role id|||||||&#9745;|
|POA&M|Resource uuid|||||||&#9745;|
|POA&M|Property uuid|||||||&#9745;|
|POA&M|Document Identifier scheme|||||||&#9745;|
|POA&M|Assessment Method uuid|||||||&#9745;|
|POA&M|Assessment Activity uuid|||||||&#9745;|
|POA&M|Step uuid|||||||&#9745;|
|POA&M|Task uuid|||||||&#9745;|
|POA&M|Assessment Subject Placeholder uuid||||||&#9745;|
|POA&M|Assessment Platform uuid|||||||&#9745;|
|POA&M|Observation uuid|||||||&#9745;|
|POA&M|Risk uuid|||||||&#9745;|
|POA&M|Mitigating Factor uuid|||||||&#9745;|
|POA&M|Implementation uuid|||||||&#9745;|
|POA&M|Risk Log Entry uuid|||||||&#9745;|
|POA&M|Remediation uuid|||||||&#9745;|
|POA&M|Required Asset uuid|||||||&#9745;|
|POA&M|Part uuid|||||||&#9745;|
|POA&M|POA&M uuid|||||||&#9745;|
|POA&M|POA&M Item uuid|||||||&#9745;|

### **Consistency** 
Indicates how the identifier (value) should be managed across revisions of the same document.  In general, OSCAL identifiers have *`per-subject`* consistency, meaning that object identifiers (whether ID or UUIDs) should remain the same across minor of an OSCAL document IF the identifier refers to the same object (e.g., same location must have the same UUID or same control must have the same control ID as a document is revised).

