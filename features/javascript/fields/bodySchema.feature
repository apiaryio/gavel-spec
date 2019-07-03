@javascript @stable
Feature: Body validation using JSON Schema (V4)

  Background:
    Given you expect field "body" to match the following "JSON Schema":
    """
    {
      "type": "object",
      "$schema": "http://json-schema.org/draft-04/schema",
      "required": ["version", "user"],
      "properties": {
        "version": {
          "type": "string"
        },
        "permissions": {
          "type": "object",
          "required": ["read", "write"],
          "properties": {
            "read": {
              "type": "boolean"
            },
            "write": {
              "type": "boolean"
            }
          }
        },
        "user": {
          "type": "object",
          "required": ["id"],
          "properties": {
            "id": {
              "type": "number"
            }
          }
        }
      }
    }
    """

  Scenario: With body matching the schema
    Given actual field "body" equals:
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
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "body" equals:
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
    Given actual field "body" equals:
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
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "body" equals:
    """
    {
      "valid": false,
      "kind": "json",
      "values": {
        "actual": "{\n  \"permissions\": {\n    \"read\": true,\n    \"write\": false\n  },\n  \"user\": {\n    \"firstName\": \"John\"\n  }\n}"
      },
      "errors": [
        {
          "message": "At '/version' Missing required property: version",
          "location": {
            "pointer": "/version",
            "property": ["version"]
          }
        },
        {
          "message": "At '/user/id' Missing required property: id",
          "location": {
            "pointer": "/user/id",
            "property": ["user", "id"]
          }
        }
      ]
    }
    """
