Feature: User view list of canidates

  Scenario:
    Given the following candidates:
      | first name | last name | contact phone | email               | github id  | twitter id |
      | Lar        | Van       | 123           | lar@hashrocket.com  | supaspoida | supaspoida |
      | Alex       | Aguilar   | 456           | alex@hashrocket.com | alexa      | alexa      |
    When I go to the candidates page
    Then I should see the following table:
      | Name         | Phone | Email               | Github     | Twitter    |
      | Lar Van      | 123   | lar@hashrocket.com  | supaspoida | supaspoida |
      | Alex Aguilar | 456   | alex@hashrocket.com | alexa      | alexa      |
