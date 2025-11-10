[![Gitter](https://img.shields.io/gitter/room/usnistgov-OSCAL/Lobby)](https://gitter.im/usnistgov-OSCAL/Lobby) [![CI/CD](https://github.com/usnistgov/OSCAL/actions/workflows/status.yml/badge.svg)](https://github.com/usnistgov/OSCAL/actions/workflows/status.yml) [![GitHub release (latest by date)](https://img.shields.io/github/v/release/usnistgov/OSCAL?color=green)](https://github.com/usnistgov/OSCAL/releases)

# NIST SP 800-171A Revision 2 - OSCAL Catalog

## Overview
This catalog provides a machine-readable implementation of NIST Special Publication 800-171A Revision 2: *Assessing Security Requirements for Controlled Unclassified Information*.

## Contents
- **110 Security Requirements** organized into 14 control families
- **Assessment Procedures** for each requirement including:
  - Detailed assessment objectives
  - Assessment methods (EXAMINE, INTERVIEW, TEST)
  - Specific guidance for assessors
- **SPRS Point Values** integrated as control properties for DFARS compliance scoring

## Control Families
1. Access Control (3.1) - 22 controls
2. Awareness and Training (3.2) - 3 controls
3. Audit and Accountability (3.3) - 9 controls
4. Configuration Management (3.4) - 9 controls
5. Identification and Authentication (3.5) - 11 controls
6. Incident Response (3.6) - 3 controls
7. Maintenance (3.7) - 6 controls
8. Media Protection (3.8) - 9 controls
9. Personnel Security (3.9) - 2 controls
10. Physical Protection (3.10) - 6 controls
11. Risk Assessment (3.11) - 3 controls
12. Security Assessment (3.12) - 4 controls
13. System and Communications Protection (3.13) - 11 controls
14. System and Information Integrity (3.14) - 7 controls

## SPRS Point Values
The catalog includes SPRS point values for DoD contractor assessments:
- **5 points**: 42 high-priority controls
- **3 points**: 14 medium-priority controls
- **1 point**: 54 basic requirement controls

Total possible SPRS score: 110 points

## Usage Examples

### Assessment Plan Generation
Use this catalog with OSCAL assessment plan models to create structured assessment documentation.

### Automated Scoring
Extract point values programmatically:
```python
for control in catalog['groups'][*]['controls']:
    point_value = control['props']['point-value']
    # Calculate SPRS score
```

### Integration with SSPs
Reference these assessment procedures when documenting control implementations in System Security Plans.

## Validation
- ✅ OSCAL 1.1.2 schema compliant
- ✅ Valid JSON structure
- ✅ All 110 controls include complete assessment procedures
- ✅ 100% point value coverage

## Source Documentation
Based on:
- NIST SP 800-171 Revision 2 (2020)
- NIST SP 800-171A Revision 2 (Official publication)
- DFARS/CMMC SPRS scoring methodology

## Maintainer Notes
- Last Updated: November 7, 2025
- OSCAL Version: 1.1.2
- Catalog UUID: ddc8ca6e-7ba4-4431-851d-daa2d498fce0

## Contributing
This catalog is maintained as part of the community OSCAL content repository. Issues and improvements can be submitted via GitHub.