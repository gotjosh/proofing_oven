@http://www.pivotaltracker.com/story/show/12863099 @candidates
Feature: User adds note to candidate
  In order to remember how amazing this candidate is
  As a user viewing a candidate
  I want to add a note

  - Candidate show page has link to add note
  - Following link displays text area for note text
  - Filling in note and saving adds note to candidate

  Scenario:
    Given the following candidate:
      | first name | John |
      | last name  | Doe  |
    And I am signed in
    When I follow "Candidates"
    And I follow "Doe, John"
    And I fill in "Note" with "Another cool BDD example"
    And I press "Add Note"
    Then I should see "Another cool BDD example"
