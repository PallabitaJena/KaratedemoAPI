function fn() {    
  var env = karate.env; // get system property 'karate.env'
 // var myToken = karate.callSingle('classpath:examples/Runner/features/tockenGeneration1.feature');
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'QA';
  }

  var config = {
    env: env,
	myVarName: 'someValue',

       // getToken:myToken,
    	BaseURL: 'https://dtaccpqamgmt.azure-api.net',
    	BaseURI:'https://gorest.co.in',
    	accessToken:'081a3da7d0c5c7962c38851f5671863190194dceb1095d24d9b040c5081f78dc',
    	client_idV:'fa54abbf-c88d-4d72-a586-6b8ef229a589',
    	scopeV: 'https://truckonnect.onmicrosoft.com/55f698e1-251e-4aa9-87e4-3025351dc8f7/user_impersonation User.Read openid profile offline_access',
    	client_secretV:'w1p8Q~6cDlfh2NclFd5SJ6g.vxU8YybDB03bmaI_',
    	grant_typeV: 'password',
    	usernameV:'pkotres.fusoqa@qa.truckonnect.jp',
    	passwordV:'Lower@20!',
  }
  if (env == 'QA') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  karate.configure('ssl', true);
  return config;
}