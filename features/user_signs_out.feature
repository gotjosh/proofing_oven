@http://www.pivotaltracker.com/story/show/12863387 @accounts
Feature: User signs out
  In order to keep my account secure
  As a signed in user
  I want to sign out

  - Sign out link is present
  - Following link ends user session

  Scenario:
    Given I am signed in
    When I follow "Sign out"
    Then I should see "Signed out successfully"
