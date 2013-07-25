@nodejs 
Feature: Response Sync API
  
  Background:
    Given you call:
    """
    var gavel = require('gavel');
    """
    And you define following "HttpResponse" object:
    """
    response = new gavel.HttpResponse({
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
    });
    """
    And you define following "ExpectedHttpResponse" object:
    """
    expected = new gavel.ExpectedHttpResponse({
      "statusCode": "200",
      "headers": {
        "content-type": "application/json",
        "date": "Wed, 03 Jul 2013 13:30:53 GMT",
        "server": "gunicorn/0.17.4",
        "content-length": "30",
        "connection": "keep-alive"
      },
      "body": "{\n  \"origin\": \"94.113.241.2\"\n}",
    });
    """
    And you add expected "response" to real "response":
    """
    response['expected'] = expected;
    """
  
  @stable
  Scenario: isValid
    When you call:
    """
    response.isValid();
    """
    Then it will return:
    """
    true
    """
  
  @stable
  Scenario: isValidatable
    When you call:
    """
    response.isValidatable();
    """
    Then it will return:
    """
    true
    """

  @draft
  Scenario: validate
    When you call:
    """
    response.validate();
    """
    Then it will return:
    """
    { 
      headers: { 
        length: 0,
        amandaErrors: {},
        now: '1374133598556',
        dataError: null 
      },
      body: { s
        length: 0,
        amandaErrors: {},
        now: '1374133598557',
        dataError: null 
      },
      statusCode: true
    }
    """
