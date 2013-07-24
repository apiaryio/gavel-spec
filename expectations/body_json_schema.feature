@nodejs
Feature: Body - JSON schema

  Background: 
    Given you define expected HTTP body by following "JSON schema":
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
  
  Scenario: payload body is valid against given schema 
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
    Then Gavel will NOT set any errors for "body"
    And Request or Response is valid
  Scenario: payload body not valid againts schema
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
    Then Gavel will set some error for "body"
    And Request or Response is NOT valid
    
