// Menu positioning

function checkMenu() {
  document.getElementById('menu').style.top =
     (window.pageYOffset) + 'px';
};
var uagent = navigator.userAgent.toLowerCase();
var iPhone = false;
    if ((uagent.search("iphone") > -1)){
       iPhone = true;
    }else if ((uagent.search("ipod") > -1)){
       iPhone = true;
    }
    
var ua = navigator.userAgent.toLowerCase();
var android = ua.indexOf("android") > -1

/*
alert(ua);
alert("iPhone"+iPhone);
alert("android "+android);
*/

$(document).ready(function(){
	if(iPhone || android){
		$('#assemblymenu').toggle();
	}
	
	function homebutton(){
		$("#bom").css('display', 'none');
		$("#things").css('display', 'none');
		$("#assembly").css('display', 'none');
		$("#home").css('display', 'block');
		$('#homebutton').removeClass("white").addClass("gray");
    	$('#thingsbutton').removeClass("gray").addClass("white");
    	$('#assemblybutton').removeClass("gray").addClass("white");
    	$.cookie(unique + "_button", "home");
	}
	
	function bombutton(){
		$("#bom").css('display', 'block');
		$("#things").css('display', 'none');
		$("#assembly").css('display', 'none');
		$("#home").css('display', 'none');
		$('#homebutton').removeClass("gray").addClass("white");
    	$('#thingsbutton').removeClass("gray").addClass("white");
    	$('#assemblybutton').removeClass("gray").addClass("white");
		$.cookie(unique + "_button", "bom");
	}
	
	function thingsbutton(){
		$("#bom").css('display', 'none');
		$("#things").css('display', 'block');
		$("#assembly").css('display', 'none');
		$("#home").css('display', 'none');
		
		$('#thingsbutton').removeClass("white").addClass("gray");
    	$('#homebutton').removeClass("gray").addClass("white");
    	$('#assemblybutton').removeClass("gray").addClass("white");
		$.cookie(unique + "_button", "things");
	}
	
	function assemblybutton(){
		$("#bom").css('display', 'none');
		$("#things").css('display', 'none');
		$("#assembly").css('display', 'block');
		$("#home").css('display', 'none');
		$('#assemblybutton').removeClass("white").addClass("gray");
    	$('#homebutton').removeClass("gray").addClass("white");
    	$('#thingsbutton').removeClass("gray").addClass("white");
    	if(iPhone || android){
    		$('#genericmenu').toggle();
    		$('#assemblymenu').toggle();
    	}
		$.cookie(unique + "_button", "assembly");

	}

	$("#homebutton").click(function(){
		homebutton();
	});
	
	$("#bombutton").click(function(){
		bombutton();
	});
	
	
	$("#thingsbutton").click(function(){
		thingsbutton();

	});

	$("#assemblybutton").click(function(){
		assemblybutton();
	});
	
	
	
	
	//find out assembly counts
	var n = $(".subassembly").length;
	$("#assemblyCount").html(n);
	
	var actualAssembly = 1;
	if ($.cookie(unique + "_assemblyStep") > 1){
		actualAssembly = $.cookie(unique + "_assemblyStep");
	}
	$("#assemblyActual").html(actualAssembly);
	$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'block');
	
	
	function increaseActualAssembly(){
		$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'none');
		if (actualAssembly >= n){
			
		}else{
			actualAssembly++;
		}
		$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'block');
		$("#assemblyActual").html(actualAssembly);
		$.cookie(unique + "_assemblyStep", actualAssembly);
		
	}
	
	function decreaseActualAssembly(){
	
		$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'none');
		if (actualAssembly <= 1){
			
		}else{
			actualAssembly--;
		}
		$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'block');
		$("#assemblyActual").html(actualAssembly);
		$.cookie(unique + "_assemblyStep", actualAssembly);
	}
	
	$("#increaseAssembly").click(function(){
		
		if($.cookie(unique + "_button") != "assembly"){
			assemblybutton();
		}else{
			increaseActualAssembly();
		}
	});
	$("#decreaseAssembly").click(function(){
		
		if($.cookie(unique + "_button") != "assembly"){
			assemblybutton();
		}else{
			decreaseActualAssembly();
		}

	});
	
	//$.cookie(unique + "_button", "assembly");
	
	//BOM checkboxes stuff
	$('.bom_checkbox').each(function(index) {
    if($.cookie(unique + "_" +$(this).attr("name")) == "checked"){
    	$(this).attr('checked', true);
    }else{
    	$(this).attr('checked', false);
    }
    
    $(this).click(function(index) {
    	if($(this).attr('checked')){
    		$.cookie(unique + "_" +$(this).attr("name"), "checked");
    	}else{
    		$.cookie(unique + "_" +$(this).attr("name"), "notchecked");
    	}
    checkCompleteBOM();
    
    });
  });
  
  function checkCompleteBOM(){
  	var allCheckboxesCount = 0;
  	var allCheckedCheckboxes = 0;
  	$('.bom_checkbox').each(function(index) {
    	allCheckboxesCount++;
    if($(this).attr('checked')){
    	allCheckedCheckboxes++;
    }
   
  	});
   if(allCheckboxesCount==allCheckedCheckboxes){
    $('#bombutton').removeClass("red").addClass("green");
    }else{
    $('#bombutton').removeClass("green").addClass("red");
    }
  }
  checkCompleteBOM();
  
  jQuery('a[rel*=facebox]').facebox();
 // active button from cookie
	var button = $.cookie(unique + "_button");
	if(button == "home"){
	homebutton();
	}else if(button == "bom"){
	bombutton();
	}else if(button == "things"){
	thingsbutton();
	}else if(button == "assembly"){
	assemblybutton();
	}


});

	
     
     
     
