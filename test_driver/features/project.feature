Feature: Project Features
  Test Project CRUD operations

  Background: Login Process
    Given I am on the Project Page with a valid session

  Scenario: Test Project List Page
    Given I am on the Project Page
    And I click the "btn-refresh" button
    Then I see if the value in "txt-message" is "Lista Actualizada"

  Scenario: Test Project Create Form
    Given I am on the Project Page
    And I click the "btn-new" button
    And I fill the "txt-name-project" field with "P-TEST-01"
    And I click the "btn-save" button
    Then I see if the value in "txt-message" is "Proyecto Creado"

  Scenario: Test Project Update Form
    Given I am on the Project Page
    And I click on the "btn-edit-1" button in the "lst-projects" list
    And I fill the "txt-name-project" field with "P-TEST-01-UPDATE"
    And I click the "btn-save" button
    Then I see if the value in "txt-message" is "Proyecto Actualizado"

  Scenario: Test Project Detail Page
    Given I am on the Project Page
    And I click on the "btn-detail-1" button in the "lst-projects" list
    Then I see if the value in "txt-title-page" is "P-TEST-01-UPDATE"

  Scenario: Test Project Delete Form
    Given I am on the Project Page
    And I click on the "btn-delete-1" button in the "lst-projects" list
    And I click the "btn-confirm" button
    Then I see if the value in "txt-message" is "Proyecto Eliminado"