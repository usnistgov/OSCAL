# Running the unit tests

So far we have unit testing in place for JSON schema generation and for validating correctness of generated schemas by validating instances known to be good or bad.

We will be extending this to cover XSD generation, generation of XML and JSON conversion tooling, and the correctness of those conversions.

Metaschemas should follow this naming convention. Note the use of underscores as delimiters between parts of this name.

where
- `$TESTSET` represents a subdirectory name for a set of tests, such as `datatypes`
- `$SCOPE` is a keyword for a subset of tests in `$TESTSET`, such as `date`
- `$KEYWORD` is a keyword indicating a particular teste
- `$EXPECT` is `PASS` or `FAIL` depending on whether a test instance is known to be valid (it should PASS) or invalid (it should FAIL)


`$TESTSET-$SCOPE_metaschema.xml` is recognized as a Metaschema

`$TESTSET-$SCOPE_test_$KEYWORD_$EXPECT.json is` recognized as a JSON instance to be tested against the Schema produced for the `$TESTSET-$SCOPE` metaschema.

Note that different keywords can be used to distinguish tests expected to be valid or invalid to the metaschema indicated by `$TESTSET-$SCOPE`.

Examples:

- `datatypes-datetime-no-tz_metaschema.xml` - A metaschema for validating the `datatypes-datetime-no-tz` family of tests
- `datatypes-date_test_valid_PASS.json` is a JSON instance expected to be found valid to the schema defined by (derived from) the metaschema
- `datatypes-date_test_tricky_FAIL.json` is a JSON instance expected to be found *invalid* to the schema defined by (derived from) the metaschema



