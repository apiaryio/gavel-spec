@nodejs 
Feature: Headers
  http://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2

  Background:
    Given you expect following HTTP headers:
    """
    Content-Type: text/plain
    Date: Fri, 31 Dec 1999 23:59:59 GMT
    """

  Scenario: Header is missing in real payload
    When real HTTP headers are following:
    """
    Content-Type: text/plain
    """
    Then Gavel will set some error for "headers"
    And Request or Response is NOT valid

  Scenario: Extra real header in real payload
    When real HTTP headers are following:
    """
    Content-Type: text/plain
    Content-Length: 1354
    Date: Fri, 31 Dec 1999 23:59:59 GMT    
    """
    Then Gavel will NOT set any errors for "headers"
    And Request or Response is valid
  
  Scenario: Date header value is different in real payload
    When real HTTP headers are following:
    """
    Content-Type: text/plain
    Content-Length: 1354
    Date: Thu, 25 Jul 2013 23:59:59 GMT
    """
    Then Request or Response is valid
    And Gavel will NOT set any errors for "headers"
  
  Scenario: Any other header value is different in real payload
    When real HTTP headers are following:
    """
    Content-Type: application/json
    Date: Fri, 31 Dec 1999 23:59:59 GMT
    """
    Then Gavel will set some error for "headers"
    And Request or Response is NOT valid
  