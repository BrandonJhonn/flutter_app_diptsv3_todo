Feature: Items Features
  Test Item CRUD operations

  Background: Login Process
    Given I am on the Project Page with a valid session
    And I click on the "btn-detail-1" button in the "lst-projects" list

  Scenario: Test Item List Page
    Given I am on the Item Page
    And I click the "btn-refresh" button
    Then I see if the value in "txt-message" is "Lista Actualizada"

  Scenario: Test Item Create Form
    Given I am on the Item Page
    And I click the "btn-new" button
    And I fill the "txt-name-item" field with "T-TEST-01"
    And I click the "btn-save" button
    Then I see if the value in "txt-message" is "Actividad Creada"

  Scenario: Test Item Update Form
    Given I am on the Item Page
    And I click on the "btn-edit-1" button in the "lst-items" list
    And I fill the "txt-name-item" field with "T-TEST-01-UPDATE"
    And I click the "btn-save" button
    Then I see if the value in "txt-message" is "Actividad Actualizada"

  Scenario: Test Item Detail Page
    Given I am on the Item Page
    And I click on the "btn-detail-1" button in the "lst-items" list
    Then I see if the value in "txt-title-page" is "T-TEST-01-UPDATE"

  Scenario: Test Item Delete Form
    Given I am on the Item Page
    And I click on the "btn-delete-1" button in the "lst-items" list
    And I click the "btn-confirm" button
    Then I see if the value in "txt-message" is "Actividad Eliminada"