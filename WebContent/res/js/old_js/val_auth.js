 
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
