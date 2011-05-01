@javascript
Feature: User deletes candidate

  Background:
    Given the following candidate:
      | first name | Alex    |
      | last name  | Aguilar |
    And I am on the edit page for that candidate

  Scenario:
    When I follow "Delete Candidate"
    And I accept the "Are you sure?" alert
    Then I should not see "Alex Aguilar" within the candidates table
