@stable
Feature: URI

  Background:
    Given you expect HTTP message URI "/animals?type=cats"

  Scenario: HTTP message URI match
    When real HTTP message URI is "/animals?type=cats"
    Then field "uri" is valid
    And Request or Response is valid

  Scenario: Different HTTP message URI
    When real HTTP message URI is "/animals?type=dogs"
    Then field "uri" is NOT valid
    And Request or Response is NOT valid
