@javascript @stable
Feature: Method validation

  Background:
    Given you expect "method" field to equal "POST"

  Scenario: Matching method
    Given actual "method" field equals "POST"
    When Gavel validates HTTP message
    Then HTTP message is valid
    And field "method" equals:
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
    Given actual "method" field equals "PUT"
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And field "method" equals:
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