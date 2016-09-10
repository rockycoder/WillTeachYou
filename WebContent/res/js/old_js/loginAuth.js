
function fbAsyncInit() {
	FB.init({
		appId : '611917012244299',
		status : true, // check login status
		cookie : true, // enable cookies to allow the server to access
		// the session
		xfbml : true,
		scope: 'public_profile,email', 
		info_fields: 'email,name'
  // changed on 16 july 2015
	// parse XFBML
	});
}



function facebookLogIn() {
	FB.login(function(response) {
		if (response.status == 'connected') {
			FB.api('/me', function(response) {
				console.log(response);
				console.log('Good to see you, ' + response.name + '.');
				var JSONobj = {
						"first_name" : response.first_name,
						"last_name" : response.last_name,
						"email" : response.email,
						"id" :response.id,
						"link": response.link,
						"verified":response.verified,
						"mode":"fb"
						
					};
				/*alert("Data Loaded: " + JSONobj);*/
				console.log(response);
				$.ajax({
					//url : "Savefbuser?FbUserDetails=" + escape(response.first_name) + "Last_Name=" + escape(response.last_name)+"Email=" + escape(response.email),
					url  : "autoSaveUser?UserDetails="+escape(JSON.stringify(JSONobj)),
					type : 'POST',
					data : JSON.stringify(JSONobj),
					success : function(data) {
						window.location.replace(data);
					}
				});

			});
		}
	});

}

function facebookLogOut() {
	FB.logout(function(response) {
		console.log('logout :: ', response);
	});
}

fbAsyncInit();
