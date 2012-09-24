Feature: Logging in as admin
  Background:
    Given there is an admin user in the database

  Scenario: viewing the login link
    When I visit the home page
    And I am not logged in
    Then I should see the "Log in" link

  Scenario: viewing the logout link
    When I visit the home page
    And I am logged in
    Then I should see the "Log out" link

  Scenario: viewing the login form
    When I visit the home page
    And I click on the "Log in" link
    Then I should be sent to a sign in page

  Scenario: logging in
    When I enter a valid email address and password on the sign in page
    Then I should be taken to the landing page for my school's teams
