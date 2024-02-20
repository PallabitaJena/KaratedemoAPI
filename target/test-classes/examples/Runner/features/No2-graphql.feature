Feature: test graphql end point
# GraphQl is a query language  for API
# client has the power to ask what he wants in response

  Background:
    * url  'https://countries.trevorblades.com/graphql'


  Scenario: graphql query from a file and using variables

    Given def query = read('classpath:examples/resources/Country-by-Code.graphql')
    And request { query: '#(query)' }
    When method post
    And match response.data.country.capital == 'New Delhi'
