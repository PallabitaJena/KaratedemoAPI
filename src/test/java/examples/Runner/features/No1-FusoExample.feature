Feature: Reusing scenario in different ways

  Background:
    * def bearerAuth = callonce read('tockenGeneration.feature@tag1')
    * def generate = read('classpath:examples/resources/random.js')


#Crete a member and then use same scenario in other scenario
  @tag1
  Scenario:Create a new member with POST api request
    * def ranVal = call generate 9
    * def jsonBody = read('classpath:examples/resources/CreateMember.json')
    * set jsonBody.name = ranVal
    * set jsonBody.email_address = ranVal+'@ibm.com'
    * set jsonBody.user_id = ranVal
    Given url BaseURL+'/users'
    And header Authorization = 'Bearer '+bearerAuth.accessToken
    And request jsonBody
    When method POST


    * def id = response.id


  @tag2;
  Scenario:Get the created new member with GET api request
    #call the scenario without parameter
    * def MemberName = call read('No1-FusoExample.feature@tag1')

    Given url BaseURL+'/users/'+MemberName.id+'/'
    And header Authorization = 'Bearer '+bearerAuth.accessToken
    When method get

    # call teh scenario with parameter
    * def deleteMember = call read('No1-FusoExample.feature@tag3') { memberID : '#(MemberName.id)'}

  @ignore
  @tag3
  Scenario:CAll delete from ANOTHER FEATURE file

    * def id = memberID
    * def deleteMember = call read('DeleteRequest.feature') { memID : '#(id)'}
