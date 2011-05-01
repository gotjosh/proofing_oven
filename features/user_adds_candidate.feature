@http://www.pivotaltracker.com/story/show/12863093 @candidates
Feature: User adds candidate
  In order to hire amazing people
  As a user viewing the candidate list
  I want to add a new candidate

  - Candidate list page has link to add new candidate
  - Following link takes user to new candidate form
  - Fields include
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
    When I follow "Candidates"
    And I follow "Add New Candidate"
    And I fill in "First Name" with "John"
    And I fill in "Last Name" with "Doe"
    And I fill in "Email" with "test@example.com"
    And I fill in "Contact Phone" with "123-456-7890"
    And I select "hired" from "Status"
    And I fill in "Github Id" with "jdoe"
    And I fill in "Twitter Id" with "@jdoe"
    And I check "Local"
    And I check "Willing to Relocate"
    And I press "Add Candidate"
    Then I should see "John Doe"
