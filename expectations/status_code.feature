@nodejs-pending
Feature: Status code

  Background:
    Given you expect HTTP status code  "200"
  
  Scenario: different real reaponse status 
    When real status code is "500"
    Then Gavel will set some error for "status code"
  
  Scenario: response status code match
    When real status code is "200"
    Then Gavel will NOT set any errors for "status code"
