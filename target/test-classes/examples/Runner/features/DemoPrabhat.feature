Feature: Create Branch using api

  Background:
    * def bearerAuth = callonce read('tockenGeneration.feature@tag1')
    * def requestPayload =
    """
    {"branchName":"prabhat5","phone":"","fax":"","address":""}
    """

  Scenario: Create a user with the given data
    Given url 'https://dta-ccp-qa-admin-api.azurewebsites.net/company-admin/9434/branches'
    And request requestPayload
    And header Authorization = 'Bearer '+bearerAuth.accessToken
    When method POST
    Then status 201
    And match $.data.branch_name == '#present'