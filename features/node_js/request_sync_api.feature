@nodejs
Feature: request Sync API

  Background:
    Given you call:
    """
    var gavel = require('gavel');
    """
    And you define following "Httprequest" object:
    """
    request = new gavel.HttpRequest({
      "method": "GET",
      "uri": "/ip",
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": ""
    });
    """
    And you define following "ExpectedHttpRequest" object:
    """
    expected = new gavel.ExpectedHttpRequest({
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": ""
    });
    """
    And you add expected "request" to real "request":
    """
    request['expected'] = expected;
    """

  @stable
  Scenario: isValid
    When you call:
    """
    request.isValid();
    """
    Then it will return:
    """
    true
    """

  @stables
  Scenario: isValidatable
    When you call:
    """
    request.isValidatable();
    """
    Then it will return:
    """
    true
    """

  @stable
  Scenario: validate
    When you call:
    """
    request.validate();
    """
    Then it will return:
    """
    { version: "2",
      headers:
       { results: [],
         realType: 'application/vnd.apiary.http-headers+json',
         expectedType: 'application/vnd.apiary.http-headers+json',
         validator: 'HeadersJsonExample',
         rawData: { length: 0 } },
      body:
       { results: [],
         realType: 'text/plain',
         expectedType: 'text/plain',
         validator: 'TextDiff',
         rawData: '' } }
    """
