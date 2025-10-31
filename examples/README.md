# NIST SP 800-171 Rev 2 OSCAL Examples

This directory contains example OSCAL files derived from NIST SP 800-171 Revision 2 and SP 800-171A Revision 2.

## Contents

- **[catalog/json/nist-sp-800-171-rev2-catalog.generated.json](catalog/json/nist-sp-800-171-rev2-catalog.generated.json)** - Complete OSCAL catalog of the 110 security requirements from NIST SP 800-171 Rev 2, including control titles, statements, and discussion sections.

- **[assessment-plan/json/nist-sp-800-171a-rev2-assessment-plan.wired.json](assessment-plan/json/nist-sp-800-171a-rev2-assessment-plan.wired.json)** - OSCAL assessment plan with assessment procedures from NIST SP 800-171A Rev 2, structured with consistent control references.

## Purpose

These files demonstrate:
- How to represent CUI security requirements in OSCAL catalog format
- How to structure assessment procedures in OSCAL assessment-plan format
- Cross-document control referencing and linkage
- Valid OSCAL 1.1.2 structure and formatting

## Validation

Validate these files using the OSCAL CLI:

```bash
# Validate the catalog
oscal validate --no-schematron examples/catalog/json/nist-sp-800-171-rev2-catalog.generated.json

# Validate the assessment plan
oscal validate --no-schematron examples/assessment-plan/json/nist-sp-800-171a-rev2-assessment-plan.wired.json
```

Both files conform to OSCAL 1.1.2 and pass schema validation.

## File Relationships

The assessment plan references controls in the catalog via `related-controls` elements. The catalog provides the authoritative control definitions that the assessment procedures evaluate.

```
nist-sp-800-171-rev2-catalog.generated.json
    └── defines controls (3.1.1, 3.1.2, etc.)
            ↑
            │ referenced by
            │
nist-sp-800-171a-rev2-assessment-plan.wired.json
    └── provides assessment procedures
```

## Important Notes

1. **These are example files** - They are provided for community reference, validation testing, and educational use.

2. **Not official NIST publications** - These OSCAL representations are derived from official NIST publications but are not themselves official publications. For authoritative content, refer to:
   - [NIST SP 800-171 Rev 2](https://csrc.nist.gov/publications/detail/sp/800-171/rev-2/final)
   - [NIST SP 800-171A Rev 2](https://csrc.nist.gov/publications/detail/sp/800-171a/rev-2/final)
   - [Official OSCAL content repository](https://github.com/usnistgov/oscal-content)

3. **Content updates** - The catalog includes corrected control titles and typography. All 110 security requirements are included with official control statements and discussion sections.

4. **Substitution ready** - The assessment plan uses minimal catalog references (control IDs only), allowing an official full catalog to be substituted later without changing assessment plan content.

## License

These files are provided under the CC0 1.0 Universal public domain dedication, consistent with NIST OSCAL project practices.

## Version Information

- **OSCAL Version**: 1.1.2
- **Catalog Version**: 2.0.1-corrected-obj
- **Assessment Plan Version**: 1.0.0-with-objs
- **Last Modified**: 2025-10-30

## Additional Resources

- [OSCAL Documentation](https://pages.nist.gov/OSCAL/)
- [OSCAL Models](https://pages.nist.gov/OSCAL/concepts/layer/)
- [NIST SP 800-171 Information](https://csrc.nist.gov/projects/protecting-controlled-unclassified-information)
