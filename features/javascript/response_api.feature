@javascript
Feature: Response Sync API

  Background:
    Given you call:
    """
    var gavel = require('gavel');
    """
    And you define following HTTP response object:
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
    And you define following expected HTTP response object:
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
      "body": "{\n  \"origin\": \"94.113.241.2\"\n}",
    };
    """

  @stable
  Scenario: validate
    When you call:
    """
    gavel.validate(response, expected);
    """
    Then it will return:
    """
    {
      isValid: true,
      field: {
        headers: {
          results: [],
          realType: 'application/vnd.apiary.http-headers+json',
          expectedType: 'application/vnd.apiary.http-headers+json',
          validator: 'HeadersJsonExample',
          rawData: { length: 0 }
        },
        body: {
          results: [],
          realType: 'application/json',
          expectedType: 'application/json',
          validator: 'JsonExample',
          rawData: { length: 0 }
        },
        statusCode: {
          realType: 'text/vnd.apiary.status-code',
          expectedType: 'text/vnd.apiary.status-code',
          validator: 'TextDiff',
          rawData: '',
          results: []
        }
      }
    }
    """
