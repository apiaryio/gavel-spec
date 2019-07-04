@javascript @stable
Feature: Body - JSON schema (draft v4)

  Background:
    Given you expect "body" to match the following "JSON schema":
    """
    {
      "type":"object",
      "$schema": "http://json-schema.org/draft-04/schema",
      "required": ["string"],
      "properties":{
        "object": {
          "type":"object",
          "required": ["a", "c", "e"],
          "properties":{
            "a": {
              "type":"string"
            },
            "c": {
              "type":"string"
            },
            "e": {
              "type":"string"
            }
          }
        },
        "string": {
          "type":"string"
        }
      }
    }
    """

  Scenario: Payload body is valid against given schema
    Given the actual "body" equals:
    """
    {
      "object": {
        "a": "b",
        "c": "d",
        "e": "f"
      },
      "string": "Hello World"
    }
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the "body" is valid

  Scenario: Payload body not valid against schema
    Given the actual "body" equals:
    """
    {
      "object": {
        "a": "b",
        "c": "d"
      },
      "string": "Hello World"
    }
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the "body" is NOT valid
