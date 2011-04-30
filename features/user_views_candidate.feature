@http://www.pivotaltracker.com/story/show/12863239 @candidates
Feature: User views candidate
  In order to hire amazing people
  As a user viewing candidates
  I want to view the details for a candidate

  Scenario:
    Given it is currently "2011-02-02 12:00"
    And the following candidate:
      | first name          | John             |
      | last name           | Doe              |
      | phone               | (904) 555-1212   |
      | email               | john@example.com |
      | github              | john-github      |
      | twitter             | john-twitter     |
      | local               | true             |
      | willing to relocate | false            |
      | status              | pending          |
    And I am signed in
    When I follow "Candidates"
    And I follow "John Doe"
    Then I should be on the candidate page for "john@example.com"
    And I should see "John Doe"
    And I should see "(904) 555-1212"
    And I should see "john@example.com"
    And I should see "john-github"
    And I should see "john-twitter"
    And I should see "Yes"
    And I should see "No"
    And I should see "Pending"
    And I should see "02/02/2011"
