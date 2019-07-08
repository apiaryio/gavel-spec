@javascript
Feature: Status code validation

  Background:
    Given I expect "statusCode" to be "200"

  Scenario: Matching status code
    Given the actual "statusCode" is "200"
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the result field "statusCode" equals:
    """
    {
      "valid": true,
      "kind": "text",
      "values": {
        "expected": "200",
        "actual": "200"
      },
      "errors": []
    }
    """

  Scenario: Non-matching status code
    Given the actual "statusCode" is "304"
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the result field "statusCode" equals:
    """
    {
      "valid": false,
      "kind": "text",
      "values": {
        "expected": "200",
        "actual": "304"
      },
      "errors": [
        {
          "message": "Expected status code '200', but got '304'.",
          "values": {
            "expected": "200",
            "actual": "304"
          }
        }
      ]
    }
    """
