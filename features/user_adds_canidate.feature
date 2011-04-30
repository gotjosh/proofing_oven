Feature: User adds candidate

  Scenario:
    Given I am on the candidates page
    When I follow "Add New Candidate"
    And I fill in "First Name" with "Lar"
    And I fill in "Last Name" with "Van Der Jagt"
    And I fill in "Email" with "lar@hashrocket.com"
    And I fill in "Contact Phone" with "123-456-7891"
    And I fill in "Github ID" with "supaspoida"
    And I fill in "Twitter ID" with "supaspoida"
    And I fill in "Note" with "Hire this guy!"
    And I press "Add Candidate"

    Then I should see "Candidate created successfully"
    And I should see "Lar Van Der Jagt"
