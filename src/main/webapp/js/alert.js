/*alert show time*/
function alertShowT(name,time){
	var alert = $(name);
	alert.removeClass("hidden");
	 setTimeout(function(){ alert.addClass("hidden");},time); 
}

/*alert show time*/
function alertShow(name){
	 $(name).removeClass("hidden");
	
}
/*alert hide time*/
function alertHideT(name,time){
	 setTimeout(function(){ $(name).addClass("hidden");},time); 
}
/*alert hide*/
function alertHide(name){
$(name).addClass("hidden"); 
}
