@http://www.pivotaltracker.com/story/show/12863095 @candidates
Feature: User views notes for candidate
  In order to remember how amazing a candidate was
  As a user viewing a candidate
  I want to see the notes for this candidate

  - Candidate show page displays notes
  - The following is displayed for each note:
  -- Note text
  -- Date added

  Scenario:
    Given the following candidate:
      | first name | John |
      | last name  | Doe  |
    And that candidate has the following note:
      | body       | This guy is amazing! |
      | created at | 01/01/2011           |
    And I am signed in
    When I follow "Candidates"
    And I follow "Doe, John"
    Then I should see "This guy is amazing!"
    And I should see "01/01/2011"
