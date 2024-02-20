
Feature: Reusing scenario with different ways

  Background:
    * def bearerAuth = callonce read('tockenGeneration.feature@tag1')
    * url BaseURL+'/users'
    * header Authorization = 'Bearer '+bearerAuth.accessToken



  Scenario:Delete Any record with DELETE request

#can delete and then check if status is 200 or not
    #  __arg is also available
    * def parameter =  memID
    * print parameter
    Given path parameter
    When method DELETE
    Then status 200

    #Can delete and check