Feature: Check the manage member field behaviour


Scenario Outline: TC_1 Validate the length of member name for a successful POST Request

  * def assertPresent =
  """
  function(memberPresent,condition) {
  if(condition)
  {
   karate.log("Member creation should successful as entered name length is less then 50")
   if (memberPresent) {karate.log("Member ID is present")}
   else { karate.fail("MemberID not present") }
  }
  else
  {
   karate.log("Member creation should not be successful entered name length is greater then 50")
   if (memberPresent) {karate.fail("Member ID is present")}
   else { karate.log("MemberID not present") }
  }
  }
  """

  * def length = <length>
  #Creating member with above value
  * def memberName = call read('FusoExample.feature@create') { length : <length> }
  * def getResponse = $memberName.response
  * def condition = ( <length> <=50 )
  * def memberPresent = karate.match("getResponse contains { member_id: '#present' }").pass
  * def ranVal =  assertPresent(memberPresent,condition)

  Examples:
    |length  |
    | 50     |
    | 51     |
    | 45     |



Scenario Outline: TC_2 Validate the mandatory check for member name field
  * def blanckValueCheck =
  """
 function(memberPresent,condition) {
  if(condition)
  {
   karate.log("Member creation should not be successful as name is blank")
   if (memberPresent) {karate.fail("Member ID  still  present even name is blank")}
   else { karate.log("MemberID not present as name is blank") }
  }
  else
  {
   karate.log("Member creation should be successful as name is not blank")
   if (memberPresent) {karate.log("Member ID is present")}
   else { karate.fail("MemberID not present") }
  }
  }
  """
  * def length = <length>
  #Creating member with above value
  * def memberName = call read('FusoExample.feature@create') { length : <length> }
  * def getResponse = $memberName.response
  * def condition = ( <length> == 0 )
  * def memberPresent = karate.match("getResponse contains { member_id: '#present' }").pass
  * def ranVal =  blanckValueCheck(memberPresent,condition)

  Examples:
    |length  |
    | 0      |
    | 25     |