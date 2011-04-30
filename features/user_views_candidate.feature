@http://www.pivotaltracker.com/story/show/12863165 @candidates
Feature: User views candidate
  In order to hire amazing people
  As a user viewing candidates
  I want to view the details for a candidate

  - Candidate name in candidate list links to show page
  - Show page displays the following fields:
  -- first name
  -- last name
  -- email
  -- contact phone
  -- status (pending, hired, rejected)
  -- github id
  -- twitter id
  -- local?
  -- willing to relocate?

  Scenario:
    Given I am signed in
    And that user has the following candidate:
      | first name          | Justin              |
      | last name           | Timberlake          |
      | email               | justin@sexyback.com |
      | phone               | 5555555555          |
      | status              | rejected            |
      | github              | jt                  |
      | twitter             | timberlake          |
      | local               | false               |
      | willing to relocate | false               |
    And I am on the candidates page
    When I follow "Justin Timberlake"
    Then the "Candidates" tab should be highlighted
    And I should see "Justin Timberlake"
    And I should see "Rejected" in the "Status" section
    And I should see "justin@sexyback.com" in the "Email" section
    And I should see "5555555555" in the "Contact Phone" section
    And I should see "jt" in the "Github" section
    And I should see "timberlake" in the "Twitter" section
    And I should see "No" in the "Local" section
    And I should see "No" in the "Willing to Relocate" section
