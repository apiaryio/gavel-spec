@javascript @cli
Feature: Command-line interface
  
  Installation: `npm install -g gavel`
  

  Background:
    Given you record expected raw HTTP messages:
    """
    curl -s --trace - http://httpbin.org/ip | curl-trace-parser > expected 
    """
    And you record real raw HTTP messages:
    """
    curl -s --trace - http://httpbin.org/ip | curl-trace-parser > real
    """ 
  
  @stable
  Scenario: Read and validate real raw HTTP message from STDIN

    When you validate the message using the following Gavel command:
    """
    cat real | gavel expected
    """
    Then exit status is 0
  
  @stable
  Scenario: Exit status for invalid message

    When a header is missing in real messages:
    """
    cat real | grep -v 'Access-Control-Allow-Origin' > real_without_cors
    """

    And you validate the message using the following Gavel command:
    """
    cat real_without_cors | curl-trace-parser | gavel expected
    """
    
    Then exit status is 1
