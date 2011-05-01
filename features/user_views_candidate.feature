@http://www.pivotaltracker.com/story/show/12863089 @candidates
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
    Given the following candidate:
      | first name          | John             |
      | last name           | Doe              |
      | email               | test@example.com |
      | phone               | 123-456-7890     |
      | status              | hired            |
      | github              | jdoe             |
      | twitter             | @jdoe            |
      | local               | true             |
      | willing to relocate | true             |
    And I am signed in
    When I follow "Candidates"
    And I follow "Doe, John"
    Then I should see "John"
    And I should see "Doe"
    And I should see "test@example.com"
    And I should see "123-456-7890"
    And I should see "hired"
    And I should see "jdoe"
    And I should see "@jdoe"
    And I should see "Yes"
