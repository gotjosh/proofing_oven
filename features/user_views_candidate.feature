@https://www.pivotaltracker.com/story/show/12790577 @candidates
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
       | first name | Thais                 |
       | last name  | Camilo                |
       | status     | Pending               |
       | phone      | 9041231234            |
       | email      | thais@hashrocket.com  |
       | github     | narwen                |
       | twitter    | narwen                |
       | local      | true                  |
       | relocate   | true                  |
      And I am on the home page
      When I follow "Thais Camilo"
      Then I should see "Thais Camilo"
      And I should see "Pending" in the "Status" section
      And I should see "9041231234" in the "Contact Phone" section
      And I should see "thais@hashrocket.com" in the "Email" section
      And I should see "narwen" in the "Github" section
      And I should see "narwen" in the "Twitter" section
      And I should see "Yes" in the "Local?" section
      And I should see "Yes" in the "Willing to Relocate?" section 