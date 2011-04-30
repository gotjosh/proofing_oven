@http://www.pivotaltracker.com/story/show/12863389 @accounts
Feature: User signs up
  In order to manage my applicants
  As a guest on the front page
  I want to create an account

  - Front page displays sign up link
  - Following sign up takes guest to sign up form
  - Required fields are email, password, and password confirm
  - Password and confirm must match

  Scenario: Successful signup
    Given I am on the home page
    And I follow "Sign up"
    When I fill in "Email" with "joe@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign Up"
    Then I should see "Welcome! You have signed up successfully"

  Scenario: Invalid email
    Given I am on the home page
    And I follow "Sign up"
    When I fill in "Email" with ""
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign Up"
    Then I should see "Email can't be blank"

  Scenario: Invalid password
    Given I am on the home page
    And I follow "Sign up"
    When I fill in "Email" with "joe@example.com"
    And I fill in "Password" with ""
    And I fill in "Password confirmation" with "password"
    And I press "Sign Up"
    Then I should see "Password can't be blank"
    When I fill in "Password" with "password"
    And I fill in "Password confirmation" with "passw"
    And I press "Sign Up"
    Then I should see "Password doesn't match confirmation"
