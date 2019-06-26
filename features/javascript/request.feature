@javascript
Feature: Request validation

  Background:
    Given you call:
    """
    const gavel = require('gavel');
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
    And you define following HTTP request object:
    """
    const actual = {
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

  @stable
  Scenario: validate
    When you call:
    """
    gavel.validate(expected, actual);
    """
    Then it will return:
    """
    {
      valid: true,
      fields: {
        headers: {
          valid: true,
          kind: 'json',
          values: {
            expected: {
              user-agent: 'curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5',
              host: 'httpbin.org',
              accept: '*/*'
            },
            actual: {
              user-agent: 'curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5',
              host: 'httpbin.org',
              accept: '*/*'
            },
          },
          errors: [],
        },
        body: {
          valid: true,
          kind: 'text',
          values: {
            expected: '',
            actual: ''
          },
          errors: [],
        }
      }
    }
    """
