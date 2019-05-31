@stable
Feature: URI

  Background:
    Given you expect HTTP message URI "http://apiary.io/path"

  Scenario: Different HTTP message URI
    When real HTTP message URI is "http://foo.bar"
    Then Gavel will set some errors for "uri"
    And Gavel will set "isValid" to "false" for "uri"
    And Request or Response is NOT valid

  Scenario: HTTP message URI match
    When real HTTP message URI is "http://apiary.io/path"
    Then Gavel will NOT set any errors for "uri"
    And Gavel will set "isValid" to "true" for "uri"
    And Request or Response is valid
