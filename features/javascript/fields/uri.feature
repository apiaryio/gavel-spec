@javascript @stable
Feature: URI validation

  Background:
    Given you expect "uri" field to equal "/user?id=1"

  Scenario: Matching URI
    Given actual "uri" field equals "/user?id=1"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And field "uri" equals:
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
    Given actual "uri" field equals "/user?id=2"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And field "uri" equals:
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
