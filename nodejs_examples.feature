@nodejs
Feature: Node.js JavaScript Examples

  Background:
    Given defined "hit" object:
    """
    var Hit = require('hit').Hit

    var hit = new Hit
    """

  Scenario: Is that hit valid?
    
    When I call:
    """
    hit.isValid()
    """
    
    Then it should return:
    """
    true
    """
  
  Scenario: Get hit validation errors
    When I call:
    """
    hit.validationResults()
    """
    Then it should return:
    """
    { request: 
      { headers: undefined, 
        body: undefined, 
        statusCode: undefined 
      },
      response: 
      { headers: undefined, 
        body: undefined, 
        statusCode: undefined } }
    """

