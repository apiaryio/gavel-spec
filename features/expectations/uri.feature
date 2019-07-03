@javascript @stable
Feature: URI

  Scenario: Matching HTTP message URI
    Given you expect field "uri" to equal "/animals?type=cats"
    And actual field "uri" equals "/animals?type=cats"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "uri" is valid

  Scenario: Non-matching HTTP message URI
    Given you expect field "uri" to equal "/animals?type=cats"
    And actual field "uri" equals "/animals?type=dogs"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "uri" is NOT valid

  Scenario: URI with the same parameters in different order
    Given you expect field "uri" to equal "/animals?type=cats&count=2"
    And actual field "uri" equals "/animals?count=2&type=cats"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "uri" is valid

  Scenario Outline: URI with parameter having multiple values
    Given you expect field "uri" to equal "/animals?type=cats&type=dogs"
    And actual field "uri" equals <real-uri>
    When Gavel validates HTTP message
    Then HTTP message <is-valid>
    And result field "uri" <is-valid>

    Examples:
      | real-uri                       | is-valid     |
      | "/animals?type=cats&type=dogs" | is valid     |
      | "/animals?type=dogs&type=cats" | is NOT valid |

  Scenario: Case-sensitive URI comparison
    Given you expect field "uri" to equal "/animals?type=cats"
    And actual field "uri" equals "/animals?tYpe=cAtS"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "uri" is NOT valid
