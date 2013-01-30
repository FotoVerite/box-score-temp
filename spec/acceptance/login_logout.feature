Feature: Logging in and logging out as admin
  Background:
    Given there is an admin user in the database
    And I am not logged in

  Scenario: viewing the login link
    When I visit the home page
    Then I should see the "Log in" link

  Scenario: viewing the login page
    When I visit the home page
    And I click on the "Log in" link
    Then I should be sent to a login page

  Scenario: logging in the first time
    Given my sign in count is 0
    When I visit the login page
    And I enter a valid email address and password into the login form
    Then I should see the "Log out" link
    And I should be on my edit account page

  Scenario: logging in subsequent times
    Given my sign in count is greater than 1
    When I visit the login page
    And I enter a valid email address and password into the login form
    Then I should see the "Log out" link
    And I should be on my school's profile page

  Scenario: logging out
    Given I visit the login page
    And I enter a valid email address and password into the login form
    When I visit the home page
    And I click on the "Log out" link
    Then I should see the "Log in" link
