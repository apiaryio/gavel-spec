@javascript
Feature: Status code

  Background:
    Given I expect "statusCode" to be "200"

  Scenario: Response status code matches
    Given the actual "statusCode" is "200"
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the "statusCode" is valid

  Scenario: Response status code is different
    Given the actual "statusCode" is "500"
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the "statusCode" is NOT valid
 