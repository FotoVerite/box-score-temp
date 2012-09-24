Feature: Logging in as admin
  Background:
    Given there is a user in the database

  Scenario: viewing the login button
    When I arrive at the home page
    Then I should see the "Log in" button

  Scenario: viewing the login form
    When I click on the "Log in" button
    Then I should be presented with a log in form

  Scenario: logging in
    When I enter a valid email address and password into the log in form
    Then I should be taken to the landing page for my school's teams
