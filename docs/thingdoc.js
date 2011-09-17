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

/*if(iPhone){
window.onscroll = function() {
  checkMenu();};

}*/
  
var myScroll;
$(document).ready(function(){
	if(iPhone){
		
		myScroll = new iScroll('main', {
			useTransform: false,
			onBeforeScrollStart: function (e) {
				var target = e.target;
				while (target.nodeType != 1) target = target.parentNode;

				if (target.tagName != 'SELECT' && target.tagName != 'INPUT' && target.tagName != 'TEXTAREA')
					e.preventDefault();
			}
		});
	$('#assemblymenu').toggle();
	
	}
	function onCompletion () {
	// Here modify the DOM in any way, eg: by adding LIs to the scroller UL
		if(iPhone){
		setTimeout(function () {
			myScroll.refresh();
		}, 0);
		}
	};
	
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
    	if(iPhone){
    		$('#genericmenu').toggle();
    		$('#assemblymenu').toggle();
    	}
		$.cookie(unique + "_button", "assembly");

	}

	$("#homebutton").click(function(){
		homebutton();
		onCompletion();

	});
	
	$("#bombutton").click(function(){
		bombutton();
		onCompletion();

	});
	
	
	$("#thingsbutton").click(function(){
		thingsbutton();
		onCompletion();

	});

	$("#assemblybutton").click(function(){
		assemblybutton();
		onCompletion();


	});
	
	
	
	
	//find out assembly counts
	var n = $(".subassembly").length;
	$("#assemblyCount").html(n);
	
	var actualAssembly = 1;
	
	
	function increaseActualAssembly(){
		$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'none');
		if (actualAssembly >= n){
			
		}else{
			actualAssembly++;
		}
		$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'block');
		$("#assemblyActual").html(actualAssembly);
		
	}
	
	function decreaseActualAssembly(){
	
		$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'none');
		if (actualAssembly <= 1){
			
		}else{
			actualAssembly--;
		}
		$(".subassembly:eq("+ (actualAssembly-1) +")").css('display', 'block');
		$("#assemblyActual").html(actualAssembly);
	}
	
	$("#increaseAssembly").click(function(){
		increaseActualAssembly();
		onCompletion();
	});
	$("#decreaseAssembly").click(function(){
		decreaseActualAssembly();
		onCompletion();

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

	
     
     
     
