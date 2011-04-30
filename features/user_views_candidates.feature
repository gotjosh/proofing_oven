@https://www.pivotaltracker.com/story/show/12789945 @candidates
Feature: User views candidates
  In order to hire amazing people
  As a user
  I want to see a list of candidates

  - Candidates page displays all candidates
  - Fields displayed include:
  -- *Name (last, first)
  -- Phone
  -- *Email
  -- Github
  -- Twitter
  -- Local
  -- Willing to Relocate

  Scenario:
    Given the following candidates:
      | first name | last name | phone      | email                 | github      | twitter     | local | relocate |
      | Thais      | Camilo    | 9041231234 | thais@hashrocket.com  | narwen      | narwen      | true  | true     |
      | Tim        | Chopoorian| 7209410156 | tim@chopoorian.com    | tchopoorian | tchopoorian | false | false    |
      | Matt       | Conway    | 9045011294 | matthew@hashrocket.com| mattonrails | mattonrails | true  | true     |
     And I am on the home page
     Then I should see the following table:
      | Name           | Phone      | Email                  | Github      | Twitter     | Local | Willing to Relocate |
      | Thais Camilo   | 9041231234 | thais@hashrocket.com   | narwen      | narwen      | Yes   | Yes                 |
      | Tim Chopoorian | 7209410156 | tim@chopoorian.com     | tchopoorian | tchopoorian | No    | No                  |
      | Matt Conway    | 9045011294 | matthew@hashrocket.com | mattonrails | mattonrails | Yes   | Yes                 |
  
  
