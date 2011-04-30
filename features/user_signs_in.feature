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
      | email    | jeff@example.com |
      | password | password         |
    And I am on the home page
    When I follow "Sign in"

  Scenario: successful sign in
    When I fill in "Email" with "jeff@example.com"
    And I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "Logged in as jeff@example.com"

  Scenario: invalid username
    When I fill in "Email" with "jeoff@example.com"
    And I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "Invalid email or password."

  Scenario: invalid password
    When I fill in "Email" with "jeff@example.com"
    And I fill in "Password" with "wrongpassword"
    And I press "Sign In"
    Then I should see "Invalid email or password."
