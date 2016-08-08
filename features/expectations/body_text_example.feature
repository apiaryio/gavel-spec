@nodejs @stable
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
    Then Gavel will set some error for "body"
    And Request or Response is NOT valid

  Scenario: Extra line in real payload textual body
    When real HTTP body is following:
    """
    Red, green, blue...
    One, two, three, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then Gavel will set some error for "body"
    And Request or Response is NOT valid

  Scenario: Line is changed in real textual body
    When real HTTP body is following:
    """
    Red, green, blue...
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then Gavel will set some error for "body"
    And Request or Response is NOT valid

  Scenario: Text in body equals defined example
    When real HTTP body is following:
    """
    One, two, three, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then Gavel will NOT set any errors for "body"
    And Request or Response is valid

