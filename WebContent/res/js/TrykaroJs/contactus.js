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
	$('[data-toggle="tooltip"]').tooltip();
	
});
