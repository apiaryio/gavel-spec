@proposal
Feature: Request URI
  Background:
    Given you expect request URI "/ip"
  
  Scenario: Different real request URI
    When real URI is "/user-agent"
    Then Gavel will set some error for "URI"
  
  Scenario: Response status code match
    When real URI is "/ip"
    Then Gavel will NOT set any errors for "URI"
