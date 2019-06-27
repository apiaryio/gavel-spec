@javascript @stable
Feature: Headers
  http://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2

  Background:
    Given you expect "headers" field to equal:
      """
      Content-Type: text/plain
      Date: Fri, 31 Dec 1999 23:59:59 GMT
      Location: /here
      ETag: 68b329da9893e34099c7d8ad5cb9c940
      """

  Scenario: Header is missing in real payload
    Given actual "headers" field equals:
      """
      Content-Type: text/plain
      """
    When Gavel validates HTTP message
    Then field "headers" is NOT valid
    And HTTP message is NOT valid

  Scenario: Extra real header in real payload
    Given actual "headers" field equals:
      """
      Content-Type: text/plain
      Content-Length: 1354
      Date: Fri, 31 Dec 1999 23:59:59 GMT
      Location: /here
      ETag: 68b329da9893e34099c7d8ad5cb9c940
      """
    When Gavel validates HTTP message
    Then field "headers" is valid
    And HTTP message is valid

  Scenario: Content nogotiation significant header value is different in real payload
    Given actual "headers" field equals:
      """
      Content-Type: application/json
      Date: Fri, 31 Dec 1999 23:59:59 GMT
      Location: /here
      ETag: 68b329da9893e34099c7d8ad5cb9c940
      """
    When Gavel validates HTTP message
    Then field "headers" is NOT valid
    And HTTP message is NOT valid

  Scenario: Content negotiation not significant header value is different in real payload
    Given actual "headers" field equals:
      """
      Content-Type: text/plain
      Date: Fri, 13 Dec 3000 23:59:59 GMT
      Location: /there
      ETag: something-completely-different
      """
    When Gavel validates HTTP message
    Then field "headers" is valid
    And HTTP message is valid
