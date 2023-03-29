Feature: Items Features
  Test Item CRUD operations

  Background: Login Process And Show the Project Page
    Given I set a valid credencials in login page
    And I click the "btn-login" button
    Then I see if the value in "page-title" is "PROJECTS"
    And I click the "btn-show-Personal" button
    Then I see if the value in "page-title" is "Personal"

  Scenario: Test Item Create Form
    Given I click the "btn-new" button
    And I fill the "frm-content" field with "A new task to do"
    And I click the "btn-save" button
    Then I see if the value in "A new task to do" is "A new task to do"

  Scenario: Test Item Update Form
    Given I click the "btn-edit-A new task to do" button
    And I fill the "frm-content" field with "A new task to do updated"
    And I click the "btn-save" button
    Then I see if the value in "A new task to do updated" is "A new task to do updated"

  Scenario: Test Item Delete Form
    Given I click the "btn-delete-A new task to do updated" button
    Then I see if the control "A new task to do updated" is absent