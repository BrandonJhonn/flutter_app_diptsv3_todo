Feature: Login Features
  Test Login with valid and invalid credentials


  Scenario: Test Login with valid credentials
    Given I set a valid credencials in login page
    And I click the "btn-login" button
    Then I see if the value in "txt-message" is "Acceso Correcto"

  Scenario: Test Login with invalid credentials
    Given I set a invalid credencials in login page
    And I click the "btn-login" button
    Then I see if the value in "txt-message" is "Acceso Incorrecto"