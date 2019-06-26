@javascript
Feature: Response validation

  Background:
    Given you call:
    """
    const gavel = require('gavel');
    """
    And you define following expected HTTP response object:
    """
    const expected = {
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
    And you define following HTTP response object:
    """
    const real = {
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

  @stable
  Scenario: validate
    When you call:
    """
    gavel.validate(expected, real);
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
              content-type': 'application/json',
              date': 'Wed, 03 Jul 2013 13:30:53 GMT',
              server': 'gunicorn/0.17.4',
              content-length': '30',
              connection': 'keep-alive'
            },
            actual: {
              content-type': 'application/json',
              date': 'Wed, 03 Jul 2013 13:30:53 GMT',
              server': 'gunicorn/0.17.4',
              content-length': '30',
              connection': 'keep-alive'
            },
          },
          errors: [],
        },
        body: {
          valid: true,
          kind: 'json',
          values: {
            expected: '{\n  \"origin\": \"94.113.241.2\"\n}',
            actual: '{\n  \"origin\": \"94.113.241.2\"\n}'
          },
          errors: [],
        },
        statusCode: {
          valid: true,
          kind: 'text',
          values: {
            expected: 200,
            actual: 200
          },
          errors: [],
        }
      }
    }
    """
