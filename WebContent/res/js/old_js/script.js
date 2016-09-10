 
function userLogin() 
{
	var email_id = $("#user_login  input[name=email]").val();
	var user_mobile = $("#user_login  input[name=mobile]").val();
	if (!validateEmail(email_id)) {
		console.log("bad login email");
		$("#user_login  input[name=email]").val('');
		$("#user_login  input[name=email]").focus();
		$("#loginemailerror").text(" * Enter valid email id");
		return false;
	} else if (!validateMobile(user_mobile)) {
		$("#loginemailerror").text(" ");
		console.log("bad login password");
		$("#user_login  input[name=mobile]").val('');
		$("#user_login  input[name=mobile]").focus();
		$("#loginpassworderror").text(" * Enter valid Mobile No");
		return false;
	}
	$("#loginemailerror").text("");
	$("#loginpassworderror").text("");
	$("#user_login  input[name=email]").val('');
	$("#user_login  input[name=mobile]").val('');
	$("#loginpassworderror1").text("");
	var jsonobj = {
		"email" : email_id,
		"mobile" : user_mobile
	};
	console.log(jsonobj);
	$.ajax({
		type : "POST",
		url : "userSignIn",
		data : jsonobj,
		cache : true,
		success : function(result) {
			alert(result);
            if(result=='Comingsoon')
			{window.location.replace(result);}
            else if(result=='error1')
            {
            	$("#user_login  input[name=email]").val('');
            	$("#user_login  input[name=mobile]").val('');
            	$("#user_login  input[name=email]").focus();
            	$("#loginpassworderror1").text(" * User doesn't exist.You Need to Sign Up First");
            	return false;
            }
            else 
            { window.location.replace(result);	}

		},
	  error: function(result)
	  {
		  window.location.replace(result); 
	  }
	});
	//$("#user_login  input[name=email]").val('');
	//$("#user_login  input[name=password]").val('');
	// return false;

}
function userRegister() {

	var user_mobile = $("#user_registration input[name=mobile]").val();
	var email_id1 = $("#user_registration input[name=email]").val();
	var user_pwd1 = $("#user_registration input[name=password]").val();
	var user_cofirmpwd1 = $("#user_registration input[name=confirm_password ]")
			.val();
	if (!validateMobile(user_mobile)) {
		console.log("bad mobileno");
		$("#user_registration input[name=mobile]").val('');
		$("#user_registration input[name=mobile]").focus();
		$("#mobilenoerror").text(" *Enter a valid 10 digit mobile number");
		return false;
	} else if (!validateEmail(email_id1)) {
		$("#mobilenoerror").text("");
		console.log("bad email");
		$("#user_registration input[name=email]").val('');
		$("#user_registration input[name=email]").focus();
		$("#regemailerror").text(" * Enter valid email id");
		return false;
	} else if (!validatePassword(user_pwd1)) {
		$("#regemailerror").text("");
		console.log("bad password");
		$("#user_registration input[name=password]").val('');
		$("#user_registration input[name=password]").focus();
		$("#passworderror")
				.text(
						" * Password must contain at least 6 characters, including Upper/lowercase and numbers.");
		return false;
	} 
	else if (user_pwd1 != user_cofirmpwd1)
	{

		$("#passworderror").text("* Password Mismatch Enter Password Again");
		$("#user_registration input[name=password]").val('');
		$("#user_registration input[name=confirm_password ]").val('');
		$("#user_registration input[name=password]").focus();
		$("#confirmpassworderror").text(" ");
		return false;
	}
	$("#mobilenoerror").text("");
	$("#regemailerror").text("");
	$("#passworderror").text("");
	$("#confirmpassworderror").text(" ");
	$("#user_registration input[name=mobile]").val('');
	$("#user_registration input[name=email]").val('');
	$("#user_registration input[name=password]").val('');
	$("#user_registration input[name=confirm_password ]").val('');
	$("#confirmpassworderror1").text("");
	var jsonobj1 = {
		"mobile" : user_mobile,
		"email" : email_id1,
		"password" : user_pwd1
	};
	console.log(jsonobj1);
	$.ajax({
		type : "POST",
		url : "RegisterUser",
		data : jsonobj1,
		cache : false,
		success : function(result) {
			alert(result);
			if(result=='ALREADY_PRESENT')
			{
				$("#user_registration input[name=mobile]").val('');
				$("#user_registration input[name=email]").val('');
				$("#user_registration input[name=password]").val('');
				$("#user_registration input[name=confirm_password ]").val('');
				$("#user_registration input[name=mobile]").focus();
				$("#confirmpassworderror1").text("Email or Mobile No is already registered ");
				return false;
			}
			else if(result=='error1')
            {
				$("#user_registration input[name=mobile]").val('');
				$("#user_registration input[name=email]").val('');
				$("#user_registration input[name=password]").val('');
				$("#user_registration input[name=confirm_password ]").val('');
				$("#user_registration input[name=mobile]").focus();
				$("#confirmpassworderror").text("Something Went Wrong Please fill form again");
				return false;
            }
			else
			{window.location.replace(result);}	

		},
		  error: function(result)
		  {
			  window.location.replace(result); 
		  }
	});

}

// JS for feedback form submission

function contactUs() {
	var user_name = $("#feedback_form input[name=name]").val();
	var email_feedback = $("#feedback_form input[name=email]").val();
	var user_message = $("textarea#user_feedback").val();

	/*if (validateEmail(email_feedback)) {
		console.log("gud");
	}*/

	if (user_name.length < 2) {
		console.log("bad username");
		$("#feedback_form input[name=name]").val('');
		$("#feedback_form input[name=name]").focus();
		$("#usererror").text(" * Name must contain atleast two characters");
		return false;
	} else if (!validateEmail(email_feedback)) {
		$("#usererror").text("");
		console.log("bad");
		$("#feedback_form input[name=email]").val('');
		$("#feedback_form input[name=email]").focus();
		$("#emailerror").text(" * Enter valid email id");
		return false;
	} else if (user_message.length < 2 || user_message.length > 400) {
		$("#emailerror").text("");
		console.log("bad message");
		$("textarea#user_feedback").val('');
		$("#user_feedback").focus();
		$("#messageerror")
				.text(
						" * Message must contain atleast two characters and less than 400 characters");
		return false;

	}

	else {
		var dataobj = {
			"name" : user_name,
			"email" : email_feedback,
			"message" : user_message
		};
		$("#usererror").text("");
		$("#emailerror").text("");
		$("#messageerror").text("");
		console.log(dataobj);
		$
				.ajax({
					type : "GET",
					url : "feedbackSubmit?Feedback="
							+ escape(JSON.stringify(dataobj)),
					data : dataobj,
					cache : false,
					success : function(result) {
						$("#feedback_form input[name=name]").val('');
						$("#feedback_form input[name=email]").val('');
						$("textarea#user_feedback").val('');
						console.log(result);
						if (JSON.parse(result).code == "7") {
							$('#thanks-message')
									.html(
											"Thank you! Your message has been sent to us. We will check what we can do to serve you best");
							$('#thanks-message').fadeIn(1500, function() {
								$('#thanks-message');
							});
							$('#thanks-message').fadeOut(6000, function() {
								$('#thanks-message');
							});

						}

						else {
							$("#thanks-message").text(
									"Sorry ! Please fill all the fields");
						}

					}
				});
	}
}

function scheduleTrial()
{
	var scheduler_name = $("#schedule-form input[name=recipient-name]").val();
	var scheduler_email = $("#schedule-form input[name=recipient-email]").val();
	var scheduler_mobileno = $("#schedule-form input[name=recipient-number]").val();
	var scheduler_date= $("#schedule-form input[name=trial-date]").val();
	var scheduler_address=$("textarea#recipient-address").val();
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; 
	var yyyy = today.getFullYear();
    if(dd<10) 
    {
	    dd='0'+dd
	} 

	if(mm<10) 
	{
	    mm='0'+mm
	} 
    today = yyyy+'-'+mm+'-'+dd;
	if (scheduler_name.length < 2) {
		console.log("bad name");
		$("#schedule-form input[name=recipient-name]").val('');
		$("#schedule-form input[name=recipient-name]").focus();
		$("#schedule-nameerror").text(" * Name must contain atleast two characters");
		return false;
	} else if (!validateEmail(scheduler_email)) {
		$("#schedule-nameerror").text("");
		console.log("bad email");
		$("#schedule-form input[name=recipient-email]").val('');
		$("#schedule-form input[name=recipient-email]").focus();
		$("#schedule-emailerror").text(" * Enter valid email id");
		return false;
	}
	else if (!validateMobile(scheduler_mobileno)) 
	{
		$("#schedule-emailerror").text("");
		console.log("bad mobile");
		$("#schedule-form input[name=recipient-number]").val('');
		$("#schedule-form input[name=recipient-number]").focus();
		$("#schedule-mobileerror").text(" * Enter valid 10 digit mobile no");
		return false;
	}
	else if( (new Date(scheduler_date).getTime() < new Date(today).getTime())||scheduler_date=="")
	{
		$("#schedule-mobileerror").text("");
		$("#schedule-form input[name=trial-date]").val(today);
		$("#schedule-form input[name=trial-date]").focus();
		$("#schedule-dateerror").text(" * Can't schedule for past date");
		return false;
	}
	else if(scheduler_address.length < 5)
   {
		$("#schedule-dateerror").text("");
		$("#schedule-form input[name=recipient-address]").val('');
		$("#schedule-form input[name=recipient-address]").focus();
		$("#schedule-addresserror").text(" * Enter valid address");
        return false;
   }
	$("#schedule-nameerror").text("");
	$("#schedule-emailerror").text("");
	$("#schedule-mobileerror").text("");
	$("#schedule-dateerror").text("");
	$("#schedule-addresserror").text("");
	
	var scheduleobject = {
			"name" :scheduler_name,
			"email" :scheduler_email,
			"mobile" : scheduler_mobileno,
			"date" : scheduler_date,
			"address" : scheduler_address
		};
		console.log(scheduleobject);
		$.ajax({
			type : "POST",
			url : "CheckScheduleTrial",
			data : scheduleobject,
			cache : false,
			success : function(result) {
				      alert(result);
			

			}
		});
}
function validateEmail(emailText) 
{
	var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(emailText);
};

function validateMobile(mobileno) 
{
	var mobilepattern = new RegExp(/^[0-9]{10}$/);
	return mobilepattern.test(mobileno);

}

function validatePassword(password) 
{
	var passwordpattern = new RegExp(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/);
	return passwordpattern.test(password);
}
/**
 * 
 */

function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '611917012244299',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.2' // use version 2.2
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }function googleLogIn() 
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

 
function userLogin() 
{
	var email_id = $("#user_login  input[name=email]").val();
	var user_mobile = $("#user_login  input[name=mobile]").val();
	if (!validateEmail(email_id)) {
		console.log("bad login email");
		$("#user_login  input[name=email]").val('');
		$("#user_login  input[name=email]").focus();
		$("#loginemailerror").text(" * Enter valid email id");
		return false;
	} else if (!validateMobile(user_mobile)) {
		$("#loginemailerror").text(" ");
		console.log("bad login password");
		$("#user_login  input[name=mobile]").val('');
		$("#user_login  input[name=mobile]").focus();
		$("#loginpassworderror").text(" * Enter valid Mobile No");
		return false;
	}
	$("#loginemailerror").text("");
	$("#loginpassworderror").text("");
	$("#user_login  input[name=email]").val('');
	$("#user_login  input[name=mobile]").val('');
	$("#loginpassworderror1").text("");
	var jsonobj = {
		"email" : email_id,
		"mobile" : user_mobile
	};
	console.log(jsonobj);
	$.ajax({
		type : "POST",
		url : "userSignIn",
		data : jsonobj,
		cache : true,
		success : function(result) {
			alert(result);
            if(result=='Comingsoon')
			{window.location.replace(result);}
            else if(result=='error1')
            {
            	$("#user_login  input[name=email]").val('');
            	$("#user_login  input[name=mobile]").val('');
            	$("#user_login  input[name=email]").focus();
            	$("#loginpassworderror1").text(" * User doesn't exist.You Need to Sign Up First");
            	return false;
            }
            else 
            { window.location.replace(result);	}

		},
	  error: function(result)
	  {
		  window.location.replace(result); 
	  }
	});
	//$("#user_login  input[name=email]").val('');
	//$("#user_login  input[name=password]").val('');
	// return false;

}
function userRegister() {

	var user_mobile = $("#user_registration input[name=mobile]").val();
	var email_id1 = $("#user_registration input[name=email]").val();
	var user_pwd1 = $("#user_registration input[name=password]").val();
	var user_cofirmpwd1 = $("#user_registration input[name=confirm_password ]")
			.val();
	if (!validateMobile(user_mobile)) {
		console.log("bad mobileno");
		$("#user_registration input[name=mobile]").val('');
		$("#user_registration input[name=mobile]").focus();
		$("#mobilenoerror").text(" *Enter a valid 10 digit mobile number");
		return false;
	} else if (!validateEmail(email_id1)) {
		$("#mobilenoerror").text("");
		console.log("bad email");
		$("#user_registration input[name=email]").val('');
		$("#user_registration input[name=email]").focus();
		$("#regemailerror").text(" * Enter valid email id");
		return false;
	} else if (!validatePassword(user_pwd1)) {
		$("#regemailerror").text("");
		console.log("bad password");
		$("#user_registration input[name=password]").val('');
		$("#user_registration input[name=password]").focus();
		$("#passworderror")
				.text(
						" * Password must contain at least 6 characters, including Upper/lowercase and numbers.");
		return false;
	} 
	else if (user_pwd1 != user_cofirmpwd1)
	{

		$("#passworderror").text("* Password Mismatch Enter Password Again");
		$("#user_registration input[name=password]").val('');
		$("#user_registration input[name=confirm_password ]").val('');
		$("#user_registration input[name=password]").focus();
		$("#confirmpassworderror").text(" ");
		return false;
	}
	$("#mobilenoerror").text("");
	$("#regemailerror").text("");
	$("#passworderror").text("");
	$("#confirmpassworderror").text(" ");
	$("#user_registration input[name=mobile]").val('');
	$("#user_registration input[name=email]").val('');
	$("#user_registration input[name=password]").val('');
	$("#user_registration input[name=confirm_password ]").val('');
	$("#confirmpassworderror1").text("");
	var jsonobj1 = {
		"mobile" : user_mobile,
		"email" : email_id1,
		"password" : user_pwd1
	};
	console.log(jsonobj1);
	$.ajax({
		type : "POST",
		url : "RegisterUser",
		data : jsonobj1,
		cache : false,
		success : function(result) {
			alert(result);
			if(result=='ALREADY_PRESENT')
			{
				$("#user_registration input[name=mobile]").val('');
				$("#user_registration input[name=email]").val('');
				$("#user_registration input[name=password]").val('');
				$("#user_registration input[name=confirm_password ]").val('');
				$("#user_registration input[name=mobile]").focus();
				$("#confirmpassworderror1").text("Email or Mobile No is already registered ");
				return false;
			}
			else if(result=='error1')
            {
				$("#user_registration input[name=mobile]").val('');
				$("#user_registration input[name=email]").val('');
				$("#user_registration input[name=password]").val('');
				$("#user_registration input[name=confirm_password ]").val('');
				$("#user_registration input[name=mobile]").focus();
				$("#confirmpassworderror").text("Something Went Wrong Please fill form again");
				return false;
            }
			else
			{window.location.replace(result);}	

		},
		  error: function(result)
		  {
			  window.location.replace(result); 
		  }
	});

}

// JS for feedback form submission

function contactUs() {
	var user_name = $("#feedback_form input[name=name]").val();
	var email_feedback = $("#feedback_form input[name=email]").val();
	var user_message = $("textarea#user_feedback").val();

	/*if (validateEmail(email_feedback)) {
		console.log("gud");
	}*/

	if (user_name.length < 2) {
		console.log("bad username");
		$("#feedback_form input[name=name]").val('');
		$("#feedback_form input[name=name]").focus();
		$("#usererror").text(" * Name must contain atleast two characters");
		return false;
	} else if (!validateEmail(email_feedback)) {
		$("#usererror").text("");
		console.log("bad");
		$("#feedback_form input[name=email]").val('');
		$("#feedback_form input[name=email]").focus();
		$("#emailerror").text(" * Enter valid email id");
		return false;
	} else if (user_message.length < 2 || user_message.length > 400) {
		$("#emailerror").text("");
		console.log("bad message");
		$("textarea#user_feedback").val('');
		$("#user_feedback").focus();
		$("#messageerror")
				.text(
						" * Message must contain atleast two characters and less than 400 characters");
		return false;

	}

	else {
		var dataobj = {
			"name" : user_name,
			"email" : email_feedback,
			"message" : user_message
		};
		$("#usererror").text("");
		$("#emailerror").text("");
		$("#messageerror").text("");
		console.log(dataobj);
		$
				.ajax({
					type : "GET",
					url : "feedbackSubmit?Feedback="
							+ escape(JSON.stringify(dataobj)),
					data : dataobj,
					cache : false,
					success : function(result) {
						$("#feedback_form input[name=name]").val('');
						$("#feedback_form input[name=email]").val('');
						$("textarea#user_feedback").val('');
						console.log(result);
						if (JSON.parse(result).code == "7") {
							$('#thanks-message')
									.html(
											"Thank you! Your message has been sent to us. We will check what we can do to serve you best");
							$('#thanks-message').fadeIn(1500, function() {
								$('#thanks-message');
							});
							$('#thanks-message').fadeOut(6000, function() {
								$('#thanks-message');
							});

						}

						else {
							$("#thanks-message").text(
									"Sorry ! Please fill all the fields");
						}

					}
				});
	}
}

function scheduleTrial()
{
	var scheduler_name = $("#schedule-form input[name=recipient-name]").val();
	var scheduler_email = $("#schedule-form input[name=recipient-email]").val();
	var scheduler_mobileno = $("#schedule-form input[name=recipient-number]").val();
	var scheduler_date= $("#schedule-form input[name=trial-date]").val();
	var scheduler_address=$("textarea#recipient-address").val();
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; 
	var yyyy = today.getFullYear();
    if(dd<10) 
    {
	    dd='0'+dd
	} 

	if(mm<10) 
	{
	    mm='0'+mm
	} 
    today = yyyy+'-'+mm+'-'+dd;
	if (scheduler_name.length < 2) {
		console.log("bad name");
		$("#schedule-form input[name=recipient-name]").val('');
		$("#schedule-form input[name=recipient-name]").focus();
		$("#schedule-nameerror").text(" * Name must contain atleast two characters");
		return false;
	} else if (!validateEmail(scheduler_email)) {
		$("#schedule-nameerror").text("");
		console.log("bad email");
		$("#schedule-form input[name=recipient-email]").val('');
		$("#schedule-form input[name=recipient-email]").focus();
		$("#schedule-emailerror").text(" * Enter valid email id");
		return false;
	}
	else if (!validateMobile(scheduler_mobileno)) 
	{
		$("#schedule-emailerror").text("");
		console.log("bad mobile");
		$("#schedule-form input[name=recipient-number]").val('');
		$("#schedule-form input[name=recipient-number]").focus();
		$("#schedule-mobileerror").text(" * Enter valid 10 digit mobile no");
		return false;
	}
	else if( (new Date(scheduler_date).getTime() < new Date(today).getTime())||scheduler_date=="")
	{
		$("#schedule-mobileerror").text("");
		$("#schedule-form input[name=trial-date]").val(today);
		$("#schedule-form input[name=trial-date]").focus();
		$("#schedule-dateerror").text(" * Can't schedule for past date");
		return false;
	}
	else if(scheduler_address.length < 5)
   {
		$("#schedule-dateerror").text("");
		$("#schedule-form input[name=recipient-address]").val('');
		$("#schedule-form input[name=recipient-address]").focus();
		$("#schedule-addresserror").text(" * Enter valid address");
        return false;
   }
	$("#schedule-nameerror").text("");
	$("#schedule-emailerror").text("");
	$("#schedule-mobileerror").text("");
	$("#schedule-dateerror").text("");
	$("#schedule-addresserror").text("");
	
	var scheduleobject = {
			"name" :scheduler_name,
			"email" :scheduler_email,
			"mobile" : scheduler_mobileno,
			"date" : scheduler_date,
			"address" : scheduler_address
		};
		console.log(scheduleobject);
		$.ajax({
			type : "POST",
			url : "CheckScheduleTrial",
			data : scheduleobject,
			cache : false,
			success : function(result) {
				      alert(result);
			

			}
		});
}
function validateEmail(emailText) 
{
	var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(emailText);
};

function validateMobile(mobileno) 
{
	var mobilepattern = new RegExp(/^[0-9]{10}$/);
	return mobilepattern.test(mobileno);

}

function validatePassword(password) 
{
	var passwordpattern = new RegExp(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/);
	return passwordpattern.test(password);
}
(function(){

	//duplicate hover state for parent menu when dropdown.
	(jQuery)('#header-wrapper ul.dropdown').hover(function(){
		$(this).parent().find('> a').addClass('expanded-menu');
	},function(){
		$(this).parent().find('> a').removeClass('expanded-menu');
	});

	//mega menu position
	(jQuery).fn.megamenu = function(width){
		var $that = (jQuery)(this),
			$window = (jQuery)(window);

		function update(){
			$that.find('.megamenu').each(function(){
				var $this = (jQuery)(this),
					windowW = $window.width(),
					offSetLeft = $this.offset().left,
					parentWidth = $this.width(),
					megaMenuCols = $this.find('> .dropdown > li.has-dropdown').length,
					megaMenuWidth,
					mainMenuWidth = $('#top .top-bar').width(),
					dropdownWidth = 295,
					longestMenu = 1;

				//fill in empty blanks if not equal length
				$this.find('> .dropdown > li.has-dropdown > .dropdown').each(function(){
					var currentLength = (jQuery)(this).find('> li').length;
					if(currentLength > longestMenu){
						longestMenu = currentLength;
					}
				});

				$this.find('> .dropdown > li.has-dropdown > .dropdown').each(function(){
					var $dropdown = (jQuery)(this);
					var currentLength = $dropdown.find('> li').length;
					if(currentLength < longestMenu){
						for (var i = 1; i <= longestMenu - currentLength; i++) {
							$dropdown.append('<li class="empty-megamenu"></li>');
						}
					}
				});

				dropdownWidth = mainMenuWidth / megaMenuCols;
				var megaMenuWidth = megaMenuCols * dropdownWidth > width ? width : mainMenuWidth,
					blankGutterW = windowW * 0.9 < width ? windowW * 0.05 : ( windowW - width ) / 2;

				//calculate default mega menu position - align in middle with parent item
				var megaMenuRight = megaMenuWidth / 2 - parentWidth / 2;

				//take care of mega menu position if it is pushed to outside of viewport
				megaMenuRight = ( megaMenuWidth / 2 > offSetLeft + parentWidth / 2 - blankGutterW ) ? width - (offSetLeft + parentWidth) : megaMenuRight;
				var megaMenuPosition = windowW - offSetLeft - parentWidth - blankGutterW

				//finally set mega menu position
				if (windowW > 1300 || megaMenuRight > megaMenuPosition) {
					megaMenuRight = megaMenuPosition;
				}

   				$this.find('> .dropdown > li.has-dropdown').css('width', dropdownWidth + 'px');
   				$this.find('> .dropdown > li.has-dropdown > .dropdown').css({'width': dropdownWidth + 'px', 'min-width': dropdownWidth + 'px'});
				$this.find('> .dropdown').css({
					'width': megaMenuWidth + 'px',
					'right':  - megaMenuRight + 'px'
				});
			});
		
			//take care of offset issue for other dropdown
			$that.find('li:not(.megamenu).has-dropdown > .dropdown').each(function(){
				var $this = (jQuery)(this);
				var	windowW = (jQuery)(window).width(),
					offSetLeft = $this.offset().left;
				if($this.width() + offSetLeft > windowW) {
					$this.css({
						'left': '-100%',
						'max-width': '100%'
					});
				}
			});
		}

		$(window).resize(update);
		update();
	};
	//end mega menu

	//set hover delay for mega menu item in case mouse is hovering on other menu items
	(function hoverdelay(){
		(jQuery)('#top .top-bar:not(.expanded) .top-bar-section li.has-dropdown').each(function(){

			var $this = (jQuery)(this),
				menuTimeoutShow,
				menuTimeoutHide;
			$this.on("mouseenter tap", function(e) {
				if(e.type == "tap") e.stopPropagation();
				clearTimeout(menuTimeoutShow);
				clearTimeout(menuTimeoutHide);

				menuTimeoutShow = setTimeout(function() {
				$this.addClass("hippo-menu-hovered");
					if( $this.hasClass("hippo-menu-hovered")){
						$this.children('ul').stop().css("visibility", "visible").animate({
							"opacity": 1
						}, 200);
					}
				}, 300);
			});

			$this.on("mouseleave", function(e) {
				clearTimeout(menuTimeoutShow);
				clearTimeout(menuTimeoutHide);
				menuTimeoutHide = setTimeout(function() {
				$this.removeClass("hippo-menu-hovered");
					if(!$this.hasClass("hippo-menu-hovered")){
						$this.children("ul").css({
							"opacity": 0,
							"visibility": "hidden"
						});
					}
				}, 300);
			});
		});	
	})();//end hippo menu hover function

})(jQuery);
	
(jQuery)('.top-bar-section').megamenu(1200);
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
