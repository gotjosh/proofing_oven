@http://www.pivotaltracker.com/story/show/12863385 @accounts
Feature: User signs in
  In order to manage my applicants
  As a registered user
  I want to sign into my account

  - Front page displays sign in link
  - Following link takes guest to sign in form
  - Valid email and password sign in user
  - Invalid combination displays error

  Background:
    Given the following user:
      | email | joey@example.com |
    And I am on the home page
    And I follow "Sign in"

  Scenario: Success
    When I fill in "Email" with "joey@example.com"
    And I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "Signed in successfully"

  Scenario: Invalid combinations
    When I fill in "Email" with "joey@baddeal.com"
    And I fill in "Password" with "badpassword"
    And I press "Sign In"
    Then I should see "Invalid email or password"
