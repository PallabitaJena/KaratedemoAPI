@smoke
Feature: Reusing scenario with different ways

  Background:
 # * configure headers = { Authorization: '#("Bearer " + __arg.bearerAuth.accessToken)' }
    * def SchemaUtils = Java.type('examples.utils.JsonSchemaUtils')
    * def bearerAuth = callonce read('tockenGeneration.feature@tag1')
    * def random_string =
 """
 function(s) {
   var text = "";
   var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
   for (var i = 0; i < s; i++)
     text += possible.charAt(Math.floor(Math.random() * possible.length));
   return text;
 }
 """



  @create
  Scenario:Create a new member with POST api request
    * def length = 9
    * def value = length
    * def ranVal =  random_string(value)

    * def jsonBody = read('classpath:examples/resources/CreateMember.json')

    * set jsonBody.name = ranVal
    * set jsonBody.email_address = ranVal+'@ibm.com'
    * set jsonBody.user_id = ranVal

    Given url BaseURL+'/users'
    And header Authorization = 'Bearer '+bearerAuth.accessToken
    And header Content-Type = 'application/json'
    And request jsonBody
    When method POST

    * def statusReceived = responseStatus
    * def id = response.id
    * def member_id = response.member_id



  @tag2
  Scenario:Get the created new member with GET api request
    * def MemberName = call read('FusoExample.feature@create')
    * print MemberName.id
    Given url BaseURL+'/users/'+MemberName.id+'/'
    And header Authorization = 'Bearer '+bearerAuth.accessToken
    When method get
    Then match response.member_id  == MemberName.member_id


  @tag3
  Scenario:Validate the json schema of Get Request
    * def MemberName = call read('FusoExample.feature@create')
    * print MemberName.id
    Given url BaseURL+'/users/'+MemberName.id+'/'
    And header Authorization = 'Bearer '+bearerAuth.accessToken
    When method get
    Then match response == '#object'
    * string JsonData = response
    * string jsonSchemaExpected = read('classpath:examples/resources/memberSchema.json')
   * def result = SchemaUtils.isValid(JsonData,jsonSchemaExpected)
    * print result
    * assert SchemaUtils.isValid(JsonData,jsonSchemaExpected)


  @tag4
  @parallel=false
  Scenario:Update the created new member with PUT api request
    * def ranVal =  random_string(5)
    * print ranVal
    * def jsonBody = read('classpath:examples/resources/updateMember.json')
    * set jsonBody.name = ranVal
    * set jsonBody.email_address = ranVal+'@ibm.com'
    * set jsonBody.user_id = ranVal
    * def MemberName = call read('FusoExample.feature@create')
    Given url BaseURL+'/users/'+MemberName.id+'/'
    And header Authorization = 'Bearer '+bearerAuth.accessToken
    And header Content-Type = 'application/json'
    And request jsonBody
    When method PUT
    Then status 200

  @tag5
  Scenario:Delete the created new member with DELETE api request
    * def bearerAuth = call read('tockenGeneration.feature@tag1')
    * def MemberName = call read('FusoExample.feature@create')
    * def id = MemberName.id
    * def deleteMember = call read('DeleteRequest.feature') { memID : '#(id)'}
