@stable
Feature: Status code

  Background:
    Given you expect HTTP status code "200"

  Scenario: Response status code match
    When real status code is "200"
    Then Gavel will NOT set any errors for "statusCode"
    And field "statusCode" is valid
    And Request or Response is valid

  Scenario: Different real response status
    When real status code is "500"
    Then Gavel will set some error for "statusCode"
    And field "statusCode" is NOT valid
    And Request or Response is NOT valid
