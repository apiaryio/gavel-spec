@draft
Feature: Request Method
  Background:
    Given you expect request method "POST"
  
  Scenario: different real request method
    When real method is "GET"
    Then Gavel will set some error for "method"
  
  Scenario: response status code match
    When real method is "POST"
    Then Gavel will NOT set any errors for "method"
