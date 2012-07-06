$(document).ready(function(){

	$(".logout-popup").click(function(e){
    	$(".logout-popup .logout-popup-content").css("visibility","visible");
   		e.stopPropagation();
	});

	$("body").click(function(e){
    	$(".logout-popup .logout-popup-content").css("visibility","hidden");
	});
});