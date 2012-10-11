Feature: Entering game data
  Background:
    Given I am logged in
    And I have created a basketball team
    And I have created a baseball team

  Scenario: selecting a basketball team
    When I select my basketball team
    Then the potential opponents list should update
    And the game stats table should update with basketball fields
    And the player game stats table should update with basketball player fields
