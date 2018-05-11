# OSCAL Examples - FedRAMP

This directory contains examples in XML and JSON formats of the low, moderate, and high baselines defined by FedRAMP (the Federal Risk and Authorization Management Program). The structure and contents of the directory are as follows:

* [pub](pub): This directory contains temporary files from a JSON utility.
* [roundtripped](roundtripped): This directory contains temporary files from a JSON utility.
* [FedRAMP-HIGH-crude.json](FedRAMP-HIGH-crude.json): This file represents the FedRAMP high baseline as an OSCAL profile in JSON format, calling controls in appropriate NIST SP 800-53 baselines or when necessary in the NIST SP 800-53 catalog. However, this representation is not sufficiently granular in every detail. Specific parameter value assignments are not being parsed out and projected, but require hand intervention.
* [FedRAMP-HIGH-crude.xml](FedRAMP-HIGH-crude.xml): This file has the same contents as [FedRAMP-HIGH-crude.json](FedRAMP-HIGH-crude.json) except it is in XML format instead of JSON.
* [FedRAMP-HIGH-edited.json](FedRAMP-HIGH-edited.json): This file is based on [FedRAMP-HIGH-crude.json](FedRAMP-HIGH-crude.json), but a portion of that file has been hand edited to address specific parameter value assignments.
* [FedRAMP-HIGH-edited.xml](FedRAMP-HIGH-edited.xml): This file has the same contents as [FedRAMP-HIGH-edited.json](FedRAMP-HIGH-edited.json) except it is in XML format instead of JSON.
* [FedRAMP-LOW-crude.json](FedRAMP-LOW-crude.json): This file represents the FedRAMP low baseline as an OSCAL profile in JSON format, calling controls in appropriate NIST SP 800-53 baselines or when necessary in the NIST SP 800-53 catalog. However, this representation is not sufficiently granular in every detail. Specific parameter value assignments are not being parsed out and projected, but require hand intervention.
* [FedRAMP-LOW-crude.xml](FedRAMP-LOW-crude.xml): This file has the same contents as [FedRAMP-LOW-crude.json](FedRAMP-LOW-crude.json) except it is in XML format instead of JSON.
* [FedRAMP-MODERATE-crude.json](FedRAMP-MODERATE-crude.json): This file represents the FedRAMP moderate baseline as an OSCAL profile in JSON format, calling controls in appropriate NIST SP 800-53 baselines or when necessary in the NIST SP 800-53 catalog. However, this representation is not sufficiently granular in every detail. Specific parameter value assignments are not being parsed out and projected, but require hand intervention.
* [FedRAMP-MODERATE-crude.xml](FedRAMP-MODERATE-crude.xml): This file has the same contents as [FedRAMP-MODERATE-crude.json](FedRAMP-MODERATE-crude.json) except it is in XML format instead of JSON.
* [OSCAL-Development-Process-Notes.md](OSCAL-Development-Process-Notes.md): This file explains some of the processes and decision making involved in generating the examples in this directory.
