@javascript @stable
Feature: Headers 

   Background:
    Given you expect field "headers" to equal:
    """
    Accept: text/plain
    Content-Type: application/json
    """

  Scenario: Matching headers
    Given actual field "headers" equals:
    """
    Accept: text/plain
    Content-Type: application/json
    """
    When Gavel validates HTTP message
    Then HTTP message is valid
    And result field "headers" equals:
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
    Given actual field "headers" equals:
    """
    Accept: text/plain
    """
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "headers" equals:
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
    Given actual field "headers" equals:
    """
    Accept: text/plain
    Accept-Language: en-US
    Content-Type: application/json
    """
    When Gavel validates HTTP message
    Then HTTP message is VALID
    And result field "headers" equals:
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
    Given actual field "headers" equals:
    """
    Content-Encoding: gzip
    """
    When Gavel validates HTTP message
    Then HTTP message is NOT valid
    And result field "headers" equals:
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
