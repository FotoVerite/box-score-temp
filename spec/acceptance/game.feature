Feature: Entering game data
  Background:
    Given I am logged in

  Scenario: selecting a team
    Given I have a team already created
    When I visit the new game page
    And I click on my team link
    Then I should be taken to the new team form

  Scenario: tallying basketball game scores
    When I enter a point value for a quarter
    Then the team's total score field should update
