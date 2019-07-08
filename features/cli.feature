@cli @stable @javascript
Feature: Command-line interface
  Installation: `npm install -g gavel`

  Background:
    Given I record expected raw HTTP message:
    """
    curl -s --trace - http://httpbin.org/ip | curl-trace-parser > expected 
    """
    And I record actual raw HTTP message:
    """
    curl -s --trace - http://httpbin.org/ip | curl-trace-parser > actual
    """ 

  Scenario: Read and validate actual raw HTTP message from STDIN
    When I validate the message using the following Gavel command:
    """
    cat actual | gavel expected
    """
    Then exit status is 0

  Scenario: Exit status for invalid message
    When a header is missing in actual message:
    """
    cat actual | grep -v 'Access-Control-Allow-Origin' > actual_without_cors
    """
    And I validate the message using the following Gavel command:
    """
    cat actual_without_cors | curl-trace-parser | gavel expected
    """
    Then exit status is 1
