/*$(document).ready(function() {

	var checkBoxList;

	$('.check-box').click(function() {
		var parameters;

		disableAllFilters();

		$('.check-box').each(function(i, obj) {

			var element = obj.getElementsByTagName('input')[0];
			var label = obj.getElementsByTagName('label')[0];
			if (element.checked == true) {

				if (element.getAttribute('id').match("^cat-")) {
					
					if (parameters == null || parameters == '') {
						
						parameters = 'category='+label.textContent;

					} else {
						parameters = parameters +','+label.textContent;
					}
					

				} else if (element.getAttribute('id').match("^factory-")) {
					
					if (parameters == null || parameters == '') {
						
						

					} else {

					}

				}
				

			}
		});

	});
});

function disableAllFilters() {

	$('.check-box').each(function(i, obj) {

		obj.attr("disabled", "disabled");

	});
}

$.ajax({
	type : "GET",
	url : "feedbackSubmit?Feedback=" + escape(JSON.stringify(dataobj)),
	data : dataobj,
	cache : false,
	success : function(result) {

	},
	error : function(result) {

	}
});*/