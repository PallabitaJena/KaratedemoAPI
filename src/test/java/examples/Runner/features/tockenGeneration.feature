Feature: Creation of access token

  @tag1
  Scenario: Get access_token for all other API in Fuso
    Given url 'https://login.microsoftonline.com/2c7b7803-cee7-428b-8bc7-db9705d09fa6/oauth2/v2.0/token'
    And header Content-Type = 'application/x-www-form-urlencoded;charset=UTF-8'
    And form field grant_type = grant_typeV
    And form field client_id = client_idV
    And form field scope = scopeV
    And form field client_secret = client_secretV
    And form field username = usernameV
    And form field password = passwordV
    When method post
    Then status 200

    * def accessToken = response.access_token
    * print 'The generated access token is :', accessToken

