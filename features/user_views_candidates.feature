@http://www.pivotaltracker.com/story/show/12863163 @candidates
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
    Given I am signed in
    And that user has the following candidates:
      | First Name | Last Name | Phone      | Email             | Github    | Twitter | Local | Willing to Relocate | Added On   | Status   |
      | Joe        | Strummer  | 8005551212 | joe@clash.com     | jstrummer | jstrum  | true  | true                | 2011-03-20 | pending  |
      | Kelly      | Pickler   | 5555555555 | kelly@pickler.com | kpickler  | pickle  | false | true                | 2011-04-23 | rejected |
    When I follow "Candidates"
    Then the "Candidates" tab should be highlighted
    And show me the page
    And I should see the following table:
      | Name          | Phone      | Email             | Github    | Twitter | Local | Willing to Relocate | Added On   | Status   |
      | Kelly Pickler | 5555555555 | kelly@pickler.com | kpickler  | pickle  | No    | Yes                 | 04/23/2011 | rejected |
      | Joe Strummer  | 8005551212 | joe@clash.com     | jstrummer | jstrum  | Yes   | Yes                 | 03/20/2011 | pending  |
