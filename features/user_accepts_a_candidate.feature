Feature: User accepts a candidate

  Background:
    Given the following candidate:
      | email | lar@loosecubes.com |
    And I am on the candidates page

  Scenario: accepting candidate
    When I press "Accept"
    Then I should see "lar@loosecubes.com got the job"
    And "lar@loosecubes.com" should have 1 email
    When "lar@loosecubes.com" opens the email with subject "You got the job!"
    Then they should see "Congratulations" in the email body


