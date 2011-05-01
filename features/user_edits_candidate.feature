@http://www.pivotaltracker.com/story/show/12863167 @candidates
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
    And I follow "Edit"
    Then the "Candidates" tab should be highlighted
    And the "First Name" field should contain "Justin"
    And the "Last Name" field should contain "Timberlake"
    And the "Status" select should contain "Rejected"
    And the "Email" field should contain "justin@sexyback.com"
    And the "Contact Phone" field should contain "5555555555"
    And the "Github" field should contain "jt"
    And the "Twitter" field should contain "timberlake"
    And the "Local" checkbox should not be checked
    And the "Willing to Relocate" checkbox should not be checked
    When I fill in "First Name" with "Britney"
    And I fill in "Last Name" with "Spears"
    And I select "Accepted" from "Status"
    And I fill in "Email" with "britney@diditagain.com"
    And I fill in "Contact Phone" with "6666666666"
    And I fill in "Github" with "bs"
    And I fill in "Twitter" with "britney"
    And I check "Local"
    And I check "Willing to Relocate"
    And I press "Save"
    Then I should see "Britney Spears"
    And I should see "Accepted" in the "Status" section
    And I should see "britney@diditagain.com" in the "Email" section
    And I should see "6666666666" in the "Contact Phone" section
    And I should see "bs" in the "Github" section
    And I should see "britney" in the "Twitter" section
    And I should see "Yes" in the "Local" section
    And I should see "Yes" in the "Willing to Relocate" section
