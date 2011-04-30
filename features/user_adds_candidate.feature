@http://www.pivotaltracker.com/story/show/12863169 @candidates
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
    And I am on the candidates page
    When I follow "Add New Candidate"
    And I fill in "First Name" with "Justin"
    And I fill in "Last Name" with "Timberlake"
    And I select "Rejected" from "Status"
    And I fill in "Email" with "justin@sexyback.com"
    And I fill in "Contact Phone" with "5555555555"
    And I fill in "Github" with "jt"
    And I fill in "Twitter" with "timberlake"
    And I check "Local"
    And I check "Willing to Relocate"
    And I press "Add Candidate"
    Then I should see "Justin Timberlake"
    And I should see "Rejected" in the "Status" section
    And I should see "justin@sexyback.com" in the "Email" section
    And I should see "5555555555" in the "Contact Phone" section
    And I should see "jt" in the "Github" section
    And I should see "timberlake" in the "Twitter" section
    And I should see "Yes" in the "Local" section
    And I should see "Yes" in the "Willing to Relocate" section
