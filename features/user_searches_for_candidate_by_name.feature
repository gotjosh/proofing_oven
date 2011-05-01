@http://www.pivotaltracker.com/story/show/12863121 @candidates @filtering
Feature: User searches for candidate by name
  In order to locate a candidate
  As a user viewing candidates
  I want search by name

  - Candidates page displays text field for search
  - Submitting form filters on first and last name

  Scenario:
    Given the following candidates:
      | first name | last name |
      | Gary       | Coleman   |
      | Webster    | Bean      |
    And I am signed in
    And I follow "Candidates"
    When I fill in "Search" with "Gary"
    And I press "Search"
    Then I should see "Gary"
    And I should not see "Webster"
