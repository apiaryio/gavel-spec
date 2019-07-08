@javascript @stable
Feature: Body - JSON schema (draft v3)

  Background:
    Given I expect "body" to match the following "JSON schema":
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
