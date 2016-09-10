
//START Dropdown customised
$(document).ready(function(){
	$(".search-dropdown li a").click(function(){
    
    $("button span:first-child").text($(this).text());
     $("button span:first-child").val($(this).text());
  });
});
//END customized Dropdown


//Start search fixed header bar
$(window).scroll(function (event) {
    var scroll = $(window).scrollTop();
    if(scroll > 202){
    	
    	$('.search-wrapper').addClass('fixed-search');
    	$(".logo-search").show(500);
	}
	else{
		$('.search-wrapper').removeClass('fixed-search');
		$(".logo-search").hide();
    }
});
//END fixed haeder search bar


