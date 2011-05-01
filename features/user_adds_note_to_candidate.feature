Feature: User adds note to candidate
  In order to remember how amazing this candidate is
  As a user viewing a candidate
  I want to add a note

  - Candidate show page has link to add note
  - Following link displays text area for note text
  - Filling in note and saving adds note to candidate

  Scenario:
    Given the following candidate:
      | first name | John             |
      | last name  | Doe              |
      | email      | john@example.com |
    And I am signed in
    When I follow "Candidates"
    And I follow "John Doe"
    And I fill in "Note" with "John is a nice guy!"
    And I fill in "Tags" with "ThumbsUp"
    And I press "Add Note"
    Then I should be on the candidate page for "john@example.com"
    And I should see "John is a nice guy!"
    And I should see "ThumbsUp"

  @javascript
  Scenario:
    Given the following candidate:
      | first name | John             |
      | last name  | Doe              |
      | email      | john@example.com |
    And I am signed in
    When I follow "Candidates"
    And I follow "John Doe"
    And I fill in "Note" with "John is a nice guy!"
    And I fill in "Tags" with "ThumbsUp"
    And I press "Add Note"
    Then I should be on the candidate page for "john@example.com"
    And I should see "John is a nice guy!" 1 time
    And I should see "ThumbsUp" 1 time
