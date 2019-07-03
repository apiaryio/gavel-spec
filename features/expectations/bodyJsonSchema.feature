@javascript @stable
Feature: Body - JSON schema (draft v4)

  Background:
    Given you expect field "body" to match the following "JSON schema":
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
    Given actual field "body" equals:
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
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "body" is valid

  Scenario: Payload body not valid against schema
    Given actual field "body" equals:
    """
    {
      "object": {
        "a": "b",
        "c": "d"
      },
      "string": "Hello World"
    }
    """
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "body" is NOT valid
