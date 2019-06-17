@stable
Feature: Method

  Background:
    Given you expect HTTP message method "POST"

  Scenario: HTTP message method match
    When real method is "POST"
    Then field "method" is valid
    And Request or Response is valid

  Scenario: Different HTTP message method
    When real HTTP message method is "GET"
    Then field "method" is NOT valid
    And Request or Response is NOT valid
