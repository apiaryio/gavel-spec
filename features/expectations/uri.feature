@javascript @stable
Feature: URI

  Scenario: Matching HTTP message URI
    Given I expect "uri" to be "/animals?type=cats"
    And the actual "uri" is "/animals?type=cats"
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the "uri" is valid

  Scenario: Non-matching HTTP message URI
    Given I expect "uri" to be "/animals?type=cats"
    And the actual "uri" is "/animals?type=dogs"
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the "uri" is NOT valid

  Scenario: URI with the same parameters in different order
    Given I expect "uri" to be "/animals?type=cats&count=2"
    And the actual "uri" is "/animals?count=2&type=cats"
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the "uri" is valid

  Scenario Outline: URI with parameter having multiple values
    Given I expect "uri" to be "/animals?type=cats&type=dogs"
    And the actual "uri" is <real-uri>
    When Gavel validates the HTTP message
    Then the actual HTTP message <is-valid>
    And the "uri" <is-valid>

    Examples:
      | real-uri                       | is-valid     |
      | "/animals?type=cats&type=dogs" | is valid     |
      | "/animals?type=dogs&type=cats" | is NOT valid |

  Scenario: Case-sensitive URI comparison
    Given I expect "uri" to be "/animals?type=cats"
    And the actual "uri" is "/animals?tYpe=cAtS"
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the "uri" is NOT valid
