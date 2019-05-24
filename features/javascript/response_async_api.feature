@javascript

Feature: Response Async API

  Background:
    Given you call:
    """
    var gavel = require('gavel');
    """
    And you define the following "response" variable:
    """
    var response = {
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
    And you define the following "expected" variable:
    """
    var expected = {
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

  @stable
  Scenario: validate
    When you call:
    """
    gavel.validate(response, expected, 'response', function(error,result){
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
         realType: 'application/json',
         expectedType: 'application/json',
         validator: 'JsonExample',
         rawData: { length: 0 } },
      statusCode:
       { realType: 'text/vnd.apiary.status-code',
         expectedType: 'text/vnd.apiary.status-code',
         validator: 'TextDiff',
         rawData: '',
         results: [] } }
    """
