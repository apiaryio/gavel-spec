@nodejs @cli @wip
Feature: Command-line interface
  
  Background:
    Given you record expected raw HTTP messages:
    """
    curl -s --trace - http://httpbin.org/ip | curl-trace-parser > expected 
    """
    And you record real raw HTTP message:
    """
    curl -s --trace - http://httpbin.org/ip | curl-trace-parser > real
    """

  Scenario: Read and validate real raw HTTP messages from STDIN

    When you validate messages using following Gavel command:
    """
    cat real | gavel expected
    """
    Then exit status is 0

  Scenario: Exit status for not valid messages

    When there is some header missing in real messages:
    """
    cat real | grep -v 'Access-Control-Allow-Origin' > real_without_cors
    """

    And you validate messages using following Gavel command:
    """
    cat real_without_cors | curl-trace-parser | gavel expected
    """
    
    Then exit status is 1 

    