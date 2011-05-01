Feature: User filters candidate list by willing to relocate
  In order to locate a candidate
  As a user viewing the candidate list
  I want to filter by willing to relocate

  Scenario:
    Given the following candidates:
      | first name | last name | status   | willing to relocate |
      | John       | Doe       | pending  | true                |
      | Jeff       | Doe       | hired    | false               |
      | Jane       | Doe       | pending  | false               |
      | Jim        | Doe       | rejected | true                |
    And I am signed in
    When I follow "Candidates"
    And I select "pending" from "Status"
    And I check "Willing to Relocate"
    And I press "Filter"
    Then I should see "John"
    And I should not see "Jeff"
    And I should not see "Jane"
    And I should not see "Jim"
