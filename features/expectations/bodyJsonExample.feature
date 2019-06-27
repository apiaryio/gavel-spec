@javascript @stable
Feature: Body - JSON example

  Background:
    Given you expect "body" field to equal:
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

  Scenario: Key is missing in actual payload JSON body
    Given actual "body" field equals:
    """
    {
      "object": {
        "a": "b",
        "c": "d"
      },
      "array": [
        1,
        2
      ],
      "string": "Hello World"
    }
    """
    When Gavel validates HTTP message
    Then field "body" is NOT valid
    And HTTP message is NOT valid

  Scenario: Extra key in actual JSON body
    Given actual "body" field equals:
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
    When Gavel validates HTTP message
    Then field "body" is valid
    And HTTP message is valid

  Scenario: Different values in actual JSON body
    Given actual "body" field equals:
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
      "boolean": false
    }
    """
    When Gavel validates HTTP message
    Then field "body" is valid
    And HTTP message is valid

  Scenario: Extra array member in actual JSON body
    Given actual "body" field equals:
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
    When Gavel validates HTTP message
    Then field "body" is valid
    And HTTP message is valid
