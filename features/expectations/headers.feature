@javascript
Feature: Headers
  http://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2

  Background:
    Given you expect the following HTTP headers:
    """
    Content-Type: text/plain
    Date: Fri, 31 Dec 1999 23:59:59 GMT
    Location: /here
    ETag: 68b329da9893e34099c7d8ad5cb9c940
    """

  @stable
  Scenario: Header is missing in real payload
    When real HTTP headers are following:
    """
    Content-Type: text/plain
    """
    Then Gavel will set some error for "headers"
    And Gavel will set "isValid" to "false" for "headers"
    And Request or Response is NOT valid

  @stable
  Scenario: Extra real header in real payload
    When real HTTP headers are following:
    """
    Content-Type: text/plain
    Content-Length: 1354
    Date: Fri, 31 Dec 1999 23:59:59 GMT
    Location: /here
    ETag: 68b329da9893e34099c7d8ad5cb9c940
    """
    Then Gavel will NOT set any errors for "headers"
    And Gavel will set "isValid" to "true" for "headers"
    And Request or Response is valid

  @stable
  Scenario: Content nogotiation significant header value is different in real payload
    When real HTTP headers are following:
    """
    Content-Type: application/json
    Date: Fri, 31 Dec 1999 23:59:59 GMT
    Location: /here
    ETag: 68b329da9893e34099c7d8ad5cb9c940
    """
    Then Gavel will set some error for "headers"
    And Gavel will set "isValid" to "false" for "headers"
    And Request or Response is NOT valid

  @stable
  Scenario: Content negotiation not significant header value is different in real payload
    When real HTTP headers are following:
    """
    Content-Type: text/plain
    Date: Fri, 13 Dec 3000 23:59:59 GMT
    Location: /there
    ETag: something-completely-different
    """
    Then Gavel will NOT set any errors for "headers"
    And Gavel will set "isValid" to "true" for "headers"
    And Request or Response is valid


