@nodejs
Feature: Headers
  http://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2

  Background:
    Given expected following HTTP headers:
    """
    Content-Type: text/plain
    Date: Fri, 31 Dec 1999 23:59:59 GMT
    """

  Scenario: header is missing in real payload
    When following real HTTP headers:
    """
    Content-Type: text/plain
    """
    Then it should set some error for "headers"
  
  Scenario: extra real header in real payload
    When following real HTTP headers:
    """
    Content-Type: text/plain
    Content-Length: 1354
    Date: Fri, 31 Dec 1999 23:59:59 GMT    
    """
    Then it should not set any errors for "headers"
  
  Scenario: real header value is different in real payload
    When following real HTTP headers:
    """
    Content-Type: text/plain
    Date: Sun, 23 Jun 2013 18:29:59 CET
    """
    Then it should set some error for "headers"
  