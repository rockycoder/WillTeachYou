/*----------------------------------
# Contact us form 
-----------------------------------*/

jQuery.loadScript = function(url, callback) {
	jQuery.ajax({
		url : url,
		dataType : 'script',
		success : callback,
		async : true
	});
}

$(document).ready(function() {

});

function selectLocation(item) {

	for (var i = 0, j = item.options.length; i < j; i++) {
		if (item.options[i].selected && item.options[i].value != null
				&& item.options[i].value != '') {

			$.ajax({
				type : "GET",
				url : "getLocation?topic=" + item.options[i].value,
				data : couponCode,
				cache : false,
				success : function(result) {
					
					

				}
			});
		}
	}

}
