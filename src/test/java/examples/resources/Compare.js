
function compareStrings(s1){
   const string1 = '@tag1';
   const string2 = '@tag2';

   karate.log("The parameter is"+ s1);

   if(s1 === string1)
   {
        return 'The tag is :'+ string1;
    }
    else if (s1 === string2)
     {
            return 'The tag is :'+ string2;
      }
      else
      {
      return 'No matched tag'
      }
}