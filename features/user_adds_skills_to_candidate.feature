Feature: User adds skills to candidate

  Background:
    Given the following skills:
      | name       |
      | BDD        |
      | Javascript |
      | Cucumber   |
      | Rails      |
    And 1 candidate
    When I go to the edit page for that candidate

  Scenario: viewing skill checkboxes
    Then I should see checkboxes for the following skills:
      | BDD        |
      | Javascript |
      | Cucumber   |
      | Rails      |

  # HACK: Rack test clobbering our checkbox params
  @javascript
  Scenario: choosing skills
    When I check "BDD"
    And I check "Rails"
    And I press "Save"

    Then I should see "BDD, Rails"

  # HACK: Rack test clobbering our checkbox params
  @javascript
  Scenario: applied skills appear checked
    When I check "BDD"
    And I check "Rails"
    And I press "Save"

    When I go to the edit page for that candidate
    Then the "BDD" checkbox should be checked
    And the "Rails" checkbox should be checked
