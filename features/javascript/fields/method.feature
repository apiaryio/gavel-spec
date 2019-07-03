@javascript @stable
Feature: Method validation

  Background:
    Given you expect field "method" to equal "POST"

  Scenario: Matching method
    Given actual field "method" equals "POST"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "method" equals:
    """
    {
      "valid": true,
      "kind": "text",
      "values": {
        "expected": "POST",
        "actual": "POST"
      },
      "errors": []
    }
    """

  Scenario: Non-matching method
    Given actual field "method" equals "PUT"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "method" equals:
    """
    {
      "valid": false,
      "kind": "text",
      "values": {
        "expected": "POST",
        "actual": "PUT"
      },
      "errors": [
        {
          "message": "Expected method 'POST', but got 'PUT'.",
          "values": {
            "expected": "POST",
            "actual": "PUT"
          }
        }
      ]
    }
    """