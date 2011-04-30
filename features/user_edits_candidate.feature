Feature: User edits candidate

  Scenario: existing attributes
    Given the following candidate:
      | first name | Lar |
      | last name  | Van |
    And I am on the candidates page
    When I follow "Lar Van"
    Then the "First Name" field should contain "Lar"
    And the "Last Name" field should contain "Van"

    When I fill in "First Name" with "Alex"
    And I fill in "Last Name" with "Aguilar"
    And I press "Save"

    Then I should see "Alex Aguilar"
    But I should not see "Lar Van"
