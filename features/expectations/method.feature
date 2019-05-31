@stable
Feature: Method

  Background:
    Given you expect HTTP message method "POST"

  Scenario: Different HTTP message method
    When real HTTP message method is "GET"
    Then Gavel will set some errors for "method"
    And Gavel will set "isValid" to "false" for "method"
    And Request or Response is NOT valid

  Scenario: HTTP message method match
    When real method is "POST"
    Then Gavel will NOT set any errors for "method"
    And Gavel will set "isValid" to "true" for "method"
    And Request or Response is valid
