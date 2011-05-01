@http://www.pivotaltracker.com/story/show/12863097 @candidates @nested,attributes
Feature: User adds note to candidate while editing
  In order to remember how amazing this candidate is
  As a user editing a candidate
  I want to add a note

  - Candidate form has text area for note

  Scenario:
    Given the following candidate:
      | first name | John |
      | last name  | Doe  |
    And I am signed in
    When I follow "Candidates"
    And I follow "Doe, John"
    And I follow "Edit Candidate"
    And I fill in "Note" with "This is really fun!"
    And I press "Update Candidate"
    Then I should see "This is really fun!"
