@javascript @stable
Feature: Body validation

  Background:
    Given I expect "body" to equal:
    """
    {
      "firstName": "John",
      "lastName": "Locke"
    }
    """

  Scenario: Matching body
    Given the actual "body" equals:
    """
    {
      "firstName": "John",
      "lastName": "Locke"
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
        "expected": "{\n  \"firstName\": \"John\",\n  \"lastName\": \"Locke\"\n}",
        "actual": "{\n  \"firstName\": \"John\",\n  \"lastName\": \"Locke\"\n}"
      },
      "errors": []
    }
    """

  Scenario: Non-matching body
    Given the actual "body" equals:
    """
    {
      "firstName": "John"
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
        "expected": "{\n  \"firstName\": \"John\",\n  \"lastName\": \"Locke\"\n}",
        "actual": "{\n  \"firstName\": \"John\"\n}"
      },
      "errors": [
        {
          "message": "At '/lastName' Missing required property: lastName",
          "location": {
            "pointer": "/lastName",
            "property": ["lastName"]
          }
        }
      ]
    }
    """

  # Comparing JSON to plain text produces a validation error
  # and returns "null" kind, indicating no validation has happened.
  Scenario: Other body type
    Given the actual "body" equals:
    """
    Textual body
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the result field "body" equals:
    """
    {
      "valid": false,
      "kind": null,
      "values": {
        "expected": "{\n  \"firstName\": \"John\",\n  \"lastName\": \"Locke\"\n}",
        "actual": "Textual body"
      },
      "errors": [
        {
          "message": "Can't validate actual media type 'text/plain' against the expected media type 'application/json'.",
          "values": {
            "expected": "{\n  \"firstName\": \"John\",\n  \"lastName\": \"Locke\"\n}",
            "actual": "Textual body"
          }
        }
      ]
    }
    """

    # Comparing text to JSON produces a validation error
    # and "kind: null" stating that no validation has happened.
    Scenario: Text vs JSON
      Given I expect "body" to equal:
      """
      Textual body
      """
      And the actual "body" equals:
      """
      {
        "userId": 1
      }
      """
      When Gavel validates the HTTP message
      Then the actual HTTP message is NOT valid
      And the result field "body" equals:
      """
      {
        "valid": false,
        "kind": null,
        "values": {
          "expected": "Textual body",
          "actual": "{\n  \"userId\": 1\n}"
        },
        "errors": [
          {
            "message": "Can't validate actual media type 'application/json' against the expected media type 'text/plain'.",
            "values": {
              "expected": "Textual body",
              "actual": "{\n  \"userId\": 1\n}"
            }
          }
        ]
      }
      """
