@javascript

Feature: Request Async API

  Background:
    Given you call:
    """
    var gavel = require('gavel');
    """
    And you define the following "request" variable:
    """
    var request = {
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
    And you define the following "expected" variable:
    """
    var expected = {
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": ""
    };
    """
    And prepare result variable:
    """
    var validationResult = "booboo";
    """

  @stable
  Scenario: isValid
    When you call:
    """
    gavel.isValid(request, expected, 'request', function(error,result){
      validationResult = result;
    });
    """
    Then "validationResult" variable will contain:
    """
    true
    """

  @stable
  Scenario: isValidatable
    When you call:
    """
    gavel.isValidatable(request, expected, 'request', function(error,result){
      validationResult = result;
    });
    """
    Then "validationResult" variable will contain:
    """
    true
    """

  @stable
  Scenario: validate
    When you call:
    """
    gavel.validate(request, expected, 'request', function(error,result){
      validationResult = result;
    });
    """
    Then "validationResult" variable will contain:
    """
    { version: "2",
      isValid: true,
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