@http://www.pivotaltracker.com/story/show/12863087 @candidates
Feature: User views candidates
  In order to hire amazing people
  As a signed in user
  I want to see a list of candidates

  - Candidates page displays all candidates
  - Sorted by last name, first name
  - Fields displayed include:
  -- Name (last, first)
  -- Phone
  -- Emai
  -- Github
  -- Twitter
  -- Local
  -- Willing to Relocate
  -- Added On
  -- Status (pending, hired, rejected)

  Scenario:
    Given the following candidate:
      | first name          | John             |
      | last name           | Doe              |
      | phone               | 123-456-7890     |
      | email               | test@example.com |
      | github              | jdoe             |
      | twitter             | jdoe             |
      | local               | true             |
      | willing to relocate | true             |
      | created at          | 01/01/2011       |
      | status              | hired            |
    And I am signed in
    When I follow "Candidates"
    Then I should see the following table:
      | Name      | Phone        | Email            | Github | Twitter | Local | Willing to Relocate | Added On   | Status |
      | Doe, John | 123-456-7890 | test@example.com | jdoe   | jdoe    | Yes   | Yes                 | 01/01/2011 | hired  |
