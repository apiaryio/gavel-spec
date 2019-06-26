@javascript @stable
Feature: Method

  Background:
    Given you expect HTTP message method "POST"

  Scenario: HTTP message method match
    When real HTTP message method is "POST"
    Then field "method" MUST be valid
    And Request or Response MUST be valid

  Scenario: Different HTTP message method
    When real HTTP message method is "GET"
    Then field "method" MUST NOT be valid
    And Request or Response MUST NOT be valid
