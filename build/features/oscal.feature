Feature: Validate OSCAL Content
  As a developer
  I want to validate OSCAL content against appropriate metaschemas

  Background: 
    Given the OSCAL CLI tool is installed
    And the metaschema directory is "../src/metaschema"

  Scenario Outline: Validate OSCAL content
    When I validate "<type>" content in "<path>"
    Then all validations should pass without errors

    Examples:
      | type    | path |
      | profile | ../src/specifications/valid-content/profile.xml|
      | catalog | ../src/specifications/valid-content/catalog.xml|
      | ssp | ../src/specifications/valid-content/ssp.xml|
      | poam | ../src/specifications/valid-content/poam.xml|
      | assessment-plan | ../src/specifications/valid-content/ap.xml|
      | assessment-results | ../src/specifications/valid-content/ar.xml|
