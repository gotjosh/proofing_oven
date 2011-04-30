@http://www.pivotaltracker.com/story/show/12863083 @accounts
Feature: User signs up
  In order to manage my applicants
  As a guest on the front page
  I want to create an account

  - Front page displays sign up link
  - Following sign up takes guest to sign up form
  - Required fields are email, password, and password confirm
  - Password and confirm must match

  Background:
    Given I am on the home page
    And I follow "Sign up"

  Scenario: Success
    When I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign Up"
    Then "test@example.com" should receive an email
    And I open the email
    And I click the first link in the email
    And I should see "Your account was successfully confirmed. You are now signed in."

  Scenario: Email validation
    When I fill in "Email" with ""
    And I press "Sign Up"
    Then I should see "Email can't be blank"

  Scenario: Password validation
    When I fill in "Password" with ""
    And I press "Sign Up"
    Then I should see "Password can't be blank"

  Scenario: Password Confirmation validation
    When I fill in "Password" with "password"
    And I fill in "Password confirmation" with "something"
    And I press "Sign Up"
    Then I should see "Password doesn't match confirmation"
