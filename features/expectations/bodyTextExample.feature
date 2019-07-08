@javascript
Feature: Body - text example

  Background:
    Given I expect "body" to equal:
      """
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """

  Scenario: Line is missing in real payload body
    Given the actual "body" equals:
      """
      One, two, three, four.
      Orange, strawberry, banana?
      """
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the "body" is NOT valid

  Scenario: Extra line in real payload textual body
    Given the actual "body" equals:
      """
      Red, green, blue...
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the "body" is NOT valid

  Scenario: Line is changed in real textual body
    Given the actual "body" equals:
      """
      Red, green, blue...
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the "body" is NOT valid

  Scenario: Text in body equals defined example
    Given the actual "body" equals:
      """
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the "body" is valid
