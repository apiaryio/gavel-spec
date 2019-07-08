@javascript
Feature: Method

  Background:
    Given I expect "method" to be "POST"

  Scenario: HTTP message method match
    Given the actual "method" is "POST"
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the "method" is valid

  Scenario: Different HTTP message method
    Given the actual "method" is "GET"
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the "method" is NOT valid
