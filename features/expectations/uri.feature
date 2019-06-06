@stable
Feature: URI

  Background:
    Given you expect HTTP message URI "https://domain.com/path"

  Scenario: HTTP message URI match
    When real HTTP message URI is "http://foo.bar"
    Then field "uri" is valid
    And Request or Response is valid

  Scenario: Different HTTP message URI
    When real HTTP message URI is "https://domain.com/path"
    Then field "uri" is NOT valid
    And Request or Response is NOT valid
