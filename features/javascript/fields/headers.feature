@javascript
Feature: Headers validation

   Background:
    Given I expect "headers" to equal:
    """
    Accept: text/plain
    Content-Type: application/json
    """

  Scenario: Matching headers
    Given the actual "headers" equals:
    """
    Accept: text/plain
    Content-Type: application/json
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the result field "headers" equals:
    """
    {
      "valid": true,
      "kind": "json",
      "values": {
        "expected": {
          "accept": "text/plain",
          "content-type": "application/json"
        },
        "actual": {
          "accept": "text/plain",
          "content-type": "application/json"
        }
      },
      "errors": []
    }
    """

  Scenario: Missing header
    Given the actual "headers" equals:
    """
    Accept: text/plain
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the result field "headers" equals:
    """
    {
      "valid": false,
      "kind": "json",
      "values": {
        "expected": {
          "accept": "text/plain",
          "content-type": "application/json"
        },
        "actual": {
          "accept": "text/plain"
        }
      },
      "errors": [
        {
          "message": "At '/content-type' Missing required property: content-type",
          "location": {
            "pointer": "/content-type",
            "property": ["content-type"]
          }
        }
      ]
    }
    """

  Scenario: Extra header
    Given the actual "headers" equals:
    """
    Accept: text/plain
    Accept-Language: en-US
    Content-Type: application/json
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is valid
    And the result field "headers" equals:
    """
    {
      "valid": true,
      "kind": "json",
      "values": {
        "expected": {
          "accept": "text/plain",
          "content-type": "application/json"
        },
        "actual": {
          "accept": "text/plain",
          "accept-language": "en-us",
          "content-type": "application/json"
        }
      },
      "errors": []
    }
    """

  Scenario: Non-matching headers
    Given the actual "headers" equals:
    """
    Content-Encoding: gzip
    """
    When Gavel validates the HTTP message
    Then the actual HTTP message is NOT valid
    And the result field "headers" equals:
    """
    {
      "valid": false,
      "kind": "json",
      "values": {
        "expected": {
          "accept": "text/plain",
          "content-type": "application/json"
        },
        "actual": {
          "content-encoding": "gzip"
        }
      },
      "errors": [
        {
          "message": "At '/accept' Missing required property: accept",
          "location": {
            "pointer": "/accept",
            "property": ["accept"]
          }
        },
        {
          "message": "At '/content-type' Missing required property: content-type",
          "location": {
            "pointer": "/content-type",
            "property": ["content-type"]
          }
        }
      ]
    }
    """
