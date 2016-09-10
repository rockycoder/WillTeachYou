/*----------------------------------
# Schedule  trial js
-----------------------------------*/
function scheduleTrial() {
	var scheduler_name = $("#schedule-form input[name=recipient-name]").val();
	var scheduler_email = $("#schedule-form input[name=recipient-email]").val();
	var scheduler_mobileno = $("#schedule-form input[name=recipient-number]")
			.val();
	var scheduler_date = $("#schedule-form input[name=trial-date]").val();
	var scheduler_address = $("textarea#recipient-address").val();
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1;
	var yyyy = today.getFullYear();
	if (dd < 10) {
		dd = '0' + dd
	}

	if (mm < 10) {
		mm = '0' + mm
	}
	today = yyyy + '-' + mm + '-' + dd;
	if (scheduler_name.length < 2) {
		//console.log("bad name");
		$("#schedule-form input[name=recipient-name]").val('');
		$("#schedule-form input[name=recipient-name]").focus();
		$("#schedule-nameerror").text(
				" * Name must contain atleast two characters");
		return false;
	} else if (!validateEmail(scheduler_email)) {
		$("#schedule-nameerror").text("");
	//	console.log("bad email");
		$("#schedule-form input[name=recipient-email]").val('');
		$("#schedule-form input[name=recipient-email]").focus();
		$("#schedule-emailerror").text(" * Enter valid email id");
		return false;
	} else if (!validateMobile(scheduler_mobileno)) {
		$("#schedule-emailerror").text("");
	//	console.log("bad mobile");
		$("#schedule-form input[name=recipient-number]").val('');
		$("#schedule-form input[name=recipient-number]").focus();
		$("#schedule-mobileerror").text(" * Enter valid 10 digit mobile no");
		return false;
	} else if ((new Date(scheduler_date).getTime() < new Date(today).getTime())
			|| scheduler_date == "") {
		$("#schedule-mobileerror").text("");
		$("#schedule-form input[name=trial-date]").val(today);
		$("#schedule-form input[name=trial-date]").focus();
		$("#schedule-dateerror").text(" * Can't schedule for past date");
		return false;
	} else if (scheduler_address.length < 5) {
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
		"name" : scheduler_name,
		"email" : scheduler_email,
		"mobile" : scheduler_mobileno,
		"date" : scheduler_date,
		"address" : scheduler_address
	};
	//console.log(scheduleobject);
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