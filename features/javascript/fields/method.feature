@javascript @stable
Feature: Method validation

  Background:
    Given I expect "method" to be "POST"

  Scenario: Matching method
    Given the actual "method" is "POST"
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the result field "method" equals:
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
    Given the actual "method" is "PUT"
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the result field "method" equals:
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