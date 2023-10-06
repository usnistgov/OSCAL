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

<!-- TODO -->

### SpecML

The specification format will remain unchanged for now.
There is an argument for the format to be replaced or simplified in the future, but the use of `@id` attributes for sections and requirements make linking a test to a example simple.

### Test Suite Data Format

<!-- TODO -->

### Test Harness

<!-- TODO -->

## Consequences

Writing specification tests for profile resolution will require significant resources, but will make profile resolution more approachable for implementors and will make changes to the specification more maintainable.

Due to the "requirement based" approach of the specification test suite, new tests can be added gradually.
Test coverage can be determined by determining which requirements do not have tests.
