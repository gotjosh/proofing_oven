@http://www.pivotaltracker.com/story/show/12863175 @candidates
Feature: User adds note to candidate
  In order to remember how amazing this candidate is
  As a user viewing a candidate
  I want to add a note

  - Candidate show page has link to add note
  - Following link displays text area for note text
  - Filling in note and saving adds note to candidate

  Background:
    Given I am signed in
    And that user has the following candidate:
      | First Name | Justin     |
      | Last Name  | Timberlake |
    And today is "2010-04-01"
    And I am on the candidates page
    When I follow "Justin Timberlake"

  Scenario: without javascript
    When I fill in "Note" with "Great producer"
    And I press "Add Note"
    Then I should see "Great producer" in the "04/01/2010" section

  @javascript
  Scenario: with javascript
    When I fill in "Note" with "Great producer"
    And I press "Add Note"
    Then I should see "Great producer" in the "04/01/2010" section
    And the "Note" field should be empty
