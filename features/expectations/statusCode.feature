@javascript @stable
Feature: statusCode

  Background:
    Given you expect "statusCode" field to equal "200"

  Scenario: Response status code match
    Given actual "statusCode" field equals "200"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And field "statusCode" is valid

  Scenario: Response status code is different
    Given actual "statusCode" field equals "500"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And field "statusCode" is NOT valid
 