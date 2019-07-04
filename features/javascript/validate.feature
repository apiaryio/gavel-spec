@stable @javascript
Feature: validate

  Scenario: HTTP Request
    Given you expect the following HTTP Request:
    """
    {
      "method": "POST",
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": ""
    }
    """
    And the actual HTTP Request equals:
    """
    {
      "method": "POST",
      "uri": "/ip",
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": ""
    }
    """
    When Gavel validates the HTTP message
    # When you call:
    # """
    # gavel.validate(expectedRequest, actualRequest)
    # """
    Then the validation result is:
    """
    {
      "valid": true,
      "fields": {
        "method": {
          "valid": true,
          "kind": "text",
          "values": {
            "expected": "POST",
            "actual": "POST"
          },
          "errors": []
        },
        "headers": {
          "valid": true,
          "kind": "json",
          "values": {
            "expected": {
              "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 openssl/0.9.8x zlib/1.2.5",
              "host": "httpbin.org",
              "accept": "*/*"
            },
            "actual": {
              "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 openssl/0.9.8x zlib/1.2.5",
              "host": "httpbin.org",
              "accept": "*/*"
            }
          },
          "errors": []
        },
        "body": {
          "valid": true,
          "kind": "text",
          "values": {
            "expected": "",
            "actual": ""
          },
          "errors": []
        }
      }
    }
    """

  Scenario: HTTP Response
  Given you expect the following HTTP Response:
  """
  {
    "statusCode": "200",
    "headers": {
      "content-type": "application/json",
      "date": "Wed, 03 Jul 2013 13:30:53 GMT",
      "server": "gunicorn/0.17.4",
      "content-length": "30",
      "connection": "keep-alive"
    },
    "body": "{\n  \"origin\": \"94.113.241.2\"\n}"
  }
  """
  And the actual HTTP Response equals:
  """
  {
    "statusCode": "200",
    "headers": {
      "content-type": "application/json",
      "date": "Wed, 03 Jul 2013 13:30:53 GMT",
      "server": "gunicorn/0.17.4",
      "content-length": "30",
      "connection": "keep-alive"
    },
    "body": "{\n  \"origin\": \"94.113.241.2\"\n}"
  }
  """
  When Gavel validates the HTTP message
  # When you call:
  # """
  # gavel.validate(expectedResponse, actualResponse)
  # """
  Then the validation result is:
  """
  {
    "valid": true,
    "fields": {
      "statusCode": {
        "valid": true,
        "kind": "text",
        "values": {
          "expected": "200",
          "actual": "200"
        },
        "errors": []
      },
      "headers": {
        "valid": true,
        "kind": "json",
        "values": {
          "expected": {
            "content-type": "application/json",
            "date": "wed, 03 jul 2013 13:30:53 gmt",
            "server": "gunicorn/0.17.4",
            "content-length": "30",
            "connection": "keep-alive"
          },
          "actual": {
            "content-type": "application/json",
            "date": "wed, 03 jul 2013 13:30:53 gmt",
            "server": "gunicorn/0.17.4",
            "content-length": "30",
            "connection": "keep-alive"
          }
        },
        "errors": []
      },
      "body": {
        "valid": true,
        "kind": "json",
        "values": {
          "expected": "{\n  \"origin\": \"94.113.241.2\"\n}",
          "actual": "{\n  \"origin\": \"94.113.241.2\"\n}"
        },
        "errors": []
      }
    }
  }
  """
