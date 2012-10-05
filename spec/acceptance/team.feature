Feature: Creating and editing a team
  Background:
    Given I am logged in
    And I visit my teams page

  Scenario: creating a new team
    When I click on the 'Create team' button
    Then I am taken to the new team page

  Scenario: saving a team with valid data
    When I visit the new team page
    And I enter data in the required fields
    And I click the 'Create team' button
    Then I should see the 'Delete team' button
