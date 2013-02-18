

$(function(){
	$("#delete_logo_btn").click(function(){
		$("#delete_logo_loader").removeClass("hidden");
	});
	$("#company_reset_password_form").dialog({ autoOpen: false });
	$("#company_reset_password").click(function(){
		$("#company_reset_password_form").dialog("open");
	}); 
	//
	//	Company file upload
	//
	$(".file_upload_form").dialog({ 
		autoOpen: false,
		buttons: {
	        Submit: function() {
			  $("#uploadForm").submit();
	          $( this ).dialog( "close" );
			  return false;
	        },
	        Cancel: function() {
	          $( this ).dialog( "close" );
	        }
		}
		});
	$("#company_logo_button").click(function(){
		 $(".file_upload_form").dialog("open");
	});
	
	$('.file_upload_form input').change(function(){
	 $(this).parent().ajaxSubmit({
	  beforeSubmit: function(a,f,o) {
	   o.dataType = 'json';
	  },
	  complete: function(XMLHttpRequest, textStatus) {
	  
	  },
	 });
	});
	
	// 
	//	main menu
	//	
	$( "#menu" ).position({
		my: "top",
    	of: $("#headband")
	});
		
	$("#menu_button").mouseenter(function(){		
		$( "#menu" ).show( "drop", {direction: "up"}, 400 );		
	});
	
	$("#menu").mouseleave(function(){
			$(this).hide();
	});

	$("#menu img").hover(
		function(){ this.src = this.src.replace(96, 128); },
		function(){ this.src = this.src.replace(128, 96); }
	);
	
	//
	//			Worksite
	//
	var w = new Worksite();
	
	//
	// 			Material 
	//
	var m = new Material();
	
	//
	// 			Customers
	//
	var c = new Customers();
	
	//
	//			Enable Tooltip
	//
	//$(document).tooltip();
	
});


//------------------------------------------------
//	Class: Worksite
//		Constructor
//		Method:
//			AddWorksite(): Add dynamically a worksite to an estimate
//------------------------------------------------
Worksite = function(reason, description, workSiteStartOn, workSiteEndOn) {
	var that = this;
	this.__reason = reason;
	this.__description = description;
	this.__workSiteStartOn = workSiteStartOn;
	this.__workSiteEndOn = workSiteEndOn;
		
	// Date Picker
	$("#work_start input").live('click', function() { 
		$(this).datepicker({showOn: 'focus'}).focus(); 
	});	
	
	$("#work_end input").live('click', function() { 
		$(this).datepicker({showOn: 'focus'}).focus(); 
	});

	// Worksite Dialog
	$( "#dialog-add-worksite" ).dialog({
      autoOpen: false,
      height: 450,
      width: 650,
      modal: true,
      buttons: {
        Save: function() {
	
			$("#dialog-add-worksite form").submit();
			
			that.__reason = $("#worksite_reason").val();
			that.__description = $("#worksite_description").val();			
			that.__workSiteStartOn = $("#worksite_work_start_on").val();
			that.__workSiteEndOn = $("#worksite_work_end_on").val();
			
			that.AddWorksite();
			
			$( this ).dialog( "close" );
		
		 /*
          var bValid = true;
          allFields.removeClass( "ui-state-error" );

          bValid = bValid && checkLength( name, "username", 3, 16 );
          bValid = bValid && checkLength( email, "email", 6, 80 );
          bValid = bValid && checkLength( password, "password", 5, 16 );

          bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
          // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
          bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
          bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );

          if ( bValid ) {
            $( "#users tbody" ).append( "<tr>" +
              "<td>" + name.val() + "</td>" + 
              "<td>" + email.val() + "</td>" + 
              "<td>" + password.val() + "</td>" +
            "</tr>" ); 
            $( this ).dialog( "close" );
          }
		*/
        },
        Cancel: function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });
	
	// Method AddWorksite
	// 		Update an estimate and add a woorksite to it
	this.AddWorksite = function(){	
 		var html = "<p style='text-align: left; font-size: 18px;'>" +
				   "<span style='font-weight: bold; text-decoration: underline;'>Motif: </span>" + that.__reason + "</p>" +
				   "<p style='text-align: left;'><span style='font-weight: bold;'>Description: </span>" + that.__description + "</p>"		
				
				
		$("#Worksite_form").append(html);
	}
}

//------------------------------------------------
//	Class: Material
//------------------------------------------------
Material = function(){

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

}


//------------------------------------------------
//	Class: Customers
//	Constructor:
//
//	Method:
//		find(id): Find a customer with the given id
//		find_by_name(name): find a customer with the name
//------------------------------------------------
Customers = function(data){
	var that = this;
	this.__customers = new Array();

	$("#customer_name").autocomplete({
	            source: function(request, response){
					$.getJSON('/customers', function(data){	

						  // customers = new Customers(data);
						 	for(customer in data)
							{
								that.__customers.push(new Customer(data[customer], data[customer].address));		
							}
										 
							var tags = $.map(data, function(a){ return {value: a.id, label: a.customer_name} });
					 		var matcher = new RegExp($.ui.autocomplete.escapeRegex( request.term ), "i" );
					        response( $.grep( tags, function( item ){
					                return matcher.test( item.label );
					         }) );

					});
				},
				select: function(event, ui){					    
						$("#customer_name").val(ui.item.label); 					 						
						$("#customer_id").val(ui.item.value); 
						that.find(ui.item.value).UpdateField();	
						return false;				 
				}


	});

	$("#new_customer_dialog_form").dialog({
		autoOpen: false,
		height: 500,
		widht: 300,
		modal: true
	});

	$("#new_customer_button").click(function(event) {
	     $("#new_customer_dialog_form").dialog( "open" );
		 return false;	
	 });

	$("#new_customer_dialog_form form").on("submit", function() {
		var valuesToSubmit = $(this).serialize();
	  	$.ajax({
			type: "Post",
	        url: $(this).attr('action'), 
	        data: valuesToSubmit,
	        dataType: "JSON"
	    }).success(function(data){
			var c = new Customer(data, data.address);
			c.UpdateField();
	    });

	    $('#new_customer_dialog_form').dialog("close");
		return false;
	});


	//	Method Find
	// return the customer  with the given id
	this.find = function(id){
		for(customer in this.__customers)
		{
			if(this.__customers[customer].id() == id){
				return this.__customers[customer];
			}
				
		}
	}
	
	// Method find_by_name
	// return a customer with the given name
	this.find_by_name = function(name){
			for(customer in this.__customers)
			{
				if(this.__customers[customer].Name() == name){
					return this.__customers[customer];
				}

			}
	}
}

//------------------------------------------------
//	Class: Customer
//------------------------------------------------
Customer = function(data, address){
	var that = this;
	this.__id = data.id;
	this.__name = data.customer_name;
	this.__address = new Address(address);

	this.id = function(){
		return this.__id;
	}
	this.Name = function(){
		return this.__name;
	}
	
	this.Address = function(){
		return this.__address;	
	}
	
	this.UpdateField = function(){
		//alert("ok");
		$("#customer_name").val(this.__name);
		$("#customer_id").val(this.__id);
		this.__address.AddressLine1() != null ? $("#address").text(this.__address.AddressLine1()) : $("#address").text("");
		this.__address.AddressLine2() != null ? $("#address").text($("#address").text () + " " + this.__address.AddressLine2()) : $("#address").text("");
		this.__address.Phone() != null ? $("#phone").text(this.__address.Phone()) : $("#phone").text("");
		this.__address.Fax() != null ? $("#fax").text(this.__address.Fax()) : $("#fax").text("");
		this.__address.EMail() != null ? $("#email").text(this.__address.EMail()) : $("#email").text("");
	}
}

//------------------------------------------------
//	Class: Address
//------------------------------------------------
Address = function(address){
	this.__address_line1 = address.address_line1;
	this.__address_line2 = address.address_line2;
	this.__city = address.city;
	this.__postal_code = address.postal_code;
	this.__phone = address.phone;
	this.__fax = address.fax;
	this.__email = address.email;
	
	this.AddressLine1 = function(){
		return this.__address_line1;
	}
	
	this.AddressLine2 = function(){
		return this.__address_line2;
	}
	
	this.City = function(){
		return this.__city;
	}
	
	this.PostalCode = function(){
		return this.__postal_code
	}
	
	this.Phone = function(){
		return this.__phone;
	}
	
	this.Fax = function(){
		return this.__fax;
	}
	
	this.EMail = function(){
		return this.__email;
	}
}


//------------------------------------------------
//	Class: ErrorHandler
//------------------------------------------------
ErrorHandler = function()
{
	this.__errors = new Array()

	this.Add = function(dom, errors){
		
		errors = errors.replace(/&quot;/g, "");
		errors = errors.replace("[", "");
		errors = errors.replace("]", "");
		errors = errors.split(",");
		
		var h = {};
		h['dom'] = dom;
		h['errors'] = errors;
		
		this.__errors.push(h);
	}
	
	this.ShowErrors = function(){

		// Remove any previous errror
		this.RemoveErrors();

		for(var item in this.__errors){
			var current_error = this.__errors[item];
			
			$(current_error.dom).closest("div.control-group").addClass("error");
			
			var html = "<ul class='help-inline'>";
			for(var err in current_error.errors){
				html = html + "<li><span>" + current_error.errors[err] + "</span></li>";
			}
			html = html + "</ul>";
			
			$(current_error.dom).closest("div.controls").append(html);
		}
		
	}
	
	this.RemoveErrors = function(){
		
		for(var item in this.__errors){
			var current_error = this.__errors[item];
			$(current_error.dom).closest("div.control-group").removeClass("error");
			$(current_error.dom).closest("div.controls").find("ul").remove();
		}
	}
}


