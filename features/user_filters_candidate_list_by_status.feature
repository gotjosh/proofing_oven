@http://www.pivotaltracker.com/story/show/12863117 @candidates @filtering
Feature: User filters candidate list by status
  In order to locate a candidate
  As a user viewing the candidate list
  I want to filter by status

  - Candidate list page displays status filter
  - Choosing a status restricts the results to candidates with that status

  Background:
    Given the following candidates:
      | first name | last name | status   |
      | Mary       | Contrare  | hired    |
      | John       | Smith     | rejected |
    And I am signed in
    And I follow "Candidates"

  Scenario:
    When I select "hired" from "Status"
    And I press "Filter"
    Then I should see "Contrare, Mary"
    And I should not see "Smith, John"

  Scenario:
    When I select "hired" from "Status"
    And I press "Filter"
    And I select "display all" from "Status"
    And I press "Filter"
    Then I should see "Contrare, Mary"
    And I should see "Smith, John"
