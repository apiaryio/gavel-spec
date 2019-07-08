@javascript @stable
Feature: Body validation using JSON Schema (draft v3)

  Background:
    Given you expect "body" to match the following "JSON Schema":
    """
    {
      "type": "object",
      "$schema": "http://json-schema.org/draft-03/schema",
      "properties": {
        "version": {
          "type": "string",
          "required": true
        },
        "permissions": {
          "type": "object",
          "properties": {
            "read": {
              "type": "boolean",
              "required": true
            },
            "write": {
              "type": "boolean",
              "required": true
            }
          }
        },
        "user": {
          "type": "object",
          "properties": {
            "id": {
              "type": "number",
              "required": true
            }
          }
        }
      }
    }
    """

  Scenario: With body matching the schema
    Given the actual "body" equals:
    """
    {
      "version": "stable",
      "user": {
        "id": 1
      },
      "permissions": {
        "read": true,
        "write": true
      }
    }
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the result field "body" equals:
    """
    {
      "valid": true,
      "kind": "json",
      "values": {
        "actual": "{\n  \"version\": \"stable\",\n  \"user\": {\n    \"id\": 1\n  },\n  \"permissions\": {\n    \"read\": true,\n    \"write\": true\n  }\n}"
      },
      "errors": []
    }
    """

  Scenario: With missing required properties
    Given the actual "body" equals:
    """
    {
      "permissions": {
        "read": true,
        "write": false
      },
      "user": {
        "firstName": "John"
      }
    }
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the result field "body" equals:
    """
    {
      "valid": false,
      "kind": "json",
      "values": {
        "actual": "{\n  \"permissions\": {\n    \"read\": true,\n    \"write\": false\n  },\n  \"user\": {\n    \"firstName\": \"John\"\n  }\n}"
      },
      "errors": [
        {
          "message": "The ‘version’ property is required.",
          "location": {
            "pointer": "/version",
            "property": ["version"]
          }
        },
        {
          "message": "The version property must be a string (current value is undefined).\"",
          "location": {
            "pointer": "/version",
            "property": ["version"]
          }
        },
        {
          "message": "The ‘user,id’ property is required.",
          "location": {
            "pointer": "/user/id",
            "property": ["user", "id"]
          }
        },
        {
          "message": "The user,id property must be a number (current value is undefined).\"",
          "location": {
            "pointer": "/user/id",
            "property": ["user", "id"]
          }
        }
      ]
    }
    """
