@http://www.pivotaltracker.com/story/show/12863081 @accounts
Feature: User signs out
  In order to keep my account secure
  As a signed in user
  I want to sign out

  - Sign out link is present
  - Following link ends user session

  Background:
    Given I am signed in
    When I follow "Log out"
    Then I should not see "Log out"
    And I should see "Log in"

