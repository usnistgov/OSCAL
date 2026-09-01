# OSCAL Utilities

The OSCAL project maintains [a list of tools for OSCAL on our web site](https://pages.nist.gov/OSCAL/tools/ "OSCAL tools page"). That page documents only tools developed and maintained by NIST, marking any that are no longer actively maintained. The page also links out to the community-run [Awesome OSCAL](https://github.com/oscal-club/awesome-oscal) list for everything else.

Members of the community also offer OSCAL tools, frequently in open repositories free to use, which the OSCAL project does not maintain and does not track here.

## Local XSLT toolchain

This directory hosts a local, in-repository XSLT/XProc toolchain used to develop, test, and demonstrate OSCAL processing, separate from the standalone [OSCAL-XSLT](https://github.com/usnistgov/oscal-xslt) repository (the actively maintained home for general-purpose OSCAL display/processing XSLT). Content here is not published as a release artifact.

- [`resolver-pipeline/`](resolver-pipeline/) — a proof-of-concept implementation of OSCAL Profile resolution, built as a sequence of XSLT transformations run through an XProc pipeline. Read [`resolver-pipeline/readme.md`](resolver-pipeline/readme.md) before reusing it or the algorithm elsewhere — it documents a known SSRF/path-traversal weakness that is acceptable only under this repository's own CI review process. See [`resolver-pipeline/TESTING.md`](resolver-pipeline/TESTING.md) for how its XSpec test suite is organized.
  - `resolver-pipeline/java_modules/` is **not source** — it's a build output directory, excluded from version control (see `.gitignore`), populated on demand by `make`. The `Makefile` invokes `mvn dependency:copy-dependencies` to stage the Java libraries the pipeline needs at runtime: Saxon-HE (XSLT/XProc processing), XML Calabash (the XProc engine), xmlresolver (catalog resolution), the coffeefilter/coffeegrinder/coffeesacks XSpec test engine, and their transitive dependencies. Run `make` in `resolver-pipeline/` to populate it; `make clean` removes it.
- [`schematron/`](schematron/) — Schematron rules that check an OSCAL profile against the catalog it references. See [`schematron/readme.md`](schematron/readme.md) for its current limitation: it only handles profiles that reference catalogs directly, not profiles that reference other profiles.
- `oscal-content-validator.py` — a Python script for configuring and running XML and JSON Schema validation; its pinned dependencies are in `requirements.txt`.
