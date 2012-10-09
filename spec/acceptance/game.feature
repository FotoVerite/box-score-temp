Feature: Entering game data
  Background:
    Given I am logged in
    And I have a team already created
    And I visit the new game page

  Scenario: selecting a team
    When I click on my team link
    Then I should be taken to the new box score form

  @javascript
  Scenario: tallying basketball game scores
    When I click on my team link
    And I enter a point value for each quarter
    Then the team's total score field should update
