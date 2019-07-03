@javascript @stable
Feature: URI validation

  Background:
    Given you expect field "uri" to equal "/user?id=1"

  Scenario: Matching URI
    Given actual field "uri" equals "/user?id=1"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "uri" equals:
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
    Given actual field "uri" equals "/user?id=2"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "uri" equals:
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
