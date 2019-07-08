@javascript
Feature: URI validation

  Background:
    Given I expect "uri" to be "/user?id=1"

  Scenario: Matching URI
    Given the actual "uri" is "/user?id=1"
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the result field "uri" equals:
    """
    {
      "valid": true,
      "kind": "text",
      "values": {
        "expected": "/user?id=1",
        "actual": "/user?id=1"
      },
      "errors": []
    }
    """

  Scenario: Non-matching URI
    Given the actual "uri" is "/user?id=2"
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the result field "uri" equals:
    """
    {
      "valid": false,
      "kind": "text",
      "values": {
        "expected": "/user?id=1",
        "actual": "/user?id=2"
      },
      "errors": [
        {
          "message": "Expected URI '/user?id=1', but got '/user?id=2'.",
          "values": {
             "expected": "/user?id=1",
             "actual": "/user?id=2"
          }
        }
      ]
    }
    """
