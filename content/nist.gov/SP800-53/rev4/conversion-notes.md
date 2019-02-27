# SP800-53 conversion notes

The XML, JSON, and YAML versions of SP800-53 given here are derived from official and internal NIST publications and communications, in order faithfully to represent published standards (providing them with machinable proxies) but not to determine their meaning or force.

Keep in mind that the OSCAL code is thus a *representation* of an *interpretation* of the standard, and can in no way be considered as authoritative in itself. Any authority or reliability it may be considered to have derives entirely from its resemblance to the standard as published, as confirmed by external inspection.

Specifically, this OSCAL XML was produced via XSLT transformation pipeline from 
[NIST NVD XML sources](https://nvd.nist.gov/800-53) (Control descriptions in Appendixes F & G and Objective Appendix F)

The transformation pipeline applies the following enhancements and mappings to this data set:

1. Source is ameliorated at points of detected failure such as typographical glitches (where necessary to enable downstream processing).
1. Source is cast from native (NVD XML) description into OSCAL
1. Various enhancements are made, such as inferring parameter markup, establishing internal cross-references etc.
1. Along the way, IDs are produced by mapping literal values (generally, labels) found in the source data. This entails some rewriting of identifiers (see below). Because these values are produced by direct mapping from the data, as opposed to auto-generating them based on intrinsic document properties (structure), they can also be meaningfully *validated*. See below.
1. In the result, control descriptions from the base publication, SP800-53, are merged with detailed objective and assessment descriptions from Appendix A, by control.

## IDs in SP800-53

Globally in OSCAL, `@id` attributes (XML) or 'id' fields (JSON) are validated as XML type ID, which imposes the following constraints:

- Must be an
[XML NCName](https://www.w3.org/TR/REC-xml-names/#NT-NCName)
[https://www.w3.org/TR/REC-xml-names/#NT-NCName], hence
   - Starting with a letter (or underscore or period)
   - Followed by letters, digits, underscores, dashes or periods (but no other punctuation such as parentheses or brackets)
- Must be lexically unique across the scope of the document. That is, the same 'id' value may not be given to any other object.

As a consequence of the second constraint, ids serve as robust targets for linking when other information is not determinative, especially when used in combination with unique identifiers at the document level.

Additionally, in the OSCAL version of SP800-53 rev 4, the following ID conventions are followed:

1. IDs of controls are derived from the name (label) of the Control. So control "AC-1" has id `ac-1` and "PM-15" has `pm-15`.
1. IDs of control enhancements (subcontrols) are produced similarly, with the parenthetical expression cast to "dot notation". So control enhancement SI-14(1) has id `si-14.1`, etc.
1. The analogous rule is applied to groups. So "Risk Assessment" (with controls RA-1 through RA-6) has id `ra`.
1. Within controls and subcontrols, components (parts) are given IDs whenever it is expected or anticipated to be targets of internal linking. This does not include all components, for example properties (`prop` fields) such as labels. But:
  1. Statements for each control are suffixed `_smt`, so `si-14.1_smt` etc.
  1. A "Guidance" part ID is suffixed `_gdn`
  1. Parameter IDs suffixed `_prm` with a number representing their position among other parameters in the same control, so `ac-1_prm_2` for the second parameter defined in AC-1.
  1. "Objectives" are suffixed `_obj`. When objectives given in the data have distinct labels, they have similarly been provided with ids accordingly, such as `si-14.1_obj.1` for Objective SI-14\(1\)\[1\])  etc.
  1. In this assignment, implicit targets of links (from objectives to components of statements) are disentangled. So for example Objective AC-3(3)\[6]\(a) refers to (indeed its text corresponds to) statement AC-3(3)(a). So the objective is given id `ac-3.3.a_obj.6`, and provided with a link to the statement.  
  1. Currently, IDs are not assigned to assessments.


### Validating 'id' assignment in OSCAL SP800-53/A

A Schematron in this subdirectory, `validate_SP800-53_labels-and-ids.sch`, when applied to the catalog XML, demonstrates that `id` values derived from labels correspond to values expected from static analysis (of document structure). This helps confirm their referential integrity.
