@http://www.pivotaltracker.com/story/show/12863079 @accounts
Feature: User signs in
  In order to manage my applicants
  As a registered user
  I want to sign into my account

  - Front page displays sign in link
  - Following link takes guest to sign in form
  - Valid email and password sign in user
  - Invalid combination displays error

  Background:
    Given the following confirmed user:
      | first name            | Test           |
      | last name             | User           |
      | email                 | test@email.com |
      | password              | password       |
      | password confirmation | password       |
    And I am on the home page
    And I follow "Log in"

  Scenario: success
    When I fill in "Email" with "test@email.com"
    And I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "Logged in as Test User"

  Scenario: email validation fails
    When I fill in "Email" with "wrong@email.com"
    And I press "Sign In"
    Then I should see "Invalid email or password"

  Scenario: password validation fails
    When I fill in "Email" with "test@email.com"
    When I fill in "Password" with "bad password"
    And I press "Sign In"
    Then I should see "Invalid email or password"
