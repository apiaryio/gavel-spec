@draft
Feature: Request URI
  Background:
    Given you expect request URI "/ip"
  
  Scenario: different real request URI
    When real URI is "/user-agent"
    Then Gavel will set some error for "URI"
  
  Scenario: response status code match
    When real URI is "/ip"
    Then Gavel will NOT set any errors for "URI"
