var _loadScript = function(url, params, callback) {

	var script = document.createElement("script");
	script.type = "text/javascript";

	if (script.readyState) { // IE
		script.onreadystatechange = function() {
			if (script.readyState == "loaded"
					|| script.readyState == "complete") {
				script.onreadystatechange = null;
				callback();
			}
		};
	} else { // Others
		script.onload = function() {
			callback();
		};
	}

	var scriptsProperties = [ 'type', 'src', 'htmlFor', 'event', 'charset',
			'async', 'defer', 'crossOrigin', 'text', 'onerror' ];

	if (typeof params === 'object' && !$.isEmptyObject(params)) {
		for ( var key in params) {
			if (params.hasOwnProperty(key) && $.inArray(key, scriptsProperties)) {
				script[key] = params[key];
			}
		}
	}
	script.src = url;
	document.getElementsByTagName(params['lazyLoad'] ? 'body' : 'head')[0]
			.appendChild(script);
};

loadScript = function(p_url, p_params, p_callback) {

	// Handle p_params is exist
	if (arguments.length === 2 && typeof arguments[1] === 'function') {
		p_callback = arguments[1];
		p_params = {}
	}

	p_params = p_params || {};

	var _return = $.Deferred();

	// Call callback if necessary
	if (typeof (p_callback) === 'function') {
		_return.done(function() {
			p_callback();
		});
	}

	// Load javascript file
	_loadScript(p_url, p_params, function() {
		_return.resolve();
	});

	return _return.promise();
};

/*----------------------------------
 # Common Validation
 -----------------------------------*/
function validateEmail(emailText) {
	var pattern = new RegExp(
			/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(emailText);
}
function validateMobile(mobileno) {
	var mobilepattern = new RegExp(/^[0-9]{10}$/);
	return mobilepattern.test(mobileno);
}
function validatePostalCode(postalcode) {
	var postalcodepattern = new RegExp(/^560[0-9]{3}$/);
	return postalcodepattern.test(postalcode);
}
function validatePassword(password) {
	var passwordpattern = new RegExp(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/);
	return passwordpattern.test(password);
}
function validateName(fName) {
	var namePattern = new RegExp(/^[a-zA-Z]*$/);
	return namePattern.test(fName);
}

/*----------------------------------
 # End Common Validation
 -----------------------------------*/

/*----------------------------------
 # Third Party Login -FB
 -----------------------------------*/
try {
	function fbAsyncInit() {
		FB.init({
			appId : '611917012244299',
			status : true, // check login status
			cookie : true, // enable cookies to allow the server to access
			// the session
			xfbml : true,
			scope : 'public_profile,email',
			info_fields : 'email,name'
		});
	}
	function facebookLogIn() {
		FB.login(function(response) {
			if (response.status == 'connected') {
				FB.api('/me', function(response) {
					// console.log(response);
					// console.log('Good to see you, ' + response.name + '.');
					var JSONobj = {
						"first_name" : response.first_name,
						"last_name" : response.last_name,
						"email" : response.email,
						"id" : response.id,
						"link" : response.link,
						"verified" : response.verified,
						"mode" : "fb"
					};
					// console.log(response);
					$.ajax({
						url : "autoSaveUser?UserDetails="
								+ escape(JSON.stringify(JSONobj)),
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
			// console.log('logout :: ', response);
		});
	}
	fbAsyncInit();
} catch (err) {
	console.log("Facebook is blocked or not working err:" + err);
}
/*----------------------------------
 # Third Party Login -Google
 -----------------------------------*/
try {
	function googleLogIn() {
		var myParams = {
			'clientid' : '764518652149-djttn7feqkn68nvbm4qbh9mv75m8esq4.apps.googleusercontent.com',
			'cookiepolicy' : 'single_host_origin',
			'callback' : 'loginCallback',
			'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
		};
		gapi.auth.signIn(myParams);
	}
	function loginCallback(result) {
		if (result['status']['signed_in']) {
			var request = gapi.client.plus.people.get({
				'userId' : 'me'
			});
			request.execute(function(resp) {
				var email = '';
				if (resp['emails']) {
					for (i = 0; i < resp['emails'].length; i++) {
						if (resp['emails'][i]['type'] == 'account') {
							email = resp['emails'][i]['value'];
						}
					}
				}
				var JSONobj = {
					"first_name" : resp['name']['givenName'],
					"last_name" : resp['name']['familyName'],
					"email" : email,
					"id" : resp['id'],
					"link" : resp['url'],
					"verified" : resp['verified'],
					"mode" : "google"
				};
				// console.log(JSONobj);
				$('#loading').show();
				$.ajax({
					url : "autoSaveUser?UserDetails="
							+ escape(JSON.stringify(JSONobj)),
					type : 'POST',
					data : JSON.stringify(JSONobj),
					success : function(data) {

						window.location.replace(data);
						// $('#loading').hide();

					}

				});
			});
		}
	}
	function onLoadCallback() {
		gapi.client.setApiKey('AIzaSyA_8Luoq9m5hwxgs-UbzudiyDE5GXuFeUY');
		gapi.client.load('plus', 'v1', function() {
		});
	}
	(function() {
		var po = document.createElement('script');
		po.type = 'text/javascript';
		po.async = true;
		po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(po, s);
	})();
	function logout() {
		gapi.auth.signOut();
		location.reload();
	}

} catch (err) {
	console.log("Google Login Not Supported err:" + err);
}
/*----------------------------------
 # Custom Login with Trykaro
 -----------------------------------*/
function userLogin() {
	var email_id = $("#user_login  input[name=email]").val();
	var user_password = $("#user_login  input[name=password]").val();
	var remember = $("#remenber").val();
	if (!validateEmail(email_id)) {
		// console.log("bad login email");
		$("#user_login  input[name=email]").val('');
		$("#user_login  input[name=email]").focus();
		$("#loginemailerror").text("[Enter valid email id]");
		return false;
	} else if (!validatePassword(user_password)) {
		$("#loginemailerror").text("");
		$("#user_login  input[name=password]").val('');
		$("#user_login  input[name=password]").focus();
		$("#loginpassworderror").text("[Wrong Password]");
		return false;

	}
	$("#loginemailerror").text("");
	$("#loginpassworderror").text("");
	return true;
	/*
	 * var jsonobj = { "email" : email_id, "password" : user_password,
	 * "remember" : remember }; // console.log(jsonobj); $.ajax({ type : "POST",
	 * url : "userSignIn", data : jsonobj, cache : true, success :
	 * function(result) { alert(result); if (result == '1') {
	 * window.location.replace('store'); } else if (result == '0') { $.toaster({
	 * priority : 'warning', title : '', message : 'User does not exist, You
	 * Need to Sign Up First.' }); return false; } else if(result == '-1') {
	 * 
	 * window.location.replace('error'); } }, error : function(result) {
	 * window.location.replace(result); } });
	 */
}

function checkLogin(event) {
	if (event.keyCode === 13) {
		// alert("Enter was pressed was presses");
		userLogin();
	}

}
/*----------------------------------
 # Custom SignUp with Trykaro
 -----------------------------------*/
function userRegister() {
	var email_id1 = $("#user_registration input[name=email]").val();
	var user_pwd1 = $("#user_registration input[name=password]").val();
	var user_cofirmpwd1 = $("#user_registration input[name=confirm_password ]")
			.val();
	if (!validateEmail(email_id1)) {
		$("#mobilenoerror").text("");
		// console.log("bad email");
		$("#user_registration input[name=email]").val('');
		$("#user_registration input[name=email]").focus();
		$("#regemailerror").text("[Enter valid email id]");
		return false;
	} else if (!validatePassword(user_pwd1)) {
		$("#mobilenoerror").text("");
		$("#regemailerror").text("");
		// console.log("bad password");
		$("#user_registration input[name=password]").val('');
		$("#user_registration input[name=confirm_password ]").val('');
		$("#user_registration input[name=password]").focus();
		$("#passworderror")
				.text(
						"[Password must contain at least 6 characters, including Upper/lowercase and numbers.]");
		return false;
	} else if (user_pwd1 != user_cofirmpwd1) {
		$("#mobilenoerror").text("");
		$("#regemailerror").text("");
		$("#passworderror").text("");
		$("#passworderror").text("[Password Mismatch Enter Password Again]");
		$("#user_registration input[name=password]").val('');
		$("#user_registration input[name=confirm_password ]").val('');
		$("#user_registration input[name=password]").focus();
		return false;
	}
	$("#mobilenoerror").text("");
	$("#regemailerror").text("");
	$("#passworderror").text("");
	$("#registrationerrormessage").text("");
	return true;

}

/*----------------------------------
 # Send Forgot Password 
 -----------------------------------*/
function sendForgotPassword() {

	var userForgotEmail = $("#forgot_email input[name=email]").val();

	if (!validateEmail(userForgotEmail)) {

		$("#forgot_email input[name=email]").val();
		$("#forgot_email input[name=email]").focus();
		$("#forgotpasswordmessage").text("*Enter valid email id");
		return false;
	}
	$("#forgotpasswordmessage").text("");
	$("#forgot_email input[name=email]").val();
	$("#forgotPasswordSubmit").attr("disabled", "disabled");

	$("#reviewtitle").css('display', 'none');
	$("#forgot-password-footer").css('display', 'none');

	$("#forgot-password-loading").css('display', 'block');

	$.ajax({
		type : "GET",

		url : "emailVarification?userForgotEmail=" + userForgotEmail,
		data : userForgotEmail,

		cache : false,
		success : function(result) {

			$("#reviewtitle").css('display', 'block');
			$("#forgot-password-footer").css('display', 'block');

			$("#forgot-password-loading").css('display', 'none');

			$("#forgotpasswordmessage").text(result);
			$("#forgotPasswordSubmit").removeAttr("disabled");

		},
		error : function(result) {
			$("#reviewtitle").css('display', 'block');
			$("#forgot-password-footer").css('display', 'block');

			$("#forgot-password-loading").css('display', 'none');

			$("#forgotpasswordmessage").text(result);
			$("#forgotPasswordSubmit").removeAttr("disabled");

		}
	});
}

function checkForgot(event) {
	if (event.keyCode === 13) {

		sendForgotPassword();
	}
}

function checkOutValidation()

{
	var first_name = $("#deliveryaddress input[name=firstName]").val();
	var last_name = $("#deliveryaddress input[name=lastName]").val();
	var email = $("#deliveryaddress input[name=email]").val();
	var phoneno = $("#deliveryaddress input[name=phone]").val();
	var address = $("#deliveryaddress input[name=address]").val();
	var city = $("#deliveryaddress input[name=city]").val();
	var postalcode = $("#deliveryaddress input[name=postalCode]").val();
	var country = $("#deliveryaddress input[name=country]").val();
	if (first_name.length < 2) {
		$("#deliveryaddress input[name=firstName]").val('');
		$("#deliveryaddress input[name=firstName]").focus();
		$("#firstnameerror").text("* First Name must have atleast characters");

		return false;
	} else if (!validateName(first_name)) {
		$("#deliveryaddress input[name=firstName]").val('');
		$("#deliveryaddress input[name=firstName]").focus();
		$("#firstnameerror").text("* Only Characters Are Allowed ");

		return false;
	} else if (last_name.length < 2) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=lastName]").val('');
		$("#deliveryaddress input[name=lastName]").focus();
		$("#firstnameerror").text("* Last Name must have atleast characters");

		return false;
	} else if (!validateName(last_name)) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=lastName]").val('');
		$("#deliveryaddress input[name=lastName]").focus();
		$("#firstnameerror").text("* Only Characters Are Allowed");

		return false;
	} else if (!validateEmail(email)) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=email]").val('');
		$("#deliveryaddress input[name=email]").focus();
		$("#firstnameerror").text("* Enter valid email address");
		return false;

	} else if (!validateMobile(phoneno)) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=phone]").val('');
		$("#deliveryaddress input[name=phone]").focus();
		$("#firstnameerror").text("* Enter valid mobile number");
		return false;

	} else if (address.length < 5) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=address]").val('');
		$("#deliveryaddress input[name=address]").focus();
		$("#firstnameerror").text("* Address have atleast five characters");
		return false;
	} else if (city.length < 5) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=city]").val('');
		$("#deliveryaddress input[name=city]").focus();
		$("#firstnameerror").text("* City must have atleast two characters");
		return false;
	} else if (!validateName(city)) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=city]").val('');
		$("#deliveryaddress input[name=city]").focus();
		$("#firstnameerror").text("* Only characters are allowed");
		return false;
	} else if (!validatePostalCode(postalcode)) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=postalCode]").val('');
		$("#deliveryaddress input[name=postalCode]").focus();
		$("#firstnameerror")
				.text(
						"* Invalid Postal Code : Please Enter PostCode For Bengaluru only.");
		return false;
	} else if (country.length < 2) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=country]").val('');
		$("#deliveryaddress input[name=country]").focus();
		$("#firstnameerror").text("* Country must have atleast two characters");
		return false;
	} else if (!(country)) {
		$("#firstnameerror").text("");
		$("#deliveryaddress input[name=country]").val('');
		$("#deliveryaddress input[name=country]").focus();
		$("#firstnameerror").text("* Only characters are allowed");
		return false;
	}

	else {
		$("#firstnameerror").text("");
		clearCookies();
		return true;

	}

}

/*----------------------------------
 # Save New Password
 -----------------------------------*/
function passwordChange() {
	var user_pwd1 = $("#PasswordChange input[name=password]").val();
	var user_cofirmpwd1 = $("#PasswordChange input[name=confirm_password ]")
			.val();
	if (user_pwd1 == user_cofirmpwd1) {
		if (!validatePassword(user_pwd1)) {
			$("#PasswordChange input[name=password]").val('');
			$("#PasswordChange input[name=confirm_password ]").val('');
			$("#PasswordChange input[name=password]").focus();
			$("#newpassworderror")
					.text(
							"[Password must contain at least 6 characters, including Upper/lowercase and numbers.]");
			return false;
		} else {
			$$("#PasswordChange input[name=password]").val('');
			$("#PasswordChange input[name=confirm_password ]").val('');
			$("#PasswordChange input[name=password]").focus();
			$("#newpassworderror").text(
					"[Password Mismatch Enter Password Again]");
			return false;
		}
	}
	return true;
}

/*----------------------------------
 # End Save New Password
 -----------------------------------*/

