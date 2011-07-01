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