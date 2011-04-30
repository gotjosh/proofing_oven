Feature: User signs up
  In order to manage my applicants
  As a guest on the front page
  I want to create an account

  Scenario: successful sign up
    Given I am on the home page
    When I follow "Sign up"
    And I fill in "Email" with "shay@hashrocket.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I press "Sign Up"
    Then I should see "Logged in as shay@hashrocket.com"

  Scenario: required fields
    Given I am on the home page
    When I follow "Sign up"
    And I press "Sign Up"
    Then I should see "Email can't be blank"
    And I should see "Password can't be blank"

  Scenario: password match
    Given I am on the home page
    When I follow "Sign up"
    And I fill in "Email" with "shay@hashrocket.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "wrongpassword"
    And I press "Sign Up"
    Then I should see "Password doesn't match confirmation"

  Scenario: ensure email valid
    Given I am on the home page
    When I follow "Sign up"
    And I fill in "Email" with "shay"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I press "Sign Up"
    Then I should see "Email is invalid"
