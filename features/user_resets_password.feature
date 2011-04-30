@http://www.pivotaltracker.com/story/show/12863085 @accounts @email
Feature: User resets password
  In order to access my account
  As a user who can't sign in
  I want to reset my password

  - Sign in page displays forgot password link
  - Following link displays form with the following:
  -- Email
  - Submitting form emails user a link to reset password
  - Following link in email displays form with the following:
  -- New password
  -- Confirm password
  - Submitting form resets password

  Background:
    Given the following confirmed user:
      | email      | test@example.com |
      | first name | Test             |
      | last name  | User             |
    And I am on the home page
    When I follow "Forgot Password"
    And I fill in "Email" with "test@example.com"
    And I press "Send me reset password instructions"

  Scenario: Receiving reset email
    Then "test@example.com" should receive an email

  Scenario: Successfully changing password
    When "test@example.com" opens the email
    And I click the first link in the email
    And I fill in "New password" with "newpassword"
    And I fill in "Confirm new password" with "newpassword"
    And I press "Change my password"
    Then I should see "Logged in as Test User"
