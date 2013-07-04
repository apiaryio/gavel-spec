Feature: Data model

  Scenario: HTTP Request
    When you have following example HTTP request:
    """
    GET /ip HTTP/1.1
    User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
  	Host: httpbin.org
  	Accept: */*
    """
    Then "HTTP Response" JSON representation will look like this:
    """
    {
      "method": "GET",
      "uri": "",
      "headers": {
        "User-Agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "Host": "httpbin.org",
        "Accept": "*/*"
      },
      "body": "",
      "expected": null
    }
    """

  Scenario: HTTP Response
    When you have following example HTTP response:
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
    Then "HTTP Request" JSON representation will look like this:
    """
    {
      "status": "200",
      "statusMessage": "OK",
      "headers": {
        "Content-Type": "Content-Type: application/json",
	   	"Date": "Wed, 03 Jul 2013 13:30:53 GMT",
		  "Server": "gunicorn/0.17.4",
		  "Content-Length": "30",
		  "Connection": "keep-alive"
      },
      "body": "  {\n  \"origin\": \"94.113.241.2\"\n}",
      "expected": null
    }
    """

  Scenario: HTTP Message
    When you have following example HTTP request:
    """
    GET /ip HTTP/1.1
    User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
  	Host: httpbin.org
  	Accept: */*
    """
     And you have following example HTTP response:
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
    Then "HTTP Message" JSON representation will look like this:
    """
    {
      "request": {
        "method": "GET",
        "uri": "",
        "headers": {
          "User-Agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
          "Host": "httpbin.org",
          "Accept": "*/*"
        },
        "body": "",
        "expected": null
      },
      "response": {
        "status": "200",
        "statusMessage": "OK",
        "headers": {
          "Content-Type": "Content-Type: application/json",
      		"Date": "Wed, 03 Jul 2013 13:30:53 GMT",
      		"Server": "gunicorn/0.17.4",
      		"Content-Length": "30",
      		"Connection": "keep-alive"
        },
        "body": "  {\n  \"origin\": \"94.113.241.2\"\n}",
        "expected": null
      }
    }
    """

  Scenario: Expected HTTP Request
  Scenario: Expected HTTP Response