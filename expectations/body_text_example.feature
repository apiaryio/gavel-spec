@nodejs
Feature: Body - text example
  
  Background:
    Given expected HTTP body is defined by following "textual example": 
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
    Then it should set some error for "body"
  
  Scenario: extra line in real payload textual body
    When real HTTP body is following:
    """
    Red, green, blue...
    One, two, free, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then it should set some error for "body"
  
  Scenario: line is changed in real textual body
    When real HTTP body is following:
    """
    Red, green, blue...
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then it should set some error for "body"

  Scenario: text in body equals difened example
    When real HTTP body is following:
    """
    One, two, free, four.
    Orange, strawberry, banana?
    Dog, cat, mouse!
    """
    Then it should not set any errors for "body"


