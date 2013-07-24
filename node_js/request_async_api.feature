@nodejs 

Feature: Request Async API
  
  Background:
    Given you call:
    """
    var gavel = require('gavel');
    """
    And you define following "request" variable:
    """
    request = {
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
    And you define following "expected" variable:
    """
    expected = {
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
  
  @draft
  Scenario: validate
    When you call:
    """
    gavel.validate(request, expected, function(error,result){
      validationResult = result;
    });
    """
    Then "validationResult" variable will contain: 
    """
    { 
      headers: { 
        length: 0,
        amandaErrors: {},
        now: '1374133598556',
        dataError: null 
      },
      body: { 
        length: 0,
        amandaErrors: {},
        now: '1374133598557',
        dataError: null 
      },
      statusCode: true
    }
    """  