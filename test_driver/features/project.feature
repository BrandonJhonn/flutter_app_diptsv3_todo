Feature: Project Features
  Test Project CRUD operations

  Background: Login Process
    Given I set a valid credencials in login page
    When I click the "btn-login" button
    Then I see if the value in "page-title" is "PROJECTS"

  Scenario: Test Project Create Form
    Given I click the "btn-new" button
    And I fill the "frm-content" field with "P-TEST-01"
    And I click the "btn-save" button
    Then I see if the value in "P-TEST-01" is "P-TEST-01"

  Scenario: Test Project Update Form
    Given I click the "btn-edit-P-TEST-01" button
    And I fill the "frm-content" field with "P-TEST-01-UPDATE"
    And I click the "btn-save" button
    Then I see if the value in "P-TEST-01-UPDATE" is "P-TEST-01-UPDATE"

  Scenario: Test Project Delete Form
    Given I click the "btn-delete-P-TEST-01-UPDATE" button
    Then I see if the control "P-TEST-01-UPDATE" is absent