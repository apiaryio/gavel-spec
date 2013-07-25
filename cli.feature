@nodejs @cli
Feature: Command-line interface
  
  Installation: `npm install -g gavel`
  

  Background:
    Given you record expected raw HTTP messages:
    """
    curl -s --trace - http://httpbin.org/ip | curl-trace-parser > expected 
    """
    And you record real raw HTTP message:
    """
    curl -s --trace - http://httpbin.org/ip | curl-trace-parser > real
    """ 
  
  @stable
  Scenario: Read and validate real raw HTTP messages from STDIN

    When you validate messages using following Gavel command:
    """
    cat real | gavel expected
    """
    Then exit status is 0
  
  @stable
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

    