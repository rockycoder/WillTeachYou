function googleLogIn() 
{
  var myParams = {
    'clientid' : '764518652149-djttn7feqkn68nvbm4qbh9mv75m8esq4.apps.googleusercontent.com',
    'cookiepolicy' : 'single_host_origin',
    'callback' : 'loginCallback',
    'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
  };
  gapi.auth.signIn(myParams);
}

function loginCallback(result)
{
    if(result['status']['signed_in'])
    {   
    	var request = gapi.client.plus.people.get({'userId': 'me'});
        request.execute(function (resp)
        {
            var email = '';
            if(resp['emails'])
            {
                for(i = 0; i < resp['emails'].length; i++)
                {
                    if(resp['emails'][i]['type'] == 'account')
                    {
                        email = resp['emails'][i]['value'];
                    }
                }
            }
 
           /* var str = "Name:" + resp['displayName'] + "<br>";
            str += "Image:" + resp['image']['url'] + "<br>";
            str += "<img src='" + resp['image']['url'] + "' /><br>";
 
            str += "URL:" + resp['url'] + "<br>";
            str += "Email:" + email + "<br>";*/
        	var JSONobj = {
					"first_name" : resp['name']['givenName'],
					"last_name" : resp['name']['familyName'],
					"email" : email,
					"id" : resp['id'],
					"link": resp['url'],
				    "verified":resp['verified'],
				    "mode":"google"
					};
            // console.log(resp); 
               console.log(JSONobj);
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
 
}

function onLoadCallback()
{
    gapi.client.setApiKey('AIzaSyA_8Luoq9m5hwxgs-UbzudiyDE5GXuFeUY');
    gapi.client.load('plus', 'v1',function(){});
}

(function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();

function logout()
{
    gapi.auth.signOut();
    location.reload();
}

