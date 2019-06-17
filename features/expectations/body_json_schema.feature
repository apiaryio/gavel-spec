@javascript @stable
Feature: Body - JSON schema draft v4

  Background:
    Given you define expected HTTP body using the following "JSON schema":
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
    When real HTTP body is following:
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
    Then field "body" is valid
    And Request or Response is valid

  Scenario: Payload body not valid against schema
    When real HTTP body is following:
    """
    {
      "object": {
        "a": "b",
        "c": "d"
      },
      "string": "Hello World"
    }
    """
    Then field "body" is NOT valid
    And Request or Response is NOT valid
