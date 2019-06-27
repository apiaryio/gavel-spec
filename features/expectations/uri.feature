@javascript @stable
Feature: URI

  Scenario: Matching HTTP message URI
    Given you expect "uri" field to equal "/animals?type=cats"
    And actual "uri" field equals "/animals?type=cats"
    When Gavel validates HTTP message
    Then field "uri" is valid
    And HTTP message is valid

  Scenario: Non-matching HTTP message URI
    Given you expect "uri" field to equal "/animals?type=cats"
    And actual "uri" field equals "/animals?type=dogs"
    When Gavel validates HTTP message
    Then field "uri" is NOT valid
    And HTTP message is NOT valid

  Scenario: URI with the same parameters in different order
    Given you expect "uri" field to equal "/animals?type=cats&count=2"
    And actual "uri" field equals "/animals?count=2&type=cats"
    When Gavel validates HTTP message
    Then field "uri" is valid
    And HTTP message is valid

  Scenario Outline: URI with parameter having multiple values
    Given you expect "uri" field to equal "/animals?type=cats&type=dogs"
    And actual "uri" field equals <real-uri>
    When Gavel validates HTTP message
    Then field "uri" <is-valid>
    And HTTP message <is-valid>

    Examples:
      | real-uri                       | is-valid     |
      | "/animals?type=cats&type=dogs" | is valid     |
      | "/animals?type=dogs&type=cats" | is NOT valid |

  Scenario: Case-sensitive URI comparison
    Given you expect "uri" field to equal "/animals?type=cats"
    And actual "uri" field equals "/animals?tYpe=cAtS"
    When Gavel validates HTTP message
    Then field "uri" is NOT valid
    And HTTP message is NOT valid
