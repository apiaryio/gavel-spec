@draft
Feature: Async API
  
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
    And you define following "expected" vairable:
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
      "body": "{\n  \"origin\": \"94.113.241.2\"\n}",
      "bodySchema": {
        "type": "object",
        "$schema": "http://json-schema.org/draft-03/schema",
        "required": true,
        "properties": {
          "object": {
            "type": "object",
            "required": false,
            "properties": {
              "origin": {
                "type": "string",
                "required": true
              }
            }
          }
        }
      }
    };
    """
    And prepare result variable:
    """
    var validationResult; 
    """

  Scenario: isValid
    When you call:
    """
    gavel.isValid(response, expected, function(error,result){
      validationResult = result;
    });
    """
    Then "validationResult" variable will contain: 
    """
    true
    """

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

  Scenario: isValidatable
    When you call:
    """
    gavel.isValidatable(response, expected, function(error,result){
      validationResult = result;
    });
    """
    Then "validationResult" variable will contain: 
    """
    true
    """