@javascript
Feature: Response Sync API

  Background:
    Given you call:
    """
    var gavel = require('gavel');
    """
    And you define following "HttpResponse" object:
    """
    var response = new gavel.HttpResponse({
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
    var expected = new gavel.ExpectedHttpResponse({
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
    response.expected = expected;
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
  Scenario: validate
    When you call:
    """
    response.validate();
    """
    Then it will return:
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
