@nodejs @stable
Feature: Data model

  Scenario: HTTP Request
    When you have the following real HTTP request:
    """
    GET /ip HTTP/1.1
    User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
    Host: httpbin.org
  	Accept: */*
    """
    Then "HTTP Request" JSON representation will look like this:
    """
    {
      "method": "GET",
      "uri": "/ip",
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": ""
    }
    """

  Scenario: HTTP Response
    When you have the following real HTTP response:
    """
  	HTTP/1.1 200 OK
  	Content-Type: application/json
  	Date: Wed, 03 Jul 2013 13:30:53 GMT
  	Server: gunicorn/0.17.4
  	Content-Length: 30
  	Connection: keep-alive

  	{
      "origin": "94.113.241.2"
    }
    """

    Then "HTTP Response" JSON representation will look like this:
    """
    {
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
    }
    """




  Scenario: Expected HTTP Response
    When you expect HTTP status code "200"

    And you expect the following HTTP headers:
    """
    Content-Type: application/json
    Date: Wed, 03 Jul 2013 13:30:53 GMT
    Server: gunicorn/0.17.4
    Content-Length: 30
    Connection: keep-alive
    """

    And you define expected HTTP body using the following "JSON example":
    """
    {
      "origin": "94.113.241.2"
    }
    """

    And you define expected HTTP body using the following "JSON schema":
    """
    {
      "type":"object",
      "$schema": "http://json-schema.org/draft-03/schema",
      "required":true,
      "properties":{
        "object": {
          "type":"object",
          "required":false,
          "properties":{
            "origin": {
              "type":"string",
              "required":true
            }
          }
        }
      }
    }
    """

    Then "Expected HTTP Response" JSON representation will look like this:
    """
    {
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
    }
    """

  Scenario: Expected HTTP Request
    When you expect the following HTTP headers:
    """
    User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
    Host: httpbin.org
    Accept: */*
    """

    And you define expected HTTP body using the following "textual example":
    """
    MyVariableOne=ValueOne&MyVariableTwo=ValueTwo
    """

    Then "Expected HTTP Request" JSON representation will look like this:
    """
    {
      "headers": {
        "user-agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "host": "httpbin.org",
        "accept": "*/*"
      },
      "body": "MyVariableOne=ValueOne&MyVariableTwo=ValueTwo"
    }
    """
