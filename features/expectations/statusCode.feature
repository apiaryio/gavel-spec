@javascript @stable
Feature: statusCode

  Background:
    Given you expect field "statusCode" to equal "200"

  Scenario: Response status code match
    Given actual field "statusCode" equals "200"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "statusCode" is valid

  Scenario: Response status code is different
    Given actual field "statusCode" equals "500"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "statusCode" is NOT valid
 