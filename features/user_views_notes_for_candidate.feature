@http://www.pivotaltracker.com/story/show/12863171 @candidates
Feature: User views notes for candidate
  In order to remember how amazing a candidate was
  As a user viewing a candidate
  I want to see the notes for this candidate

  - Candidate show page displays notes
  - The following is displayed for each note:
  -- Note text
  -- Date added

  Scenario:
    Given I am signed in
    And that user has the following candidate:
      | First Name | Justin     |
      | Last Name  | Timberlake |
    And that candidate has the following notes:
      | Comment          | Added On   |
      | Great producer   | 2011-04-30 |
      | Can carry a tune | 2011-05-01 |
    And I am on the candidates page
    When I follow "Justin Timberlake"
    Then I should see "Great producer" in the "04/30/2011" section
    And I should see "Can carry a tune" in the "05/01/2011" section
