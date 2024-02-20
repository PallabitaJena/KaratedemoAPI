Feature: Creation of access token
Background:

*  def requestPayload =
"""
  {
    "username" : "admin",
    "password" : "password123"
}
  """

  @Regression
  Scenario: : Sample API request demo
    Given url 'https://restful-booker.herokuapp.com/auth'
    And header Content-Type = 'application/json'
    And request requestPayload
    When method post
    And  status 200
    * def token = $.token
    * print token
