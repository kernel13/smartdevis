
$(function(){
	$("#work_start").datepicker();	
	$("#work_end").datepicker();	
	$( "#search_material" ).autocomplete({
	            source: function(request, response){
					$.getJSON('/materials', function(data){
							var tags = $.map(data, function(a){ return a.name });
					 		var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( request.term ), "i" );
					        response( $.grep( tags, function( item ){
					                return matcher.test( item );
					            }) );
					
					});
				},
				select: function(event, ui){ alert(ui.item); }
	});
});
