@javascript @stable
Feature: URI

  Scenario: Matching HTTP message URI
    Given you expect HTTP message URI "/animals?type=cats"
    When real HTTP message URI is "/animals?type=cats"
    Then field "uri" is valid
    And Request or Response is valid

  Scenario: Non-matching HTTP message URI
    Given you expect HTTP message URI "/animals?type=cats"
    When real HTTP message URI is "/animals?type=dogs"
    Then field "uri" is NOT valid
    And Request or Response is NOT valid

  Scenario: URI with the same parameters in different order
    Given you expect HTTP message URI "/animals?type=cats&count=2"
    When real HTTP message URI is "/animals?count=2&type=cats"
    Then field "uri" is valid
    And Request or Response is valid

  Scenario Outline: URI with parameter having multiple values
    Given you expect HTTP message URI "/animals?type=cats&type=dogs"
    When real HTTP message URI is <real-uri>
    Then field "uri" <is-valid>
    And Request or Response <is-valid>

    Examples:
      | real-uri                       | is-valid     |
      | "/animals?type=cats&type=dogs" | is valid     |
      | "/animals?type=dogs&type=cats" | is NOT valid |

  Scenario: Case-sensitive URI comparison
    Given you expect HTTP message URI "/animals?type=cats"
    When real HTTP message URI is "/animals?tYpe=cAtS"
    Then field "uri" is NOT valid
    And Request or Response is NOT valid
