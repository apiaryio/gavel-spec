@javascript @stable
Feature: Status code validation

  Background:
    Given you expect field "statusCode" to equal "200"

  Scenario: Matching status code
    Given actual field "statusCode" equals "200"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "statusCode" equals:
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
    Given actual field "statusCode" equals "304"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "statusCode" equals:
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
