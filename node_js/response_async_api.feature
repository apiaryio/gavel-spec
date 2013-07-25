@nodejs 

Feature: Response Async API
  
  Background:
    Given you call:
    """
    var gavel = require('gavel');
    """
    And you define following "response" variable:
    """
    response = {
      "statusCode": "200",
      "statusMessage": "OK",
      "headers": {
        "content-type": "application/json",
        "date": "Wed, 03 Jul 2013 13:30:53 GMT",
        "server": "gunicorn/0.17.4",
        "content-length": "30",
        "connection": "keep-alive"
      },
      "body": "{\n  \"origin\": \"94.113.241.2\"\n}"
    };
    """
    And you define following "expected" variable:
    """
    expected = {
      "statusCode": "200",
      "headers": {
        "content-type": "application/json",
        "date": "Wed, 03 Jul 2013 13:30:53 GMT",
        "server": "gunicorn/0.17.4",
        "content-length": "30",
        "connection": "keep-alive"
      },
      "body": "{\n  \"origin\": \"94.113.241.2\"\n}"
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
    gavel.isValid(response, expected, 'response', function(error,result){
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
    gavel.isValidatable(response, expected, 'response', function(error,result){
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
    gavel.validate(response, expected, function(error,result){
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