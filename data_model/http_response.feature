Feature: HTTP response
  
  Background:
    Given you have following example HTTP response:
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

  Scenario: basic JSON representation
    When you serialize HTTP response to JSON
    Then its representation will look like this:
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
      "body": "  {\n  \"origin\": \"94.113.241.2\"\n}"
    }
    """
