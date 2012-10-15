Feature: Add a box score
  Background:
    Given I am logged in

  Scenario: Adding a box score for a basketball game
    Given I have a basketball team
    When I click 'Add Box Score'
    And I select my basketball team

    Then the potential opponents list should update
    And the game stats table should update with basketball fields
    And the player game stats table should update with basketball player fields
