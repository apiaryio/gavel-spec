@javascript @stable
Feature: Status code

  Background:
    Given you expect HTTP status code "200"

  Scenario: Response status code match
    When real status code is "200"
    Then field "statusCode" is valid
    And Request or Response is valid

  Scenario: Different real response status
    When real status code is "500"
    Then field "statusCode" is NOT valid
    And Request or Response is NOT valid
