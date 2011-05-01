Feature: User filters candidate list by status
  In order to locate a candidate
  As a user viewing the candidate list
  I want to filter by status

  - Candidate list page displays status filter
  - Choosing a status restricts the results to candidates with that status

  Scenario Outline:
    Given the following candidates:
      | first name | last name | status   |
      | John       | Doe       | pending  |
      | Jeff       | Doe       | hired    |
      | Jane       | Doe       | pending  |
      | Jim        | Doe       | rejected |
    And I am signed in
    When I follow "Candidates"
    And I select "<status>" from "Status"
    And I press "Filter"
    Then I should <john action> "John"
    And I should <jeff action> "Jeff"
    And I should <jane action> "Jane"
    And I should <jim action> "Jim"

    Examples:
      | status   | john action | jeff action | jane action | jim action |
      | pending  | see         | not see     | see         | not see    |
      | hired    | not see     | see         | not see     | not see    |
      | rejected | not see     | not see     | not see     | see        |
