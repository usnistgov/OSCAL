# Production of transformed source Metaschema modules without external entities (XXEs)

Date: 08/25/2023

## Status

Approved

## Context

We wish to remove or mitigate points friction encountered by NIST or community OSCAL developers producing tooling that consumes the OSCAL Metaschema module sources.

The OSCAL Metaschema modules currently use external entities to prevent duplication of constraint data.
These external entities are important for modeling ergonomics and cannot be removed until a Metaschema-native approach is stabilized, however external entities have a storied history of abuse.
So called "XML External Entity (XXE) Attacks", along with the additional complexity needed to support external entity resolution, have led to a situation where many XML parsers do not ship with XXE functionality.
This has put additional burden on OSCAL tool developers seeking to consume the source Metaschemas, who have either had to choose from the small subset of XML parsers that support external entities (if one exists for their target language at all) and inherit all additional risks that come with XXEs, or perform transformation of the source Metaschema modules before consuming them.

- Related to Issue [#1665](https://github.com/usnistgov/OSCAL/issues/1665)

## Decision

The NIST OSCAL Team should include the "resolved" Metaschema module sources as an artifact generated upon release.
Additionally, the NIST OSCAL Team should document the process for obtaining a resolved Metaschema module as part of the [streamlined build process](./0005-repository-reorganization.md#streamlined-build-process).

In the event that Metaschema stabilizes constraint imports, the NIST OSCAL Team will review this ADR and potentially determine a deprecation strategy for these generated artifacts in the relevant releases.

## Consequences

This decision will not have any breaking changes to our process, however:

1. The NIST team will be responsible for reviewing the additional artifacts before performing a release.
2. In the event that Metaschema stabilizes constraint imports, the NIST OSCAL team will have to maintain deprecated artifacts until the next major version.
