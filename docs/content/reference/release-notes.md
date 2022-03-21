---
title: OSCAL Release Notes
heading: Release Notes
weight: 15
suppressintopiclist: true
sidenav:
  title: Release Notes
toc:
  enabled: true
  headingselectors: "h2, h3, h4, h5, h6"
---

## OSCAL 1.0.2 Release

The following changes were made in this patch release.

- #1035 Upgrade Saxon version used in CI/CD to 10.6 (#PR 1187) @david-waltermire-nist
- #1093 Parameterize insertion of xsi:schemaLocation attribute in the content upgrader XSLTs; this feature is disabled by default (#1162) @aj-stein-nist, @wendellpiez
   - Parameterized insertion of xsi:schemaLocation in RC2->1.0.0 content upgrader.
   - Created README for content upgraders, document schema-location param.
   - Added pointer from README.txt to content-upgrade docs, per @david-waltermire-nist's sync meeting review.
- #1121 Added embeded diagram of CI/CD workflow. (PR #1165) @aj-stein-nist
- #1130 Changed remarks fields from define-field to ref. (PR #1138) @guyzyl
- #1137 Replace `define-assembly` for `include-all` with `assembly ref` (PR #1144) @guyzyl, @david-waltermire-nist
- A bunch of updates to the Profile Resolution Specififcation to clarify and improve the specification. (PR #1172) @stephenbanghart, @aj-stein-nist
   - #1140 Significant improvements around resolution of internal references. Behavior is now defined for resolving resources with different combinations of "rlink" and "base64". As these /should/ all be equal to one another, there is no standardized order or priority given in the specification at this time.
   - #1141 Enhanced prose around Group handling, especially around expected behavior of the "keep always" prop.
   - #1142 Core issue obsoleted by general OSCAL requirements on valid OSCAL documents. Cleaned up prose in the formats section.
   - #1152 Added Metaschema entries for the new Mapping assembly and it's associated fields/flags. Verified the veracity of existing Profile documentation, making minor-moderate edits to bring documentation up to speed with the current specification.
   - #1155 Fixed incorrect notation in metadata section: props are now properly refereed to as such, rather than using the value of their "name" field.
- #1153 Added README explaining content validation concepts. (PR #1170) @aj-stein-nist, @wendellpiez, @david-waltermire-nist
- #1153 Added information about content well-formedness and validation to the website. (PR #1169) @aj-stein-nist, @wendellpiez, @david-waltermire-nist
- #1176 Removed stale `NEW CONTENT`, `END NEW CONTENT`, and `NEW` comment blocks from Metaschemas. (PR #1179) @guyzyl
- Multiple changes to the Profile Resolution Specification. (PR #1089)  @stephenbanghart, @aj-stein-nist
   - Tagged Requirements (updated .rnc), Added Draft Status, several small fixes in modify section
   - Applying AJ's fixes, other various small fixes - pending larger automated formating
   - Intro purpose rewrite. Editorial fixes from comments. Small edits to "Processing" page on site.
- Added DRT Strategies Inc GRC tool to tools page (PR #1122) @vmangat
- Add Rules Presentation from January 21, 2022 Meeting (PR #1125) @aj-stein-nist
- Add tool oscal4neo4j to tools page (#1128) @Agh42, @bradh
- Remove extra `>` which shows in the built schemas (PRs #1133, #1147) @guyzyl
- Fix broken links to FedRAMP baselines (PR #1143) @rosskarchner 
- Bumped nokogiri from 1.12.5 to 1.13.3 in /docs (PR #1154) @dependabot
- Updated core repo documentation (PR #1157) @david-waltermire-nist, @aj-stein-nist
   - Updated readmes with more current and relevant information.
   - Added CODEOWNERS to drive reviews.
   - Updated .github/PULL_REQUEST_TEMPLATE.md
- Removed duplicated risk status construct in the assessment commonm Metaschema (PR #1159) @david-waltermire-nist
- Updated Tools with Additional Open Source Projects (PR #1164) @rgauss
- Fixed broken links in `README.md` (PR #1181) @guyzyl
- Renamed `.github/README.md` file to `ABOUT.md` to fix the main index page in the GitHub repo (#1182) @guyzyl
- Added mailing list names to contact page.

The following compatibility breaking change was made:
- In all JSON schemas, the name "props" is used to signify the list of metadata properties. There was one case where the name prop is used instead of props. Fixes this obvious typo in the assessment results metaschema. (PR #1148) @guyzyl

## OSCAL 1.0.1 Release

The following changes were made in this patch release.

- #635, #966 Cleaned up src/utils directory and added documentation (PR #970, #1014) @wendellpiez
- #956 Enhanced the schema production pipeline to ensure that high-order Unicode characters are properly escaped (PR usnistgov/ metaschema#165) @wendellpiez
- #958 Fixed an issue in the content upconverter used for updating OSCAL content from 1.0.0 RC2 to 1.0.0 (PR #960) @wendellpiez
- #983 Fix Dockerfile entrypoint using best practices for entrypoint. (PR #984) @ohsh60
- #986 Updated dependency versions for Saxon and AJV in the Docker config. Added dependencies for yargs. (PR #987) @ohsh60
- #1001 Fixed bad metapath. @david-waltermire-nist
- #1004 Refactored dockerfiles for the build and docs folders. Updated use documentation. Added missing dependency for calabash. (PR #1005) @david-waltermire-nist
- #1020 Updated documentation around using the content converters. (PR #1027, #1055) @wendellpiez
- #1025 Fixed SyntaxWarning for content validator oscal-content-validator.py (PR #1026) @bradh, @david-waltermire-nist
- #1037 Clarify data types docs for param insert (PR #1112)
- #1039, #1040, #1041, #1042, #1046 Updated the profile resolution specification (PR #1014, #1017) @stephenbanghart
- #1044 Added warnings for non-required UUID flags. @david-waltermire-nist
- #1053 Make @control-id for alter statements in profile required (PR #1111) @aj-stein-nist
- #1067 Fix enum typo from inteneral->internal (PR #1110) @aj-stein-nist
- #1102 Some Docker container improvements for local web development and testing for PRs (PR #1103) @aj-stein-nist
- #1107 Incorporating processing directives that support schematron validation of Metaschema-based models (#1108) @aj-stein-nist
- usnistgov/oscal-content/#59 Convert File Type for Files or Remote Hyperlinks in Continuous Deployment (PR #1010, 1070) @ohsh6o, @david-waltermire-nist
- Fixed broken branch configuration for the metaschema submodule (PR #991) @ohsh60
- Fixed OSCAL constraints in Metaschemas. Fixing Metapath syntax errors. (PR #1012, #1065) @david-waltermire-nist
- Repaired a bug report on a missed control; adding test files (PR #1013) @wendellpiez
- Removed duplicate json import in oscal-content-validator.py (PR #1077) @flickerfly
- Improvements to XSLT-based profile resolver (PR #1071) @wendellpiez
- Added requirements.txt for oscal-content-validator.py (PR #1077) @guyzyl
- Add support for yaml OSCAL files validation (PR #1091) @guyzyl, @aj-stein-nist
- Updated contributing and pull request documentation for External Developers (#1094) @aj-stein-nist
- Bump addressable from 2.7.0 to 2.8.0 in /docs (PR #994) @dependabot
- Bump nokogiri from 1.11.5 to 1.12.5 in /docs (PR #1029) @dependabot
- Bump lxml from 4.6.3 to 4.6.5 in /build/ci-cd/python (PR #1096) @dependabot

### Website changes

- #739 Fixed 404 error when using the "Improve this page" link. (PR #995) @EasyDynamics, @david-waltermire-nist
- #854 Added a Component Tutorial to Website (PR #935, #1015) @Rene2mt, @david-waltermire-nist
- #860 Updated model reference documentation to better clarify the scope and uniqueness of identifiers used within the OSCAL models. (PR #941) @Rene2mt, @david-waltermire-nist, @aj-stein-nist
- #947 Fixed a number of typos (PR #955) @david-waltermire-nist
- #968 Fixed broken and stale links in model documentation. (PR #973) @david-waltermire-nist
- #993 Updating tools page to use a table. Added Compliance Tressle. @iMichaela, @david-waltermire-nist
- #996 Added blogs to website. @david-waltermire-nist
- #1049 Added control freak to the OSCAL tools page (PR #1104) @aj-stein-nist
- Fixed prop syntax in validation component tutorial. (PR #999) @ohsh60
- Added link to EasyDynamics OSCAL tools (PR #1009) @afeld
- Adding link to XML Jelly Sandwich OSCAL demos (PR #1016) @wendellpiez
- Updated the Lunch with Devs meeting info and Tools page to include new meeting info (PR #1045) @iMichaela, @david-waltermire-nist

## OSCAL 1.0.0 Release

The following changes were made in OSCAL 1.0.0 since OSCAL 1.0.0 Release Candidate (RC) 2.

### Overall changes

The following general changes were made in this release.

- In prior releases for some JSON objects, an object's identifier was used as a property.

  For example:
  ```json
  {
    "identifer1": {
      "comment": "remainder of object 1"
    },
    "identifer2": {
      "comment": "remainder of object 2"
    }
  }
  ```
  
  While this "BY_KEY" notation does enforce uniqueness of identifiers, this syntax is difficult to write parsers for. This release removes the use of this syntax in favor of a simple array of objects. See issue [usnistgov/OSCAL#914](https://github.com/usnistgov/OSCAL/issues/914).
  
- In prior OSCAL releases, the data types used in the OSCAL XML and JSON schemas did not require that provided strings are non-empty (see issue [usnistgov/OSCAL#805](https://github.com/usnistgov/OSCAL/issues/805)), and leading and trailing whitespace was also allowed (see issue [usnistgov/OSCAL#805](https://github.com/usnistgov/OSCAL/issues/805)). Some XML parsers that are schema aware are capable of removing this extra whitespace based on the `whiteSpace="collapse"` schema facet. This only works if the parser is schema aware. To normalize this behavior across all parsers, the OSCAL string data types will now not allow leading and trailing whitespace.

  This led to updates to the string data types in XML and JSON. The `ncname` data type was also replaced by `token` (see issue [usnistgov/OSCAL#911](https://github.com/usnistgov/OSCAL/issues/911)).

### Changes to Profile Model

In /profile/modify/alter ([JSON/YAML](/reference/latest/profile/json-reference/#/profile/modify/alters), [XML](/reference/latest/profile/xml-reference/#/profile/modify/alter)) the following changes were made. See issue [usnistgov/OSCAL#928](https://github.com/usnistgov/OSCAL/issues/928).

- The item remove ([JSON/YAML](/reference/latest/profile/json-reference/#/profile/modify/alters/removes), [XML](/reference/latest/profile/xml-reference/#/profile/modify/alter/remove)) has had its child properties/attributes renamed as follows:
  - name-ref -> by-name
  - class-ref -> by-class
  - id-ref -> by-id
  - item-name -> by-item-name
  - ns-ref -> by-ns

- The item add ([JSON/YAML](/reference/latest/profile/json-reference/#/profile/modify/alters/adds), [XML](/reference/latest/profile/xml-reference/#/profile/modify/alter/add)) has had its child properties/attributes renamed as follows:
  - id-ref -> by-id

### Changes to System Security Plan Model

In /system-security-plan/control-implementation/implemented-requirement ([JSON/YAML](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements), [XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/control-implementation/implemented-requirement))

- The item control-id ([JSON/YAML](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements/control-id), [XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/control-implementation/implemented-requirement/@control-id)) is now required
- In XML the ordering of elements has changed (i.e. responsible-role was moved in the sequence). This change was made to keep the XML element sequencing consistent between this model and the component definition model.

### Changes to Assessment Results Model

- The item findings ([JSON/YAML](/reference/latest/assessment-results/json-reference/#/assessment-results/results/findings), [XML](/reference/latest/assessment-results/xml-reference/#/assessment-results/result/finding)) is now optional. See issue [usnistgov/OSCAL#918](https://github.com/usnistgov/OSCAL/issues/918).

## OSCAL 1.0.0 Release Candidate 2

The following changes were made in OSCAL 1.0.0 Release Candidate (RC) 2 since OSCAL 1.0.0 RC 1.

- Simplification of key OSCAL features
  - Properties and annotations have been merged into a single `prop` that now allows an optional `remarks` and `uuid`.
  - In the  assessment plan and assessment results models, the concepts of a `task` and `action` have been combined.
  - Use of `local-definitions` in the assessment plan, assessment results, and POA&M models has been simplified and made more consistent.
- Model documentation improvements
  - Some usage descriptions were enhanced to provide more detail and to be more consistent overall.
  - Formal names were updated in some places where the names did not match the data element.
  - Many spelling errors were corrected.
- Removed the use of XML `<any>` and JSON `additonalProperties` for arbitrary extensions based on community discussion. Extended data can still be provided using `link` declarations to external content. This decision can be revisited in future revisions once there is more implementation experience with the OSCAL models.
- Added the following `link` relations: `latest-version`, `predecessor-version`, and `successor-version` to allow an OSCAL document to link to latest, previous, and next document revisions.
- Fixed a few bugs in the profile resolver code and updated the resolver to work with new profile import/insert structures.
- Provided support for data insertion points for data other than parameters in markup content.

### Changes common to all models

- "props" and "annotations" in JSON, and "prop" and "annotation" in XML, have been merged into a single property that now allows an optional `remark` and `uuid`. Semantically, the optional `remark` and `uuid` were the only difference between a "prop" and an "annotation" in OSCAL. The resulting model is simpler with a single construct that will always allow a remark. Names and values that were allowed on annotations are now allowed on properties.
- `latest-version`, `predecessor-version`, and `successor-version` link relations were added to allow an OSCAL document to link to latest, previous, and next document revisions.
- Markup content may now contain data insertion points for data other than parameters. The `insert` object, which may appear in markup content strings, now supports a `type` which can be used to indicate the type of data to insert, and an `id-ref` that identifies the specific data object to take data from.

### Model-Specific Changes

#### Catalog and Profile

- Remarks were added to `param` declarations.
- The import/insert structure in OSCAL profiles has been updated to align with the include/exclude syntax used in the assessment models. This lays the groundwork for more dynamic extension and expansion of include/exclude capabilities in future releases.

#### Component Definition

- `set-parameter` was added to `/component-definition/component(s)//control-implementations` to allow for parameter values to be more conveniently defined for all control implementations.

#### Assessment Plan and Assessment Results

- The concepts of task and action were combined, resulting in only the concept of a task. A task now has a type, which defines if the task is a "milestone" or "action". This resulted in the following changes:
  - `/assessment-results/results/local-definitions/action(s)` was removed.
  - `/assessment-results/results/assessment-log/entry/related-action(s)` was removed.
  - A task can now define a `dependency` on another task.
- In multiple locations `assessment-subject` has been renamed to `subject` to be more consistent. Before there was a mixture of names.
- In JSON the `/assessment-plan/terms-and-conditions//parts` is always an array. In RC1, if a single part object was provided, the value was a single object.
- In JSON the `/assessment-results/local-definitions/add-objectives-and-methods` was renamed to "objectives-and-methods". Similarly, in XML `/assessment-results/local-definitions/add-objectives-and-methods` was renamed to "objectives-and-methods".
- In JSON and XML `/assessment-results/results/local-definitions/assessment-assets` has been added to allow each result to declare which assessment assets were used during the assessment, if these assets differ from what was defined in the assessment plan. This construct was moved from `/assessment-results/results`.
- In JSON and XML `/assessment-results/results/assessment-subject` has been removed. This was originally used to add subjects that were not found in the assessment plan or SSP. In `/assessment-results/results/local-definitions` you can specify `component(s)`, `inventory-item(s)`, and `user(s)` definitions. These allow the identification of subjects that are not in the assessment plan or SSP, making `assessment-subject` unneeded.
- In `/assessment-results/results/finding` the `collected` and `expires` was removed, since this is an aspect of the observation, not the finding.
- In `/assessment-results/results/finding` the `objective-status` has been replaced by `finding-target` which can now be used to provide a status on a per-subject basis. This allows a finding to be associated with multiple related subjects that might have different states.

## OSCAL 1.0.0 Release Candidate 1

The following changes were made in OSCAL 1.0.0 Release Candidate (RC) 1 since OSCAL 1.0.0 Milestone 3.

Changes in this release have been focused on the following major areas:
- Making naming in XML and JSON/YAML more consistent.
- Ensuring that all data types and cardinalities are appropriate.
- Refactoring to cleanup models, making them: 1) more consistent with the other OSCAL models, 2) making them more simple when possible, and 3) providing room for future addition of new features.

### Changes common to all models

- many elements in XML, and properties in JSON and YAML, have been renamed to make the naming more consistent between elements names in XML and property names in JSON and YAML. Now JSON properties that contain an array of objects use a plural form of the XML element name. The one exception is "prop" in XML vs "properties" in JSON and YAML. This decision was made to make the XML use of "prop" more concise, since "prop" elements are used a good deal in OSCAL XML formats.

#### Changes to all XML formats

In {top-level-element}/metadata:
- renamed "revision-history" to "revisions"
- renamed "doc-id" to "document-id"

In {top-level-element}/metadata/document-id:
- renamed "type" to "scheme"

In {top-level-element}/metadata/link:
- Defined allowed values for the "rel" property

In {top-level-element}/metadata/location:
- renamed "email" to "email-address"
- renamed "phone" to "telephone-number"

In {top-level-element}/metadata/location/prop:
- Defined allowed values for the "name" attribute. Using the "type" as the name attribute value, you can now specify that a location is a "data-center" location and also use the "class" attribute to qualify the data center location as "primary" or "alternate".

In {top-level-element}/metadata/party:
- renamed "party-name" to "name"
- renamed "email" to "email-address"
- renamed "phone" to "telephone-number"
- changed sequencing of where "address" appears
- made use of address and location-uuid mutually exclusive, since either a static address or a reference to location provides similar functionality. The "location-type" attribute has been removed. This should data should now be described on the referenced "location" element using a prop element with a name of "type".

In {top-level-element}/metadata/party/prop:
- Defined allowed values for the "name" attribute. This can be used to provide a "mail-stop", "office", or "job-title".

In {top-level-element}/metadata/party/external-id:
- renamed "type" to "scheme"

In {top-level-element}/metadata/role:
- renamed "desc" to "description"

In {top-level-element}/back-matter/resource:
- renamed "desc" to "description"
- renamed "doc-id" to "document-id"

In {top-level-element}/back-matter/resource/prop:
- defined allowed values "type", "version", and "published" for the "name" property.

In {top-level-element}/metadata/resource/document-id:
- renamed "type" to "scheme"

In {top-level-element}/back-matter/resource/rlink:
- changed type from "uri" to "uri-reference"

Changes to all "prop" elements:
- changed the data type of "ns" to "uri"
- renamed "id" to "uuid" and changed type to "uuid"

Changes to all "annotation" elements:
- changed the data type of "ns" to "uri"
- renamed "id" to "uuid" and changed type to "uuid"

#### Changes to all JSON and YAML formats

In {top-level-object}/metadata:
- renamed "revision-history" to "revisions"
- renamed "properties" to "props"

In {top-level-object}/metadata/revisions:
- renamed "properties" to "props"

In {top-level-object}/metadata/document-ids:
- renamed "type" to "scheme" and changed to data type from "string" to "uri"

In {top-level-object}/metadata/links:
- Defined allowed values for the "rel" property

In {top-level-object}/metadata/locations
- renamed "URLs" to "urls"
- renamed "properties" to "props"

In {top-level-object}/metadata/locations/props:
- Defined allowed values for the "name" property. Using the "type" prop name, you can now specify that a location is a "data-center" location and also use the "class" property to qualify the data center location as "primary" or "alternate".

In {top-level-object}/metadata/parties:
- renamed "party-name" to "name"
- renamed "properties" to "props"
- made use of addresses and location-uuids mutually exclusive, since either a static address or a reference to location provides similar functionality. The "location-type" property on "location-uuid" has been removed. This should data should now be described on the referenced "location" element using a prop element with a name of "type".

In {top-level-object}/metadata/parties/props:
- defined allowed values for the "name" property. This can be used to provide a "mail-stop", "office", or "job-title".

In {top-level-object}/metadata/parties/external-ids:
- renamed "type" to "scheme"

In {top-level-object}/metadata/roles:
- renamed "desc" to "description"
- renamed "properties" to "props"

In {top-level-object}/back-matter/resources:
- renamed "desc" to "description"
- renamed "properties" to "props"

In {top-level-object}/back-matter/resources/props:
- defined allowed values "type", "version", and "published" for the "name" property.

In {top-level-object}/back-matter/resources/citation:
- renamed "properties" to "props"

In {top-level-object}/back-matter/resources/document-ids:
- renamed "type" to "scheme" and changed to data type from "string" to "uri"

In {top-level-object}/back-matter/resources/rlinks:
- changed type from "uri" to "uri-reference"

Changes to all "props" objects:
- changed the data type of "ns" to "uri"

Changes to all "annotations" objects:
- changed the data type of "ns" to "uri"
- the "value" property is now required.

Changes to all "address" or "addresses" objects:
- renamed "postal-address" to "addr-lines"

Changes to all "responsible-party" objects:
- renamed "properties" to "props"

Changes to all "responsible-role" objects:
- renamed "properties" to "props"
- renamed "party-ids" to "party-uuids"

### Changes to common to the catalog and profile models

The following changes have been made to format structures that are shared between the formats for the catalog and profile models.

#### Changes affecting the catalog and profile XML formats

Changes to all "part" elements:
- changed the data type of "ns" to "uri"

Changes to all "param" elements:
- added the "prop" and "link" elements.
- changed the sequencing of where "link" appears to be consistent with other elements that include "link".
- changed the data type of "usage" from "markup-line" to "markup-multiline"
- changed "constraint" from an element with a text value, to an element with child elements. The text value is now contained in the "description" element. Also changed the "test" attribute to be a sequence of child "test" elements, with the text value now contained in the "expression" child element of "test". This structure will allow for more extension going forward.
- changed the cardinality of "value" to allow for multiple values". The data type of a value has changed from markup-line to string.

#### Changes affecting the catalog and profile JSON and YAML formats

Changes to all "part" or "parts" objects:
- changed the data type of "ns" to "uri"
- renamed "properties" to "props"
- added allowed values "label" and "sort-id" for props/name.

Changes to all "param" or "params" objects:
- added the "props" and "links" properties.
- changed the data type of "usage" from "markup-line" to "markup-multiline"
- renamed "guidance" to "guidelines"
- renamed "value" to "values". Also, changed the cardinality of "value" to allow for multiple "values". The data type of a value has changed from markup-line to string.
- changed the sequencing of where "link" appears to align with similar elements in OSCAL.

For params/select/how-many:
- renamed "alternatives" to "choices"

For params/select/how-many/alternatives:
- renamed "RICHTEXT" property to "value"

For params/constraints:
- renamed "detail" to "description". Change the data type from "string" to "markup-multiline".
- renamed "test" to "tests", which is now an array of objects.
  - The original "test" string value is now stored in the child object's "expression" property.
  - Added a new "remarks" property.


### Changes to the catalog model

The following changes have been made in the XML, JSON, and YAML formats for the OSCAL catalog model.

#### Changes to the catalog XML format

For /catalog//group and /catalog//control:
- defined allowed values for prop/@name

#### Changes to the catalog JSON and YAML formats

For /catalog, /catalog//groups, and /catalog//controls:
- renamed "parameters" to "params"

For /catalog//groups and /catalog//controls:
- renamed "properties" to "props"
- defined allowed values for props/name

### Changes to the profile model

The following changes have been made in the XML, JSON, and YAML formats for the OSCAL profile model.

#### Changes to profile XML format

For /profile/merge/custom//groups:
- added "annotation" and "link"

For /profile/modify/set-parameter:
- added "prop" and "annotation"
- change sequencing of where "link" appears

For /profile/modify/alter/add:
- defined allowed values for prop/@name

#### Changes to profile JSON and YAML formats

For /profile/imports/(include|exclude):
- renamed "id-selectors" to "calls"
- renamed "pattern-selectors" to "matches"

For /profile/merge/custom//groups:
- renamed "parameters" to "params"
- renamed "properties" to "props"
- added "annotations" and "links"

For /profile/modify:
- renamed "parameter-settings" to "set-parameters"
- renamed "alterations" to "alters"

For /profile/modify/set-parameters:
- added "props" and "annotations"
- renamed "usages" to "usage", and changed data type from an array of "string" to "markup-multiline"

For /profile/modify/alters:
- renamed "removals" to "removes"
- renamed "additions" to "adds"

For /profile/modify/alters/adds:
- renamed "parameters" to "params"
- renamed "properties" to "props"
- defined allowed values for props/name

### Changes to the system security plan (SSP) model

A number of changes have been made to the SSP model to support the use of leveraged authorizations. Another key change is the use of the "this-system" component to define controls at the system-level. This now means that all SSPs will make use of at least one component.

The following changes have been made in the XML, JSON, and YAML formats for the OSCAL SSP model.

#### Changes to the SSP XML format

For /system-security-plan/system-characteristics:
- added allowed values for prop/@name, annotation/@name, link/@rel, and responsible-roles/role-id

For /system-security-plan/system-characteristics/*/diagram:
- added "annotation"
- changed the data type of "caption" from "string" to "markup-line"
- added allowed values for link/@rel="diagram", which allows for the linking of an image to use for the diagram.

For /system-security-plan/system-characteristics/system-information/information-type:
- renamed "id" to "uuid"
- changed structure of "information-type-id" to be wrapped by an outer "categorization", which now defines the "system" for all referenced information type identifiers.
- added "annotation"

For /system-security-plan/system-characteristics/system-information/information-type/*-impact:
- added "annotation" and "link"

For /system-security-plan/system-implementation/leveraged-authorization:
- defined additional allowed values "implementation-point", "leveraged-authorization-uuid", "inherited-uuid" for prop/@name, which provides traceability to a leveraged SSP
- defined allowed values for link/@rel

For /system-security-plan/system-implementation/user:
- defined allowed values for annotation/@name and role-id

For /system-security-plan/system-implementation/component:
- renamed "component-type" to "type", and updated allowed values
- defined allowed values for prop/@name, annotation/@name, link/@rel, and responsible-role/@role-id

For /system-security-plan/system-implementation/inventory-item:
- moved "@asset-id" to a required prop/@name
- defined allowed values for prop/@name, annotation/@name, link/@rel, and responsible-role/@role-id

For /system-security-plan/system-implementation/inventory-item/implemented-component:
- renamed "component-id" to "component-uuid"
- defined allowed values for prop/@name, annotation/@name, and responsible-party/@role-id
- removed "use", since this is capturing similar information to the component's type

For /system-security-plan/control-implementation/implemented-requirement:
- removed "description"
- added allowed values for annotation/@name including "implementation-status", "control-origination"
- added allowed values for prop/@name including "leveraged-authorization" to indicate if a control implementation is inherited from an underlying authorized system
- added allowed values for responsible-role/$role-id
- changed the sequencing of "set-parameter" and "responsible-role"

For /system-security-plan/control-implementation/implemented-requirement/by-component:
- renamed "component-id" to "component-uuid"
- added "export", "inherited", and "satisfied" to support documenting leveraged authorizations
- added "remarks" to allow for adding general commentary
- changed the sequencing of where "set-parameter" appears

For /system-security-plan/control-implementation/implemented-requirement/statement:
- removed "description"

For /system-security-plan/control-implementation/implemented-requirement/statement/by-component:
- renamed "component-id" to "component-uuid"
- added "export", "inherited", and "satisfied" to support documenting leveraged authorizations
- added "remarks" to allow for adding general commentary
- changed the sequencing of where "set-parameter" appears

#### Changes to the SSP JSON and YAML formats

For /system-security-plan/system-characteristics:
- renamed "properties" to "props"
- added allowed values for props/name, annotations/name, links/rel, and responsible-roles/role-id

For /system-security-plan/system-characteristics/*/diagrams:
- added "annotation"
- changed the data type of "caption" from "string" to "markup-line"
- added allowed values for link/@rel="diagram", which allows for the linking of an image to use for the diagram.

For /system-security-plan/system-characteristics/system-information:
- renamed "properties" to "props"

For /system-security-plan/system-characteristics/system-information/information-types:
- renamed "id" to "uuid"
- changed structure of "information-type-ids" to be wrapped by an outer "categorizations", which now defines the "system" for all referenced information type identifiers.
- added "annotations"

For /system-security-plan/system-characteristics/system-information/information-types/*-impact:
- added "annotations" and "links"

For /system-security-plan/system-characteristics/authorization-boundary:
- renamed "properties" to "props"

For /system-security-plan/system-characteristics/network-architecture:
- renamed "properties" to "props"

For /system-security-plan/system-characteristics/data-flow:
- renamed "properties" to "props"

For /system-security-plan/system-implementation:
- renamed "properties" to "props"

For /system-security-plan/system-implementation/leveraged-authorizations:
- defined additional allowed values "implementation-point", "leveraged-authorization-uuid", "inherited-uuid" for prop/name, which provides traceability to a leveraged SSP
- defined allowed values for links/rel

For /system-security-plan/system-implementation/users:
- defined allowed values for annotation/name and role-id

For /system-security-plan/system-implementation/components:
- renamed "component-type" to "type", and updated allowed values
- defined allowed values for props/name, annotations/name, links/rel, and responsible-roles/role-id

For /system-security-plan/system-implementation/inventory-items:
- moved "asset-id" to a required props/name
- defined allowed values for props/name, annotations/name, links/rel, and responsible-parties/role-id

For /system-security-plan/system-implementation/inventory-items/implemented-components:
- renamed "component-id" to "component-uuid"
- defined allowed values for props/name, annotations/name, and responsible-parties/role-id
- removed "use", since this is capturing similar information to the component's type

For /system-security-plan/control-implementation/implemented-requirements:
- removed "description"
- renamed "properties" to "props"
- added allowed values for annotations/name including "implementation-status", "control-origination"
- added allowed values for props/name including "leveraged-authorization" to indicate if a control implementation is inherited from an underlying authorized system
- added allowed values for responsible-roles/role-id

For /system-security-plan/control-implementation/implemented-requirements/by-components:
- renamed "component-id" to "component-uuid"
- added "export", "inherited", and "satisfied" to support documenting leveraged authorizations
- added "remarks" to allow for adding general commentary

For /system-security-plan/control-implementation/implemented-requirements/statements:
- removed "description"

For /system-security-plan/control-implementation/implemented-requirements/statements/by-components:
- renamed "component-id" to "component-uuid"
- added "export", "inherited", and "satisfied" to support documenting leveraged authorizations
- added "remarks" to allow for adding general commentary

### Changes to the component definition model

Overall, this model was updated to bring the structure of components into alignment with how components are organized in the system security plan model.

The following changes have been made in the XML, JSON, and YAML formats for the OSCAL component definition model.

#### Changes to the component definition XML format

For /component-definition:
- added "uuid"

For /component-definition/component:
- removed "name"
- changed the data type of "title" from "string" to "markup-line"
- changed the data type of "description" from "string" to "markup-multiline", added a "description" wrapper.
- added "prop" and "annotation"
- changed the sequencing of where "link" appears
- replaced "responsible-party" with "responsible-role"
- added "protocol", which can be used to specify protocol information for a "service" or "network" component
- changed "remarks" adding "remarks" wrapper
- defined allowed values for prop/@name, annotation/@name, link/@rel, and responsible-role/@role-id
- renamed "component-type" to "type", and updated allowed values

For /component-definition/component/control-implementation:
- changed data type of "uuid" from "string" to "uuid"
- changed the data type of "description" from "string" to "markup-multiline", added a "description" wrapper.

For /component-definition/component/control-implementation/implemented-requirement:
- changed data type of "uuid" from "string" to "uuid"
- changed the data type of "description" from "string" to "markup-multiline", added a "description" wrapper.

For /component-definition/capabilities:
- changed the data type of "description" from "string" to "markup-multiline", added a "description" wrapper.
- changed "remarks" adding "remarks" wrapper

#### Changes to the component definition JSON and YAML formats

For /component-definition:
- added "uuid"

For /component-definition/components:
- removed "name"
- changed the data type of "title" from "string" to "markup-line"
- changed the data type of "description" from "string" to "markup-multiline"
- added "props" and "annotations"
- replaced "responsible-parties" with "responsible-roles"
- added "protocols", which can be used to specify protocol information for a "service" or "network" component
- defined allowed values for props/name, annotations/name, links/rel, and responsible-roles/role-id
- renamed "component-type" to "type", and updated allowed values

For /component-definition/components/control-implementations:
- changed data type of "uuid" from "string" to "uuid"
- changed the data type of "description" from "string" to "markup-multiline"
- renamed "properties" to "props"

For /component-definition/components/control-implementations/implemented-requirements:
- changed data type of "uuid" from "string" to "uuid"
- changed the data type of "description" from "string" to "markup-multiline"
- renamed "properties" to "props"

For /component-definition/capabilities:
- changed the data type of "description" from "string" to "markup-multiline"
- renamed "properties" to "props"

### Refactoring of the assessment and assessment result layer models

The assessment plan, assessment results, and plan of actions and milestones models have undergone some significant revisions. These revisions have been based on community feedback and a need to provide more extensibility for future growth. Extra review of these models is appreciated as we make preparations for the OSCAL 1.0.0 FINAL release.

### Changes to the assessment plan model

Due to the nature of changes in this model, the following documentation details how the new model roughly maps to the older 1.0.0-milestone3 model. The following changes have been made in the XML, JSON, and YAML formats for the OSCAL assessment plan model.

#### Changes to the assessment plan XML format

/assessment-plan/local-definitions

- The structures located in /assessment-plan/assessment-subjects/local-definitions has been moved here. This includes the component, inventory-item, and user element constructions. This allows all content that augments the content from the referenced SSP to be located within a top-level element.
- The "add-objectives-and-methods" element has been added which allow the definitions of new assessment objectives and methods which are to be used in the assessment, but are not located in the catalog for which the system's baseline is generated from. This replaces the original elements located in /assessment-plan/objectives/objective and /assessment-plan/objectives/method.
- The "activity" element has been added to allow an assessment process to be defined. These assessment activities can then be referenced by a specific assessment-action.

/assessment-plan/terms-and-conditions

- This new element provides a means to include textual front matter in the assessment plan. This can be used to define rules of engagement, activities to include/exclude from assessments, instructions for delivering results, etc.

/assessment-plan/reviewed-controls

- This element includes constructs that previously appeared under /assessment-plan/objectives in the "controls" and "control-objectives" elements. We believe the inclusion/exclusion syntax used now is simpler, more concise, and easier to process.

/assessment-plan/assessment-subject

- This element replaces the previous /assessment-plan/assessment-subjects element.
- The old version intermixed included and excluded subjects of different types.
- The new construction pairs includes/excludes of a given type, which should make processing easier and more straightforward.

/assessment-plan/assessment-assets

- This new element replaces the previous /assessment-plan/assets element.
- The old element allowed tools to be defined and used "origination" as a way to loosely associate information (e.g., IP addresses used with assessment tools) with these tools.
- The new construction allows for "assessment-platforms" to be identified, which can combine referenced tool components using "uses-component" in multiple combinations providing more control over defining information about tooling used during an assessment. Information that applies to the platform, such as IP addresses used, can be defined using the "prop" element on the "assessment-platform".

/assessment-plan/assessment-action

- This new element replaces the /assessment-plan/assessment-activities/test-method element.
- The old element required that information about an assessment process was defined by a "test-method".
- The new construction allows:
  - The use of "associated-activity" to reference an "activity" defined under /assessment-plan/local-definitions, which allows the same activity to be used multiple times across different assessment-action elements.
  - Use of "assessment-subject" to define in a fine-grained the targeting of subjects the assessment-action are to be performed against.
  - Use of the "responsible-role" element to identify assessment roles and optionally parties which are associated with the action.

/assessment-plan/task

- This element updates the old element located in /assessment-plan/assessment-activities/schedule/task
- "title" is now required.
- "activity-uuid" is replaced with "related-action".
- "party-uuid" and "location-uuid" is now specified on a per-action basis using the referenced "assessment-action" element's "assessment-subject" entries, which allows both parties and locations to be subjects.
- "compare-to" has been removed, since this was intended to be used in assessment-results only.

#### Changes to the assessment plan JSON and YAML formats

/assessment-plan/local-definitions

- The structures located in /assessment-plan/assessment-subjects/local-definitions has been moved here. This includes the components, inventory-items, and users object constructions. This allows all content that augments the content from the referenced SSP to be located within a top-level element.
- Use of "protocols" has been removed in lieu of defining "network" or "service" components under local-definitions.
- The "add-objectives-and-methods" object array has been added which allow the definitions of new assessment objectives and methods which are to be used in the assessment, but are not located in the catalog for which the system's baseline is generated from. This replaces the original objects located in /assessment-plan/objectives/objectives and /assessment-plan/objectives/method-definitions.
- The "activities" object array has been added to allow an assessment process to be defined. These assessment activities can then be referenced by a specific assessment-action.

/assessment-plan/terms-and-conditions

- This new object provides a means to include textual front matter in the assessment plan. This can be used to define rules of engagement, activities to include/exclude from assessments, instructions for delivering results, etc.

/assessment-plan/reviewed-controls

- This element includes constructs that previously appeared under /assessment-plan/objectives in the "control-group" and "control-objective-group" object arrays. We believe the inclusion/exclusion syntax used now is simpler, more concise, and easier to process.

/assessment-plan/assessment-subject

- This element replaces the previous /assessment-plan/assessment-subjects element.
- The old version intermixed included and excluded subjects of different types.
- The new construction pairs includes/excludes of a given type, which should make processing easier and more straightforward.

/assessment-plan/assessment-assets

- This new element replaces the previous /assessment-plan/assets element.
- The old element allowed tools to be defined and used "origination" as a way to loosely associate information (e.g., IP addresses used with assessment tools) with these tools.
- The new construction allows for "assessment-platforms" to be identified, which can combine referenced tool components using "uses-components" in multiple combinations providing more control over defining information about tooling used during an assessment. Information that applies to the platform, such as IP addresses used, can be defined using the "props" object array on an "assessment-platforms" array item object.

/assessment-plan/assessment-actions

- This new element replaces the /assessment-plan/assessment-activities/test-methods element.
- The old element required that information about an assessment process was defined by "test-methods".
- The new construction allows:
  - The use of "associated-activities" to reference an "activity" defined under /assessment-plan/local-definitions, which allows the same activity to be used multiple times across different assessment-action elements.
  - Use of "assessment-subjects" to define in a fine-grained the targeting of subjects the assessment-action are to be performed against.
  - Use of the "responsible-roles" to identify assessment roles and optionally parties which are associated with the action.

/assessment-plan/tasks

- This element updates the old element located in /assessment-plan/assessment-activities/schedule/tasks
- "title" is now required.
- "activity-uuids" is replaced with "related-actions".
- "party-uuids" and "location-uuids" are now specified on a per-action basis using the referenced "assessment-action" object's "assessment-subjects" array items, which allows both parties and locations to be subjects.
- "compare-to" has been removed, since this was intended to be used in assessment-results only.


### Changes to the assessment results model

Due to the nature of changes in this model, the following documentation details how the new model roughly maps to the older 1.0.0-milestone3 model. The following changes have been made in the XML, JSON, and YAML formats for the OSCAL assessment results model.

#### Changes to assessment results XML format

/assessment-results

- Most of the top-level elements in this model have been relocated under the "result" element or it's children. This allows the assessment details to be specified for each result set. This better supports continuous and evolving assessments.

/assessment-results/local-definitions

- The "objective" element relocates and updates the old element in /assessment-results/objectives/objective allowing new assessment objectives to be defined that were not defined in the catalog supporting the system's baseline or the assessment plan.
- The new "activity" element is similar to the related one in the assessment plan, and allows an assessment process to be defined. These assessment activities can then be referenced by a specific assessment-action.

/assessment-results/results/local-definitions

- The structures located in /assessment-results/assessment-subjects/local-definitions has been moved here. This includes the "component", "inventory-item", and "user" element constructions. This allows all content that augments the content from the referenced SSP to be located within a top-level element.
- The "add-objectives-and-methods" element has been added which allow the definitions of new assessment objectives and methods which are to be used in the assessment, but are not located in the catalog for which the system's baseline is generated from. This replaces the original elements located in /assessment-results/objectives/objective and /assessment-results/objectives/method.
/assessment-results/results/assessment-actions
- The "assessment-action" element replaces the /assessment-plan/assessment-activities/test-methods element.
  - The old element required that information about an assessment process was defined by "test-methods". This structure was moved to local-definitions, since this is adding to the actions defined in the assessment plan.
  - The new construction allows:
    - The use of "associated-activities" to reference an "activity" defined under /assessment-plan/local-definitions, which allows the same activity to be used multiple times across different assessment-action elements.
    - Use of "assessment-subjects" to define in a fine-grained the targeting of subjects the assessment-action are to be performed against.
    - Use of the "responsible-roles" to identify assessment roles and optionally parties which are associated with the action.

/assessment-results/results/reviewed-controls

- This element includes constructs that previously appeared under /assessment-results/objectives in the "controls" and "control-objectives" elements. We believe the inclusion/exclusion syntax used now is simpler, more concise, and easier to process.

/assessment-results/results/assessment-subject

- This element replaces the previous /assessment-results/assessment-subjects element.
- The old version intermixed included and excluded subjects of different types.
- The new construction pairs includes/excludes of a given type, which should make processing easier and more straightforward.

/assessment-results/results/assessment-assets

- This new element replaces the previous /assessment-results/assets element.
- The old element allowed tools to be defined and used "origination" as a way to loosely associate information (e.g., IP addresses used with assessment tools) with these tools.
- The new construction allows for "assessment-platforms" to be identified, which can combine referenced tool components using "uses-components" in multiple combinations providing more control over defining information about tooling used during an assessment. Information that applies to the platform, such as IP addresses used, can be defined using the "props" object array on an "assessment-platforms" array item object.

/assessment-results/results/attestation

- This new element allows for arbitrary statements to be made in the assessment results.

/assessment-results/results/assessment-log

- This new element implements the functionality previously supported by the /assessment-results/assessment-activities/schedule/tasks element, but in a refactored way.
- An "entry" can be used to log any event that occurs during an assessment.
  - An "entry" can be associated with an action or a task. An action is a concrete activity that is performed during an assessment, while a task is a high-level scheduled event used for project management that may be associated with multiple actions. The two can be used together to detail the work accomplished during the assessment.
  - The "related-action" element can associate the log entry with an action declared in the plan or the results to record progress on or completion of the action. The "related-action" can be used to assign a "responsible-party" and can also be associated with an "assessment-subject".
  - The "related-task" element can associate the log entry with a task declared in the plan to record progress on or completion of the task. The "related-task" can be used to assign a "responsible-party" and can also be associated with an "assessment-subject".
  - "title" is now required.
  - "activity-uuids" is replaced with "related-actions".
  - "party-uuids" and "location-uuids" are now specified on a per-action basis using the referenced "assessment-action" object's "assessment-subjects" array items, which allows both parties and locations to be subjects.

/assessment-results/results/observation

- This element updates the old element located in /assessment-results/results/finding/observation. Observations have been separated out from findings to allow a given observation to be linked to by many findings and risks.
- renamed "observation-method" to "method"
- renamed "observation-type" to "type"
- "assessor" has been replaced with "origin", which allows the tool, assessment-platform, and/or any parties to be identified as one or more "actor" elements. The related action and/or task can also be associated here using "related-action" and "related-task".

/assessment-results/results/risk

- This element updates the old element located in /assessment-results/results/finding/risk. Risks have been separated out from findings to allow a given risk to be linked to by many findings.
- Renamed "risk-status" to "status"
- The new "origin" element can be used to describe the tool or party that generated the risk record.
- Replaced "risk-metric" with "characterization", which allows any risk characteristic to be as a "facet". The specific tool, assessment-platform, and/or any parties producing a characterization can be identified using one or more "actor" elements. The related action and/or task can also be associated here using "related-action" and "related-task".
- All remediation related contents has been moved to "response", which will be discussed below.
- A "risk-log/entry" can be used to identify any action that relates to the assessment of or handling of a risk. This replaces the "/assessment-results/results/risk/remediation-tracking", while proving more robust capabilities.
- "party-id" has been replaced with identifying the party as an actor under "origin".

/assessment-results/results/risk/response

- This new element realigns all of the risk/remediation information in a way that supports other risk response activities in addition to remediation.
- "origin" allows the tool, assessment-platform, and/or party identifying the response to be identified, replacing /assessment-results/results/risk/remediation-origin.
- "task" is used to define a schedule of events replacing /assessment-results/results/risk/remediation-deadline and /assessment-results/results/risk/remediation/schedule/task. This allows risk responses to be defined in a more fine-grained way.
- Renamed "required" to "required-asset"

/assessment-results/results/finding

- This element maps to the same element in the old model.
- Moved the embedded "observation" and "risk" elements to "related-observation" and "associated-risk" references.

#### Changes to assessment results JSON and YAML formats

/assessment-results

- Most of the top-level properties in this model have been relocated under the "results" property or it's child objects. This allows the assessment details to be specified for each result set. This better supports continuous and evolving assessments.

/assessment-results/local-definitions

- The "objectives" object array relocates and updates the old object array in /assessment-results/objectives/objectives allowing new assessment objectives to be defined that were not defined in the catalog supporting the system's baseline or the assessment plan.
- The new "activities" object array is similar to the related one in the assessment plan, and allows an assessment process to be defined. These assessment activities can then be referenced by a specific assessment-action.

/assessment-results/results/local-definitions

- The structures located in /assessment-results/assessment-subjects/local-definitions has been moved here. This includes the "components", "inventory-items", and "users" property constructions. This allows all content that augments the content from the referenced SSP to be located within a top-level property.
- The "add-objectives-and-methods" property has been added which allow the definitions of new assessment objectives and methods which are to be used in the assessment, but are not located in the catalog for which the system's baseline is generated from. This replaces the original properties located in /assessment-results/objectives/objectives and /assessment-results/objectives/methods.
/assessment-results/results/assessment-actions
- The "assessment-action" property replaces the /assessment-plan/assessment-activities/test-methods property.
  - The old property required that information about an assessment process was defined by "method-definitions". This structure was moved to local-definitions, since this is adding to the actions defined in the assessment plan.
  - The new construction allows:
    - The use of "associated-activities" to reference an "activity" defined under /assessment-plan/local-definitions, which allows the same activity to be used multiple times across different assessment-action properties.
    - Use of "assessment-subjects" to define in a fine-grained the targeting of subjects the assessment-action are to be performed against.
    - Use of the "responsible-roles" to identify assessment roles and optionally parties which are associated with the action.

/assessment-results/results/reviewed-controls

- This property includes constructs that previously appeared under /assessment-results/objectives in the "controls_group" and "control-objectives_group" properties. We believe the inclusion/exclusion syntax used now is simpler, more concise, and easier to process.

/assessment-results/results/assessment-subjects

- This property replaces the previous /assessment-results/assessment-subjects property.
- The old version intermixed included and excluded subjects of different types.
- The new construction pairs includes/excludes of a given type, which should make processing easier and more straightforward.

/assessment-results/results/assessment-assets

- This new property replaces the previous /assessment-results/assets property.
- The old property allowed tools to be defined and used "origination" as a way to loosely associate information (e.g., IP addresses used with assessment tools) with these tools.
- The new construction allows for "assessment-platforms" to be identified, which can combine referenced tool components using "uses-components" in multiple combinations providing more control over defining information about tooling used during an assessment. Information that applies to the platform, such as IP addresses used, can be defined using the "props" object array on an "assessment-platforms" array item object.

/assessment-results/results/attestations

- This new property allows for arbitrary statements to be made in the assessment results.

/assessment-results/results/assessment-log

- This new property implements the functionality previously supported by the /assessment-results/assessment-activities/schedule/tasks property, but in a refactored way.
- An "entry" can be used to log any event that occurs during an assessment.
  - An "entry" can be associated with an action or a task. An action is a concrete activity that is performed during an assessment, while a task is a high-level scheduled event used for project management that may be associated with multiple actions. The two can be used together to detail the work accomplished during the assessment.
  - The "related-actions" property can associate the log entry with an action declared in the plan or the results to record progress on or completion of the action. The "related-action" can be used to assign a "responsible-party" and can also be associated with an "assessment-subject".
  - The "related-tasks" property can associate the log entry with a task declared in the plan to record progress on or completion of the task. The "related-task" can be used to assign a "responsible-party" and can also be associated with an "assessment-subject".
  - "title" is now required.
  - "activity-uuids" is replaced with "related-actions".
  - "party-uuids" and "location-uuids" are now specified on a per-action basis using the referenced "assessment-action" object's "assessment-subjects" array items, which allows both parties and locations to be subjects.

/assessment-results/results/observation

- This property updates the old property located in /assessment-results/results_group/findings/observations. Observations have been separated out from findings to allow a given observation to be linked to by many findings and risks.
- renamed "observation-method" to "method"
- renamed "observation-type" to "type"
- "assessor" has been replaced with "origin", which allows the tool, assessment-platform, and/or any parties to be identified as one or more "actor" properties. The related action and/or task can also be associated here using "related-action" and "related-task".

/assessment-results/results/risks

- This property updates the old property located in /assessment-results/results_group/findings/risks. Risks have been separated out from findings to allow a given risk to be linked to by many findings.
- Renamed "risk-status" to "status"
- The new "origin" property can be used to describe the tool or party that generated the risk record.
- Replaced "risk-metric" with "characterization", which allows any risk characteristic to be as a "facet". The specific tool, assessment-platform, and/or any parties producing a characterization can be identified using one or more "actor" properties. The related action and/or task can also be associated here using "related-action" and "related-task".
- All remediation related contents has been moved to "response", which will be discussed below.
- A "risk-log/entry" can be used to identify any action that relates to the assessment of or handling of a risk. This replaces the "/assessment-results/results_group/risks/remediation-tracking" and "/assessment-results/results_group/risks/closure-actions", while proving more robust capabilities.
- "party-ids" has been replaced with identifying the party as an actor under "origin".

/assessment-results/results/risks/responses

- This new property realigns all of the risk/remediation information in a way that supports other risk response activities in addition to remediation.
- "origin" allows the tool, assessment-platform, and/or party identifying the response to be identified, replacing /assessment-results/results_group/risks/remediation-group/origins.
- "task" is used to define a schedule of events replacing /assessment-results/results_group/risks/remediation-deadline and /assessment-results/results_group/risks/remediation-group/schedule/tasks. This allows risk responses to be defined in a more fine-grained way.
- Renamed "required" to "required-asset"

/assessment-results/results/findings

- This property maps to the same property in the old model.
- Moved the embedded "observation" and "risk" properties to "related-observation" and "associated-risk" references.

### Changes to the plan of actions and milestones (PO&M) model

Due to the nature of changes in this model, the following documentation details how the new model roughly maps to the older 1.0.0-milestone3 model. The following changes have been made in the XML, JSON, and YAML formats for the OSCAL PO&M model.

#### Changes to the plan of actions and milestones XML formats

- The PO&M XML format has been updated to align with the assessment results XML format. Most of the changes in the previous section related to assessment results apply here.

/plan-of-action-and-milestones/poam-item

- Like the assessment results, the "poam-item" now has the "observation" and "risk" elements broken out as siblings and references to these elements are used instead.
- Removed "objective-status" and "implementation-status-uuid, since this was added here by mistake and is covered in the assessment results.

#### Changes to the plan of actions and milestones JSON and YAML formats

- The PO&M JSON and YAML format has been updated to align with the assessment results JSON and YAML format. Most of the changes in the previous section related to assessment results apply here.

/plan-of-action-and-milestones/poam-items

- Replaces /plan-of-action-and-milestones/poam-items/poam-item-group
- Like the assessment results, the "poam-items" now has the "observation" and "risk" elements broken out as siblings and references to these objects are used instead.
- Removed "objective-status" and "implementation-status-uuid, since this was added here by mistake and is covered in the assessment results.

## OSCAL 1.0.0 Milestone 3
--

### New OSCAL models

The following new models have been added to OSCAL.

- Component Definition model: Allows for the definition of a set of *components* that each provide a description of the controls supported by a specific implementation of a hardware, software, or service; or by a given policy, process, procedure, or compliance artifact (e.g., FIPS 140-2 validation).
- Assessment Plan model: Represents the planning for a periodic or continuous assessment.
- Assessment Results model: Represents the findings of a periodic or continuous assessment of a specific system.
- Plan of Action and Milestones (POA&M) model: Represents the known risks for a specific system, as well as the identified deviations, remediation plan, and disposition status of each risk.

### Changes to all Models

#### Changing 'name' flag to 'title' field

On several assemblies, what had been represented with a 'name' flag is now represented with a 'title' field, which permits inline markup.

'title' now appears in these assemblies: 'metadata', 'revision', 'location', 'resource', 'role', 'information-type', 'leveraged-authorization', 'user', 'authorized-privilege', 'component', and 'protocol'.

#### Changes of ID to UUID

A number of assemblies that used to carry 'id' flags now carry 'uuid' flags instead. These include (in the SSP model) : 'location', 'party', 'resource', 'diagram', 'user', 'component', 'protocol', 'inventory-item', 'implemented-requirement', 'statement', and 'by-component'. In all models, it includes 'location', 'party', and 'resource'. Finally, the full assemblies 'catalog', 'profile' and 'system-security-plan' fall into this category.

Similarly, flags and fields that are named to indicate they provide a point of reference, are now renamed '-uuid' reflecting when their references is given specifically as a 'uuid' (and validated as such) not as an 'id'. These include 'location-uuid' and 'party-uuid'.

#### 'metadata' changes

Milestone 3 has two assemblies in the metadata, revision for tracking a revision history, and location, an abstraction (and alternative) to the older address modeling.

[M2] model: title (field), published? (field), last-modified (field), version (field), oscal-version (field), doc-id* (field), prop* (field), link* (field), role* (assembly), party* (assembly), responsible-party* (assembly), remarks? (field)

[M3] model: title (field), published? (field), last-modified (field), version (field), oscal-version (field), revision* (assembly), doc-id* (field), prop* (field), link* (field), role* (assembly), location* (assembly), party* (assembly), responsible-party* (assembly), remarks? (field)

##### New 'revision' assembly: Revision History Entry (all models)

Tracking revisions can now be done by capturing a snapshot of metadata at an earlier point, potentially with properties or remarks added to indicate revision status or purpose.

[M3] model: title? (field), published? (field), last-modified? (field), version? (field), oscal-version? (field), prop* (field), link* (field), remarks? (field)

##### New 'location' assembly: Location (all models)

A new assembly permits factoring out geographic or contact information (an address or contact point) into a separate data structure, for reference using its 'uuid' flag.

[M3] model: title? (field), address (assembly), email* (field), phone* (field), url* (field), prop* (field), annotation* (assembly), link* (field), remarks? (field)

##### New 'location-uuid': Location Reference

##### 'party' changes (all models)

'party' is for Party (organization or person). It has been refactored to reflect the (somewhat arbitrary) 'organization' vs 'person' distinction into a 'type' flag.

Where before, we had an 'id' flag, now we have 'uuid'. We also have 'type', a flag whose value can capture "person" or "organization".

We also have new fields for linking to other assemblies, including 'member-of-organization'. Instead of 'org-name' and 'person-name' we simply have 'party-name'.

[M2] flags: id?

[M3] flags: uuid?, type?

[M2] model: person* (assembly), org? (assembly), prop* (field), annotation* (assembly), link* (field), remarks? (field)

[M3] model: party-name (field), short-name? (field), external-id* (field), prop* (field), annotation* (assembly), link* (field), address* (assembly), email* (field), phone* (field), member-of-organization (field), location-uuid (field)**, remarks? (field)

##### New field 'party-uuid': Party Reference

Replaces 'person/id' and 'org/id' from the M2 model.

##### New field 'external-id': Personal Identifier

Replaces 'party-id' and 'org-id' from the M2 model.

##### New field 'member-of-organization': Organizational Affiliation

Used to associate a person or organization with another organization. This can be used to create organization hierarchies.

##### New field 'party-name': Party Name

Replaces 'org-name' and 'person-name' from the M2 model.

#### 'back-matter' changes

In the back matter, the old 'citation' element has been refactored as a special case of 'resource'.

[M2] model: citation* (assembly), resource* (assembly)

[M3] model: resource* (assembly)

##### Refactored 'resource': Resource

The old 'citation' assembly is now a child, not a sibling of resource within 'back-matter'. As such it has been remodeled to support as much specialized citation information as may be available for a resource.

[M2] flag: id?

[M3] flags: uuid?

[M2] model: desc? (field), prop* (field), (A choice: rlink* (assembly), base64? (field) ) , remarks? (field)

[M3] model: title? (field), desc? (field), prop* (field), doc-id* (field), citation? (assembly), rlink* (assembly), base64* (field), remarks? (field), (any)

New assemblies and fields to support the citation model.

##### New field 'text': Biblographic Text

A plain-text capture of a bibliographic citation.

##### New assembly 'biblio': Bibliographic Definition

A structured representation of a bibliographic resource (an extension point).

##### 'citation' changes

A 'citation' now appears only as a child of a 'resource'.

[M2] flag: id?

[M3] flag: [none]

[M2] model:  target* (field), title? (field), desc? (field), doc-id* (field), prop* (field), ? (any)

[M3] model: text (field), prop* (field), biblio? (assembly)


### Changes to the Profile Model

#### Change to 'add': Addition (profile model)

A new 'id-ref' flag permits targeting an addition to a particular object (branch) within the structure addressed for addition. Additionally, an 'annotation' element may also be added.

[M2] flag: position?

[M3] flags: position?, id-ref?

[M2] model: title? (field), param* (assembly), prop* (field), link* (field), part* (assembly)

[M3] model: title? (field), param* (assembly), prop* (field), annotation* (assembly), link* (field), part* (assembly)

### Changes to the System Security Plan (SSP) Model

#### 'system-implementation' changes

An assembly for 'leveraged-authorization' has been added. 'leveraged-authorization' used to be in 'system-characteristics'.

[M2] model: prop* (field), annotation* (assembly), link* (field), user* (assembly), component* (assembly), service* (assembly), interconnection* (assembly), system-inventory? (assembly), remarks? (field)

[M3] model: prop* (field), annotation* (assembly), link* (field), leveraged-authorization* (assembly), user* (assembly), component* (assembly), system-inventory? (assembly), remarks? (field)

#### 'component' changes

The component assembly has been remodeled to permit greater generality and expressiveness. New assemblies include 'title', 'purpose', and 'protocol'.

[M2] flags: id?, name?, component-type?

[M3] flags: uuid?, component-type?

[M2] model: description (field), prop* (field), annotation* (assembly), link* (field), status (assembly), responsible-role* (assembly), remarks? (field)

[M3] model: title (field), description (field), purpose? (field), prop* (field), annotation* (assembly), link* (field), status (assembly), responsible-role* (assembly), protocol* (assembly), remarks? (field)

#### Rename 'set-param' to 'set-parameter'

In profile SSP models, the assembly used to set a parameter is consistently called 'set-parameter'.

##  OSCAL 1.0.0 Milestone 2

### New OSCAL Features

- A System Security Plan (SSP) model has been added to OSCAL for use by organizations to document the implementation of security and privacy controls in an information system.

### Breaking Changes

The following content model changes have been made to the catalog and profile models that may break content compatibility:

#### Document metadata

  * `last-modified` is now required. Its value must be a date-time with time zone (i.e., a timestamp). The old element `last-modified-date` is no longer permitted.
  * `published` is permitted for a nominal publication date, as assigned by the owner or publisher of the catalog or resource. An electronic version of a previously published catalog should carry its own publication date, if any, not that of the original resource (which can be described elsewhere with its own metadata).
  * `role-id` is now assigned as an element in the XML, not an attribute. This permits it to be tokenized more explicitly.

#### Control structures in the catalog model

##### New property in SP800-53 catalog data

In the SP800-53 catalog, we have added a property called `sort-id` to controls and enhancements. Its string value represents the control's ID in a (zero-padded) notation that will sort gracefully against other `sort-id` values. This permits a robust reordering of controls in receiving systems without having to refer to an out-of-line document to restore the canonical order.

##### Controls inside controls, but no "subcontrols"

Control enhancements are now represented using `control` not `subcontrol`. The advantages of restricting to two levels of hierarchy (even given groups and parts) became too few in view of the sacrifices to expressiveness so we have gone back to clean recursion.

#### Data type handling

Data type handling has been extended in several respects to provide for the validating of lexical forms of nominal datatypes. Datatypes for dates and times have been added. Several XML-peculiar datatypes have been removed.

##### Value enumeration on terminal nodes

The schema has also been extended to support validation against enumerated values, either exclusively (only declared values may appear) or inclusively (enumerations are documented while other values are also permitted). All allowed values now being declared (Milestone 2) are inclusive of other values (user- or application-defined), so this is not a breaking change.

Affected data points (in both models): `prop/name`, `address/type`, `phone/type`, `hash/algorithm`, `role-id`. The enumerated values provided for each are documented.

##### Lexical datatyping at points

Supported for lexical datatyping has also been added to `link/href`, `rlink/href` (URI references), `published` and `last-modified` (timestamps), `email` (a nominal email address), `url` (a URI), `img/src`.

#### Profile model enhancements

##### Calling control enhancements (old "subcontrols")

From call statements, since `subcontrol` has been dropped from the catalog model, `subcontrol-id` has been replaced with `control-id`, and `with-subcontrols` has been replaced by `with-child-controls` (on `call`, `all` and `match`). Essentially, a subcontrol is now represented as a control that is a child another parent control.

##### Expanded model for new groups

Elements besides control references are now permitted inside `group` within the `merge` construct, so profile authors can provide titles and introductory content to groups they define for their represented aggregate control structures.

##### Parameter settings

Added 'guideline' to profile model. It was omitted in error.

See issues #494, #288 (adding 'guideline' to profile model)


## OSCAL 1.0.0 Milestone 1
--

- The first official OSCAL release
- Provides stable versions of the OSCAL catalog and profile models in XML and JSON formats, along with associated XML and JSON schemas.
- Includes draft versions of the NIST SP 800-53 revision 4 OSCAL content and FedRAMP baselines in OSCAL XML, JSON, and YAML formats.
- Provides content converters that are capable of accurately converting between OSCAL catalog and profile content in OSCAL XML to OSCAL JSON format and vice versa.
