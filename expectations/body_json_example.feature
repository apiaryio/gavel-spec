@nodejs
Feature: Body - JSON exapmle

  Background: 
    Given you define expected HTTP body by following "JSON example":
    """
    {
      "object": {
        "a": "b",
        "c": "d",
        "e": "f"
      },
      "array": [
        1,
        2
      ],
      "string": "Hello World"
    }    
    """
  
  Scenario: key is missing in real payload JSON body
    When real HTTP body is following:
    """
    {
      "object": {
        "a": "b",
        "c": "d"
      },
      "array": [
        1,
        2
      ]
      "string": "Hello World"
    }
    """
    Then Gavel will set some error for "body"
  
  Scenario: extra key in real JSON body
    When real HTTP body is following:
    """
    {
      "object": {
        "a": "b",
        "c": "d",
        "e": "f"
      },
      "array": [
        1,
        2
      ],
      "string": "Hello World",
      "boolean": true
    }    
    """    
    Then Gavel will NOT set any errors for "body"

  Scenario: different values in real JSON body
    When real HTTP body is following:
    """
    {
      "object": {
        "a": "bau bau",
        "c": "boo boo",
        "e": "mrau mrau"
      },
      "array": [
        1,
        2
      ],
      "string": "Foo bar",
      "boolean": false,

    }    
    """    
    Then Gavel will set some error for "body"


  Scenario: array member is missing in real JSON body
    When real HTTP body is following:
    """
    {
      "object": {
        "a": "bau bau",
        "c": "boo boo",
        "e": "mrau mrau"
      },
      "array": [
        1
      ],
      "string": "Foo bar",
    }    
    """     
    Then Gavel will set some error for "body"

  Scenario: extra array member in real JSON body
    When real HTTP body is following:
    """
    {
      "object": {
        "a": "bau bau",
        "c": "boo boo",
        "e": "mrau mrau"
      },
      "array": [
        1,
        2,
        3
      ],
      "string": "Foo bar"
    }    
    """ 
    Then Gavel will NOT set any errors for "body"
    

