@javascript @stable
Feature: Status code

  Background:
    Given you expect HTTP status code "200"

  Scenario: Response status code match
    When real status code is "200"
    Then field "statusCode" MUST be valid
    And Request or Response MUST be valid

  Scenario: Different real response status
    When real status code is "500"
    Then field "statusCode" MUST NOT be valid
    And Request or Response MUST NOT be valid
