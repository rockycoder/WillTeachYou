$(document).ready(function() {
	
	
	
	
	
	/*$('#electronics').click(function(e) {
		// e.preventDefault();
		console.log(this.id);
		var category = this.id;
		$.ajax({
			type : "GET",
			url : "products?category=" + category,
			data : category,
			cache : true,
			success : function(result) {
				console.log(this.id);
				window.location = "products";

			},
			error : function(result) {
				console.log(this.id);

			}

		});

	});*/
/*	$('#fragnance').click(function(e) {
		// e.preventDefault();
		console.log(this.id);
		var category = this.id;
		$.ajax({
			type : "GET",
			url : "products?category=" + category,
			data : category,
			cache : true,
			success : function(result) {
				console.log(this.id);
				window.location = "products?category=" + category;

			},
			error : function(result) {
				console.log(this.id);

			}

		});

	});*/
	/*$('.productlisting a').click(function(e) 
	{
		// e.preventDefault();
		//console.log(this.id);
		var category = this.id;
		var id=this.name;
		//console.log(id);
		window.location = "productsdetails?id="+id;

			

	});*/

	/*$('#mobiles').click(function(e) {
		// e.preventDefault();
		console.log(this.id);
		var category = this.id;
		$.ajax({
			type : "GET",
			url : "products?category=" + category,
			data : category,
			cache : true,
			success : function(result) {
				console.log(this.id);
			},
			error : function(result) {
				console.log(this.id);

			}

		});

	});*/

	$('.testclass a').click(function(e) {
		var productid = this.id;
		console.log(productid);
		window.location = "productdetails?id=" + productid;
	});

	$('#jointrykaro').click(function(e) {

		window.location = "login";
	});
	
	$('.group a#detailView').click(function(e) {
		var fragranceId = this.name;
	

	$.ajax({
		type : "GET",
		url :"fragranceDetail?fragranceId="+fragranceId ,
		data : fragranceId,
		cache : true,
		success : function(result) {
			//console.log(this.id);
		},
		error : function(result) {
			//console.log(this.id);

		}

	});
	/*$('#mobilessamsung').click(function(e) {
		// e.preventDefault();
		console.log(this.id);
		var data = {
			"category" : this.id

		};
		$.ajax({
			type : "GET",
			url : "products?category=" + data.category,
			data : data,
			cache : true,
			success : function(result) {
				console.log(this.id);
			},
			error : function(result) {
				console.log(this.id);

			}

		});

	});*/
	
});

	
});
