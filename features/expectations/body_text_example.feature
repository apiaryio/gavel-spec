@javascript @stable
Feature: Body - text example

  Background:
    Given you define expected HTTP body using the following "textual example":
      """
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """

  Scenario: Line is missing in real payload body
    When real HTTP body is following:
      """
      One, two, three, four.
      Orange, strawberry, banana?
      """
    Then field "body" MUST NOT be valid
    And Request or Response MUST NOT be valid

  Scenario: Extra line in real payload textual body
    When real HTTP body is following:
      """
      Red, green, blue...
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    Then field "body" MUST NOT be valid
    And Request or Response MUST NOT be valid

  Scenario: Line is changed in real textual body
    When real HTTP body is following:
      """
      Red, green, blue...
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    Then field "body" MUST NOT be valid
    And Request or Response MUST NOT be valid

  Scenario: Text in body equals defined example
    When real HTTP body is following:
      """
      One, two, three, four.
      Orange, strawberry, banana?
      Dog, cat, mouse!
      """
    Then field "body" MUST valid
    And Request or Response MUST valid
