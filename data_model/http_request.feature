Feature: HTTP request

  Background:
    Given you have following example HTTP request:
    """
    GET /ip HTTP/1.1
    User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
  	Host: httpbin.org
  	Accept: */*
    """
  Scenario: basic JSON representation
    When you serialize HTTP request to JSON
    Then its representation will look like this:
    """
    {
      "method": "GET",
      "uri": "",
      "headers": {
        "User-Agent": "curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5",
        "Host": "httpbin.org",
        "Accept": "*/*"
      },
      "body": ""
    }
    """
