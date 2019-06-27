@javascript @stable
Feature: Body - text example

  Background:
    Given you expect "body" field to equal:
      """
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """

  Scenario: Line is missing in real payload body
    Given actual "body" field equals:
      """
      One, two, three, four.
      Orange, strawberry, banana?
      """
    When Gavel validates HTTP message
    Then field "body" is NOT valid
    And HTTP message is NOT valid

  Scenario: Extra line in real payload textual body
    Given actual "body" field equals:
      """
      Red, green, blue...
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    When Gavel validates HTTP message
    Then field "body" is NOT valid
    And HTTP message is NOT valid

  Scenario: Line is changed in real textual body
    Given actual "body" field equals:
      """
      Red, green, blue...
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    When Gavel validates HTTP message
    Then field "body" is NOT valid
    And HTTP message is NOT valid

  Scenario: Text in body equals defined example
    Given actual "body" field equals:
      """
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    When Gavel validates HTTP message
    Then field "body" is valid
    And HTTP message is valid
