@https://www.pivotaltracker.com/story/show/12790139 @candidates
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

  Background:
    Given I am on the candidates page
    And I follow "Add New Candidate"
  
  Scenario: successfully created
    When I fill in "First Name" with "Thais"
    And I fill in "Last Name" with "Camilo"
    And I fill in "Email" with "thais@example.com"
    And I fill in "Contact Phone" with "4075551212"
    And I select "pending" from "Status"
    And I fill in "Github ID" with "narwen"
    And I fill in "Twitter ID" with "narwen"
    And I check "Local"
    And I check "Willing to relocate"
    And I press "Add Candidate"
    Then I should see "Successfully added candidate"
    
  Scenario: invalid data
    When I press "Add Candidate"
    Then I should see "First name can't be blank"
    And I should see "Last name can't be blank"
    And I should see "Email can't be blank"
  
  Scenario: cancel new candidate
    When I follow "Cancel"
    Then I should be on the candidates page