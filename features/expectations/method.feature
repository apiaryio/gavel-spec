@javascript @stable
Feature: method

  Background:
    Given you expect field "method" to equal "POST"

  Scenario: HTTP message method match
    Given actual field "method" equals "POST"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "method" is valid

  Scenario: Different HTTP message method
    Given actual field "method" equals "GET"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "method" is NOT valid
