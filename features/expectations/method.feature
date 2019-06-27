@javascript @stable
Feature: method

  Background:
    Given you expect "method" field to equal "POST"

  Scenario: HTTP message method match
    Given actual "method" field equals "POST"
    When Gavel validates HTTP message
    Then field "method" is valid
    And HTTP message is valid

  Scenario: Different HTTP message method
    Given actual "method" field equals "GET"
    When Gavel validates HTTP message
    Then field "method" is NOT valid
    And HTTP message is NOT valid
