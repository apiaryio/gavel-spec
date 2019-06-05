@javascript
Feature: Request validation

  Background:
    Given you call:
    """
    const gavel = require('gavel');
    """
    And you define following HTTP request object:
    """
    const request = {
      "method": "GET",
      "uri": "/ip",
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": ""
    };
    """
    And you define following expected HTTP request object:
    """
    const expected = {
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": ""
    };
    """

  @stable
  Scenario: validate
    When you call:
    """
    gavel.validate(request, expected);
    """
    Then it will return:
    """
    {
      isValid: true,
      fields: {
        headers: {
          isValid: true,
          errors: [],
          realType: 'application/vnd.apiary.http-headers+json',
          expectedType: 'application/vnd.apiary.http-headers+json',
          validator: 'HeadersJsonExample',
          rawData: { length: 0 }
        },
        body: {
          isValid: true,
          errors: [],
          realType: 'text/plain',
          expectedType: 'text/plain',
          validator: 'TextDiff',
          rawData: ''
        }
      }
    }
    """
