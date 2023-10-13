# Implementation-agnostic Testing and Test Harness

Date: 10/06/2023

## Status

Proposed

## Context

In order to support the development of OSCAL tooling, it was decided prototype a unified tool responsible for validating OSCAL implementations against specification requirements.

Currently, only profile resolution has been [formalized into a draft specification](../src/specifications/profile-resolution/profile-resolution-specml.xml).

### Existing Infrastructure

The profile resolver specification currently leverages an in-house XML format known as SpecML, which breaks down a specification into a collection of **sections**, which contain in turn a collection of **requirements**.
Each `<section/>` and `<requirement/>` has a unique `@id` attribute.

The sections and requirements are mirrored in the XSLT implementation's profile resolution unit tests.
Although crucial to the XSLT implementation, these tests are not portable and it would not be simple to use the tests in their current state to validate other implementations.

### Specification Tests

Some specifications such as [CommonMark](https://commonmark.org/) include a [test suite and testing harness](https://github.com/commonmark/commonmark-spec/tree/master/test) to make it possible for implementors to "score" their implementation's conformance to the specification.

## Decision

### SpecML

The specification format will remain unchanged for now.
There is an argument for the format to be replaced or simplified in the future, but the use of `@id` attributes for sections and requirements make linking a test to a example simple.

### Test Suite Data Format

The test suite will be described using a JSON file with a simple data format.

This file will contain a collection of objects that map to a given spec requirement via `section_id` and `requirement_id` fields.
These objects will further contain a collection of "scenario" objects, each of which containing a `description`, `source_profile_path`, `expected_catalog_path`, and a collection of `selection_expressions`.

For a given scenario, a test runner would be expected to perform profile resolution with the `source_profile_path` and compare selections of the resulting document with the `expected_catalog_path`.
The `selection_expressions` are XPath expressions, though the [test harness](#test-harness) may further constrain the XPath expression's capabilities.

Here is an example test suite made up of one requirement:

```json
[
    {
        "section_id": "import",
        "requirement_id": "req-uri-resolve",
        "scenarios": [
            {
                "description": "Check that group and control titles match, signalling that URIs have been resolved",
                "source_profile_path": "requirement-tests/req-include-all-asis.xml",
                "expected_catalog_path": "requirement-tests/output-expected/req-include-all-asis_RESOLVED.xml",
                "selection_expressions": [
                    "./oscal:group/oscal:title",
                    "./oscal:group/oscal:control/oscal:title"
                ]
            }
        ]
    }
]
```

The development of a JSON schema for this format is left as future work.

### Test Harness

A prototype testing harness has been developed, with the capability to report a given profile resolver's compliance to a specification given a [test suite JSON file](#test-suite-data-format).

The prototype harness is built to be as simple as possible, avoiding external libraries.
Python's native XPath capabilities are limited, further constraining the capabilities of the test suite.

## Consequences

Writing specification tests for profile resolution will require significant resources, but will make profile resolution more approachable for implementors and will make changes to the specification more maintainable.

Due to the "requirement based" approach of the specification test suite, new tests can be added gradually.
Test coverage can be determined by determining which requirements do not have tests.
