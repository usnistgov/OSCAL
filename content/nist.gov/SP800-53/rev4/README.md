# NIST SP 800-53 Examples

This subdirectory contains provisional stable, best effort versions of OSCAL catalogs and profiles related to NIST SP800-53. While not authoritative, as examples these are useful as demonstrations (as can be established by comparing them with their originals). The files have been produced by a combination of automated and semi-automated (editorial) processes.

Note that in many ordinary working scenarios, users of OSCAL will not be writing or creating catalogs or low-level baselines (profiles) such as these, but only referencing them.

NIST SP 800-53 Revision 5 files are not yet available. We hope to post these in the near future once an updated draft of SP 800-53 rev 5 is published.

This directory contains OSCAL catalog and profile content for SP 800-53 revision 4.

## OSCAL SP 800-53 Revision 4 Catalog Content

- [NIST_SP-800-53_rev4_catalog.json](json/NIST_SP-800-53_rev4_catalog.json): This file contains the full text of SP 800-53 revision 4 in OSCAL JSON format, *including* information integrated from appendixes describing objectives and assessments for controls (SP 800-53A). This OSCAL catalog is produced via transformation pipeline from NIST NVD XML source data. It is *not* an official version of this publication and cannot be warranted in any way except for purposes of these demonstrations.
- [NIST_SP-800-53_rev4_catalog.xml](xml/NIST_SP-800-53_rev4_catalog.xml): This file has the same contents as [NIST_SP-800-53_rev4_catalog.json](json/NIST_SP-800-53_rev4_catalog.json) except in XML format.

## OSCAL SP 800-53 Revision 4 Baseline Profile Content

- [NIST_SP-800-53_rev4_LOW-baseline_profile.json](json/NIST_SP-800-53_rev4_LOW-baseline_profile.json): This file contains an OSCAL profile in JSON format representing the Low impact baseline profile (selection) of controls based on `NIST SP 800-53 rev4 Appendix D`.
- [NIST_SP-800-53_rev4_LOW-baseline_profile.xml](xml/NIST_SP-800-53_rev4_LOW-baseline_profile.xml): This file has the same contents as [NIST_SP-800-53_rev4_LOW-baseline_profile.json](json/NIST_SP-800-53_rev4_LOW-baseline_profile.json) except in XML format.
- [NIST_SP-800-53_rev4_MODERATE-baseline_profile.json](json/NIST_SP-800-53_rev4_MODERATE-baseline_profile.json): This file contains an OSCAL profile in JSON format representing the Moderate impact baseline profile (selection) of controls based on `NIST SP 800-53 rev4 Appendix D`.
- [NIST_SP-800-53_rev4_MODERATE-baseline_profile.xml](xml/NIST_SP-800-53_rev4_MODERATE-baseline_profile.xml): This file has the same contents as [NIST_SP-800-53_rev4_MODERATE-baseline_profile.json](json/NIST_SP-800-53_rev4_MODERATE-baseline_profile.json) except in XML format.
- [NIST_SP-800-53_rev4_HIGH-baseline_profile.json](json/NIST_SP-800-53_rev4_HIGH-baseline_profile.json): This file contains an OSCAL profile in JSON format representing the High impact baseline profile (selection) of controls based on `NIST SP 800-53 rev4 Appendix D`.
- [NIST_SP-800-53_rev4_HIGH-baseline_profile.xml](xml/NIST_SP-800-53_rev4_HIGH-baseline_profile.xml): This file has the same contents as [NIST_SP-800-53_rev4_HIGH-baseline_profile.json](json/NIST_SP-800-53_rev4_HIGH-baseline_profile.json) except in XML format.

## NIST SP800-53 in OSCAL: Tagging Notes

The regular composition of controls and subcontrols (control enhancements) can be determined using a few XPaths over the XML content for interrogation:

`distinct-values(//part/@name)` -> statement, guidance, objective, assessment, object

`distinct-values(//prop/@name)` -> label, method, status

`distinct-values(//part[@name=.//part/@name]` -> statement, guidance, objective

\* XPath expressions are given here on the assumption that unprefixed names are bound to the OSCAL namespace.

### Notes on 'name' usage in SP800-53

Controls have the following parts.

`part[@name='statement']`

`part[@name='guidance']`

`part[@name='objective']`

`part[@name='assessment']`

`part[@name='object']`

Also the following properties are given:

`prop[@name='label']` gives the 'name' or 'number' of the control, enhancement, or component part of a control such as statements or objectives. These are derived from the data and expanded into full values.

`prop[@name='method']`

`prop[@name='status']` A value of "Withdrawn" is given to this property *only* in controls and subcontrols designated as Withdrawn (from earlier versions of SP800-53).


### Link elements

Link elements appear for two reasons: either they capture implicit or explicit links given in the source data; or (in certain cases) they are inferred.

`rel` attributes on links, as in HTML, give some indication of the purpose or use of the link. In SP800-53 we have four values:

 - `rel="related"` indicate related controls: these links are given explicitly in the source
 - `rel="reference"` indicates a citation of a reference as given in the source
 - `rel="corresp"` shows where a control or enhancement objective corresponds to an item in its statement
 - `rel="incorporated-into"` on Withdrawn controls or enhancements, indicate superseding controls.

All internal links validate in the sense that any `href` value beginning in '#' does indeed correspond to an `id` value given elsewhere. The catalog does (presently) have a link element with no `href`, in a case where no target is available. In other cases - where an `href` gives a URI - this rendition of the catalog does *not* stipulate or warrant that any resource can be retrieved at the given address.

### ID protocol for SP800-53

Unique identifiers for any elements or constructs should probably be assigned by a local system in any case, but elements in OSCAL do have unique ID values assigned as attribute `id` and therefore useful as canonical identifiers. These values are derived from the labels and have been confirmed to be regular and systematic in the document as given.

#### Parenthetical notation

Where labels have composite values delimited with parentheses, the parentheses are cast to "dot" (period) delimiters and the entire value cast to lower case.

So `AC-3(1)` becomes `ac-3.1`.

#### Mixed parentheses and brackets

Where labels are composed by combining parentheses with values in brackets (on "objective" elements), the two segments are separated.

So `AC-3(3)[6](b)(3)[a]` becomes `ac-3.3.b.3_obj.6.a` as corresponding with (statement) `AC-3(3)(b)(3)` as objective `[6][a]`.

This is done in order to facilitate the matching control objectives with corresponding items in their statements.

Note that since they correspond with labels, `id` values will be "sticky" across different versions of the catalog. So a pointer using such an ID by itself (that is, without being able to authenticate the hosting document as well) has no a guarantee of uniqueness or correctness. To mitigate this, applications may address a combination of element and document id - since the `catalog/@id` value should disambiguate versions of documents where the element id does not help to distinguish them.

The format and regularity of identifiers can be confirmed by applying the Schematron [validate_SP800-53_labels-and-ids.sch](../../../../src/content/nist.gov/SP800-53/rev4/xml/validate-labels_SP800-53-catalog.sch).
