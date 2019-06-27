@javascript @stable
Feature: Body - JSON schema (draft v3)

  Background:
    Given you expect "body" field to match the following "JSON schema":
    """
    {
      "type":"object",
      "$schema": "http://json-schema.org/draft-03/schema",
      "required":true,
      "properties":{
        "object": {
          "type":"object",
          "required":false,
          "properties":{
            "a": {
              "type":"string",
              "required":true
            },
            "c": {
              "type":"string",
              "required":true
            },
            "e": {
              "type":"string",
              "required":true
            }
          }
        },
        "string": {
          "type":"string",
          "required":true
        }
      }
    }
    """

  Scenario: Payload body is valid against given schema
    Given actual "body" field equals:
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
    Then field "body" is valid
    And HTTP message is valid

  Scenario: Payload body not valid against schema
    Given actual "body" field equals:
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
    Then field "body" is NOT valid
    And HTTP message is NOT valid
