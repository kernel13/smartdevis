
$(function(){
	$("#work_start").datepicker();	
	$("#work_end").datepicker();
	
	$(".material_label").live("keydown.autocomplete", function(){
	
		$(this).autocomplete({
		            source: function(request, response){
						$.getJSON('/materials', function(data){
								var tags = $.map(data, function(a){ return {value: a.id, label: a.name} });
						 		var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( request.term ), "i" );
						        response( $.grep( tags, function( item ){
						                return matcher.test( item.label );
						            }) );

						});
					},
					select: function(event, ui){
							$(".material_label").last().val(ui.item.label); 					 						
							$(".material_value").last().val(ui.item.value); 	
							return false;				 
					}
					
					
		});	
		
	});
	
	
});
