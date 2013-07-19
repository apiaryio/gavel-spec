@cli @draft
Feature: Command-line interface
  ## Installation

  Scenario: Record a raw HTTP message
  
  When you save curl trace file:
  """
  curl -o /dev/null -s --trace trace_file http://httpbin.org/ip
  """

  And you run Gavel with "--parse-curl-trace" option:
  """
  cat trace_file | gavel --parse-curl-trace > expected
  """

  Then Gavel STDOUT output saved to file "expected" will be following parsed raw HTTP message:
  """
  GET /ip HTTP/1.1
  User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
  Host: httpbin.org
  Accept: */*
  
  HTTP/1.1 200 OK
  Access-Control-Allow-Origin: *
  Content-Type: application/json
  Date: Thu, 18 Jul 2013 15:11:15 GMT
  Server: gunicorn/0.17.4
  Content-Length: 30
  Connection: keep-alive

  {
    "origin": "94.113.241.2"
  }
  """

  Scenario: Read and validate real raw HTTP message from STDIN
  Given you have saved raw HTTP message in file "raw_message"
  And then you use following Gavel command:
  """
  cat raw_message | gavel expected
  """
  And you receive following validation errors to STDOUT:
  """
  
  """

  Scenario: Validate only HTTP Request
  Given you have saved raw HTTP message in file "raw_message"s
  And then you use following Gavel command with "--request" parameter:
  """
  cat raw_message | gavel --request expected
  """
  Then you receive following validation errors to STDOUT:
  """
  
  """
  And STDOUT does not contain any "Response" error

  Scenario: Validate only HTTP Response
  Given you have saved raw HTTP message in file "raw_message"
  When then you use following Gavel command with "--response" parameter:
  """
  cat raw_message | gavel --response expected
  """
  Then you receive following validation errors to STDOUT:
  """
  
  """
  And STDOUT does not contain any "Request errors"
  
  
  Scenario: Read raw HTTP message from file instad of STDIN
  Given you have saved raw HTTP message in file "expected"
  And you have saved raw HTTP message in file "real"
  When you use following Gavel command with "--real" parameter:
  """
  gavel --real real expected
  """
  Then real message is read from "real" file

  Scenario: Supress all output
  When you use following Gavel command with "--quiet" parameter:
  """
  gavel --quiet --real real expected
  """
  Then there is no output on "STERR"

  Scenario: Exit status
  When Gavel detects any validation errors
  Then exit status is 1
  