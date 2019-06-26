@javascript @stable
Feature: Body - JSON example

  Background:
    Given you define expected HTTP body using the following "JSON example":
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

  Scenario: Key is missing in real payload JSON body
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
      ],
      "string": "Hello World"
    }
    """
    Then field "body" MUST NOT be valid
    And Request or Response MUST NOT be valid

  Scenario: Extra key in real JSON body
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
    Then field "body" MUST be valid
    And Request or Response MUST be valid

  Scenario: Different values in real JSON body
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
      "boolean": false
    }
    """
    Then field "body" MUST be valid
    And Request or Response MUST be valid

  Scenario: Extra array member in real JSON body
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
    Then field "body" MUST be valid
    And Request or Response MUST be valid
