@nodejs
Feature: Body - text example
  
  Background:
    Given you define expected HTTP body by following "textual example": 
    """
    One, two, free, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    
  Scenario: line is missing in real payload body
    When real HTTP body is following:
    """
    One, two, free, four.
    Orange, strawberry, banana?
    """
    Then Gavel will set some error for "body"
  
  Scenario: extra line in real payload textual body
    When real HTTP body is following:
    """
    Red, green, blue...
    One, two, free, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then Gavel will set some error for "body"
  
  Scenario: line is changed in real textual body
    When real HTTP body is following:
    """
    Red, green, blue...
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then Gavel will set some error for "body"

  Scenario: text in body equals difened example
    When real HTTP body is following:
    """
    One, two, free, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then Gavel will NOT set any errors for "body"


