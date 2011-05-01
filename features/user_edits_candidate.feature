@http://www.pivotaltracker.com/story/show/12863091 @candidates
Feature: User edits candidate
  In order to keep candidate data pristine
  As a user viewing a candidate
  I want to edit the candidate

  - Candidate page displays edit link
  - Following link displays candidate form
  -- first name
  -- last name
  -- email
  -- contact phone
  -- status (pending, hired, rejected)
  -- github id
  -- twitter id
  -- local?
  -- willing to relocate?
  - Submitting form displays updated candidate

  Scenario:
    Given the following candidate:
      | first name          | Mary             |
      | last name           | Smith            |
      | email               | test@example.com |
      | phone               | 123-456-7890     |
      | status              | rejected         |
      | github              | msmith           |
      | twitter             | @msmith          |
      | local               | true             |
      | willing to relocate | true             |
    And I am signed in
    When I follow "Candidates"
    And I follow "Smith, Mary"
    And I follow "Edit Candidate"
    And I fill in "First Name" with "John"
    And I fill in "Last Name" with "Doe"
    And I fill in "Email" with "test@example.com"
    And I fill in "Contact Phone" with "123-456-7890"
    And I select "hired" from "Status"
    And I fill in "Github Id" with "jdoe"
    And I fill in "Twitter Id" with "@jdoe"
    And I uncheck "Local"
    And I uncheck "Willing to Relocate"
    And I press "Update Candidate"
    Then I should see "John Doe"
