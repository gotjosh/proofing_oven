@http://www.pivotaltracker.com/story/show/12863155 @accounts
Feature: User signs in
  In order to manage my applicants
  As a registered user
  I want to sign into my account

  - Front page displays sign in link
  - Following link takes guest to sign in form
  - Valid email and password sign in user
  - Invalid combination displays error
  - Welcome message is displayed

  Background:
    Given the following user:
      | email | paul@hashrocket.com |
    And I am on the home page
    When I follow "Sign In"
    And I fill in "Email" with "paul@hashrocket.com"

  Scenario: success
    When I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "Signed in as paul@hashrocket.com"

  Scenario: failure
    When I fill in "Password" with ""
    And I press "Sign In"
    Then I should see "Invalid email or password."
