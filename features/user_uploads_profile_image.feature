@https://www.pivotaltracker.com/story/show/12794815 @candidates @file,uploads
Feature: User uploads profile image
  In order to know what candidate looks like
  As a user viewing a candidate
  I want to upload a profile image

  - Candidate form displays a link to add a profile image
  - Following link displays an upload field
  - Submitting form attaches image to candidate
  - Candidate page displays candidate's image

  Scenario:
    Given I am on the new candidate page
    When I fill in "First Name" with "Thais"
    And I fill in "Last Name" with "Camilo"
    And I fill in "Email" with "thais@example.com"
    And I attach the file "spec/fixtures/barbie.jpg" to "Profile Image"
    And I press "Add Candidate"
    Then I should see "Successfully added candidate"
    And I should see an image named "barbie.jpg"
    