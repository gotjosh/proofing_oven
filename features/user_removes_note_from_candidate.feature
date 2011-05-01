@http://www.pivotaltracker.com/story/show/12863101 @candidates
Feature: User removes note from candidate
  In order to keep candidate data pristine
  As a user viewing a candidate
  I want to remove a note

  - Candidate page displays link to delete note
  - Following remove link prompts user for confirmation
  - Note is deleted upon confirmation

  Scenario:
    Given the following candidate:
      | first name | Mary |
      | last name  | Jane |
    And that candidate has the following note:
      | body       | This guy is radical! |
      | created at | 01/01/2011           |
    And I am signed in
    And I follow "Candidates"
    And I follow "Jane, Mary"
    When I follow "delete"
    Then I should not see "This guy is radical!"
