Feature: User attaches candidate resume

  Background:
    Given 1 candidate
    And I am on the edit page for that candidate

  Scenario: attaching resume
    When I attach the file "candidate_resume.doc" to "Resume"
    And I press "Save"
    Then I should see a link to "candidate_resume.doc"
