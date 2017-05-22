# OSCAL Schematron

This subdirectory contains various Schematron constraint sets for application to OSCAL.

As of 2017-08-25, these are still provisional and subject to change. For more information see the Schematrons themselves (including embedded comments - but don't trust them entirely either).

## Overview

[oscal-strict.sch](oscal-strict.sch)
  : Extra-schema constraints that should apply to any OSCAL document. Given schema declarations, this may include constraints that are redundant and/or "paranoid".

[oscal-parameters.sch](oscal-parameters.sch)
  : Special constraints (with Quickfix logic) applicable to parameters and their assignments (`insert` elements).

[oscal-links.sch](oscal-parameters.sch)
  : Link checking including the detection of broken internal links (but not external links).

[oscal-as-declared.sch](oscal-as-declared.sch)
  : Validation of an OSCAL document against its own declarations, i.e., this is an implementation of semantics related to OSCAL declarations.

[oscal-profile.sch](oscal-profile.sch)
  : Constraints applicable to OSCAL profiles, including referential integrity with respect to their source catalog(s). Under development.

-----
