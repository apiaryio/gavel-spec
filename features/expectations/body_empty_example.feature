@javascript @stable
Feature: Body - empty example

  Background:
    Given real HTTP body is empty
    And you define expected HTTP body as empty

  Scenario: HTTP body is textual
    When you expect the following HTTP headers:
    """
    Content-Type: text/plain
    """
    And real HTTP headers are following:
    """
    Content-Type: text/plain
    """
    Then Gavel will NOT set any errors for "body"
    And Request or Response is valid

  Scenario: HTTP body is textual and with no content length
    When you expect the following HTTP headers:
    """
    Content-Type: text/plain
    Content-Length: 0
    """
    And real HTTP headers are following:
    """
    Content-Type: text/plain
    Content-Length: 0
    """
    Then Gavel will NOT set any errors for "body"
    And Request or Response is valid

  Scenario: HTTP body is JSON
    When you expect the following HTTP headers:
    """
    Content-Type: application/json
    """
    And real HTTP headers are following:
    """
    Content-Type: application/json
    """
    Then Gavel will set some error for "body"
    And Request or Response is NOT valid

  Scenario: HTTP body is JSON and with no content length
    When you expect the following HTTP headers:
    """
    Content-Type: application/json
    Content-Length: 0
    """
    And real HTTP headers are following:
    """
    Content-Type: application/json
    Content-Length: 0
    """
    Then Gavel will NOT set any errors for "body"
    And Request or Response is valid
