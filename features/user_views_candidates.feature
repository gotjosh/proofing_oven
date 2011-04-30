Feature: User views candidates

  Scenario: sees some candidates
    Given the following candidates:
      | first name | last name | phone          | email            | github | twitter | local | willing to relocate |
      | John       | Doe       | (904) 555-1212 | john@example.com | john   | john    | true  | false               |
      | Jeff       | Doe       | (904) 555-1212 | jeff@example.com | jeff   | jeff    | false | true                |
      | Jane       | Doe       | (904) 555-1212 | jane@example.com | jane   | jane    | true  | true                |
    And I am signed in
    When I follow "Candidates"
    Then I should see the following table:
      | Name     | Phone          | Email            | Github | Twitter | Local | Willing to Relocate |
      | John Doe | (904) 555-1212 | john@example.com | john   | john    | Yes   | No                  |
      | Jeff Doe | (904) 555-1212 | jeff@example.com | jeff   | jeff    | No    | Yes                 |
      | Jane Doe | (904) 555-1212 | jane@example.com | jane   | jane    | Yes   | Yes                 |
