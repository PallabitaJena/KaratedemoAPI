function present(memberPresent,condition) {
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