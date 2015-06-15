Feature: Looking at games
  Background:
    Given There exists many games

  Scenario: When I am at the games page
    When I go to see the games
    Then I can see the games
