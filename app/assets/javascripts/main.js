

$(function(){
	//
	// Materials
	//
	$("#materials tr").on("mouseover", function(){
		$(this).css("cursor", "pointer")
	});

	$("#materials tr").on("click",function(){
		var id = $(this).find("input").val();
	
		
		$(this).attr("href", "/materials/" + id + "/edit");
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );
	});


	$("#material_tree").jstree({
			"plugins" : [ "themes", "html_data", "ui", "crrm", "contextmenu" ],
			themes: {
        		"theme": "default",
        		"dots": true,
        		"icons": true,
        		"url": "/assets/themes/default/style.css"
      		},
			contextmenu: {
				items: {
				ccp: false
				}
			}	
		})
		.on('loaded.jstree', function() {
    		$("#material_tree").jstree('open_all');
  		})
  		.on("create.jstree", function(e, data){

  			var parent_id = data.rslt.parent.find("a").attr("id").replace("node_","");
  			var name = data.rslt.name;
			
			$.ajax({
				type: "POST",
	            url: "/categories",
	            data: {
					"authenticity_token": $('meta[name="csrf-token"]').attr('content'),
	            	"category":
	            	{
	                	"parent_id" : data.rslt.parent.find("a").attr("id").replace("node_",""),	              	
	                	"name" : data.rslt.name
	            	}
	        	},
	            success: function (r) {	           
	                  $(data.rslt.obj).attr("id", "node_" + r.id);
	            },
	            error: function(r){
	            	//alert(JSON.stringify(r.responseText, null, 4));
	            	alert($.parseJSON(r.responseText).name);
					$.jstree.rollback(data.rlbk);	                   
	            },
	            dataType: "json"
	        });  	       			
  		})
  		.on("remove.jstree", function(e, data){
			
			$.ajax({
				type: "delete",
	            url: "/categories/" + data.rslt.obj.find("a").attr("id").replace("node_",""),	           
	            success: function (r) {	 

	                  //$(data.rslt.obj).attr("id", "node_" + r.id);
	            },
	            error: function(r){
	            	//alert(JSON.stringify(r.responseText, null, 4));
	            	
					$.jstree.rollback(data.rlbk);	                   
	            },
	            dataType: "json"
	        })
		})
		.on("rename.jstree", function(e, data){

  			var id = data.rslt.obj.find("a").attr("id").replace("node_","");
  			var name = data.rslt.new_name;
			
			$.ajax({
				type: "PUT",
	            url: "/categories/" + id,
	            data: {
					"authenticity_token": $('meta[name="csrf-token"]').attr('content'),
	            	"category":
	            	{              	
	                	"name" : name
	            	}
	        	},
	            error: function(r){
	            	//alert(JSON.stringify(r.responseText, null, 4));
	            	alert($.parseJSON(r.responseText).name);
					$.jstree.rollback(data.rlbk);	                   
	            },
	            dataType: "json"
	        });  	       			
  		});  

	//
	//	Employee
	//
	$("#employees tr").on("mouseover", function(){
		$(this).css("cursor", "pointer")
	});
	$("#employees tr").on("click",function(){
		var id = $(this).find("input").val();
	
		
		$(this).attr("href", "/employees/" + id + "/edit");
		$(this).attr("method", "GET");
		$.rails.handleRemote( $(this) );
	});
	
	//
	// Customer letter scrolling
	//
	var el = $('#div_letter');
	var originalelpos;
	if(el.offset() != null)
		originalelpos = el.offset();
	
    $(window).scroll(function () {
    	 var elpos;

	     var el = $('#div_letter'); // important! (local)
	     if(el.offset() != undefined)
	     	elpos = el.offset().top; // take current situation
	     var windowpos = $(window).scrollTop();
	     var finaldestination = windowpos + originalelpos;
	     el.stop().animate({ 'margin-top': windowpos }, 200);
    });

	 $(".badge a").click(function(){
		$("html, body").animate({ scrollTop: 0 }, "slow");
		//el.stop().animate({ 'margin-top': 0 }, 200);
	 });
	// End of customer scrolling

	//
	//	Company file upload and delete
	//
	$("#delete_logo_btn").click(function(){
		$("#delete_logo_loader").removeClass("hidden");
	});
	$("#company_reset_password_form").dialog({ autoOpen: false });
	$("#company_reset_password").click(function(){
		$("#company_reset_password_form").dialog("open");
	}); 
	
	
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
	// 			Customers
	//
	var c = new Customers();
	
	//
	//			Enable Tooltip
	//
	//$(document).tooltip();
	
});


// -------------------------------------------
//	Class: GUID
// -------------------------------------------
GUID = function(){

	 this.Rand = function() {
	   return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	 }

	 this.guid = function() {
	   return (this.Rand()+this.Rand()+"-"+this.Rand()+"-"+this.Rand()+"-"+this.Rand()+"-"+this.Rand()+this.Rand()+this.Rand());
	 }

}

GUID.NewId = function(){
	return new GUID().guid();	
}

// -------------------------------------------
//	Class AutoCompleteParser
// -------------------------------------------
AutoCompleteParser = function(dom, uri, funcSource, funcSelect){ 

	$("body").on("keydown.autocomplete", dom, function(){
		
		$(this).autocomplete({
		            source: function(request, response){
						$.getJSON(uri, function(data){
								var tags = $.map(data, function(a){ 
									return funcSource(a);
								});
						 		var matcher = new RegExp($.ui.autocomplete.escapeRegex( request.term ), "i" );
						        response( $.grep( tags, function( item ){
						                return matcher.test( item.label );
						            }) );

						});
					},
					select: function(event, ui){
							funcSelect(this, ui);

							return false;				 
					}
			
			
		});	

	});
}

AutoCompleteParser.Activate = function(dom, uri, funcSource, funcSelect){
	return new AutoCompleteParser(dom, uri, funcSource, funcSelect);
}

//------------------------------------------------
//	Class: Attribute
//		Constructor
//------------------------------------------------
Attribute = function(field, model){
	this.__field = field;
	this.__guid = GUID.NewId();

	if($(this.__field).closest("tr").attr("id"))
		this.__id = $(this.__field).closest("tr").attr("id");
	else
  		this.__id = model + "_" + this.__guid;
  		
	this.GetID= function(){ 
		try
		{
			return this.__field.find("tr").attr("id");
		}
		catch(err)
		{
			if(err == "TypeError: this.__field.find is not a function")
				return $(this.__field).closest("tr").attr("id");
		}
	}

	this.SetID = function(){
		this.__field.find("tr").attr("id", this.__id);
	}

	this.GetType = function (field) {
		return this.__field.find("tr").attr("type");
	}
}

Attribute.ID = function (field) {
	return new Attribute(field).GetID();
}

Attribute.Type = function(field){
	return new Attribute(field).GetType();
}

//------------------------------------------------
//	Class: Worksite
//		Constructor
//		Method:
//			AddWorksite(): Add dynamically a worksite to an estimate
//------------------------------------------------
Worksite = function(objWorksite) {
	var that = this;
	this.__reason;
	this.__description;
	this.__workSiteStartOn;
	this.__workSiteEndOn;
	this.__Total = 0;

	this.__materials = new Array();
	this.__employees = new Array();		

	// Date Picker
	$("#worksite_work_start_on").on('click', function() { 		
		$(this).datepicker({showOn: 'focus'}).focus(); 
	});	
	
	$("#worksite_work_end_on").on('click', function() { 
		$(this).datepicker({showOn: 'focus'}).focus(); 
	});


	// Worksite Dialog
	// $( "#dialog-add-worksite" ).dialog({
 //      autoOpen: false,
 //      height: 450,
 //      width: 650,
 //      modal: true,
 //      buttons: {
 //        Save: function() {
	
	// 		$("#dialog-add-worksite form").submit();
			
	// 		that.__reason = $("#worksite_reason").val();
	// 		that.__description = $("#worksite_description").val();			
	// 		that.__workSiteStartOn = $("#worksite_work_start_on").val();
	// 		that.__workSiteEndOn = $("#worksite_work_end_on").val();
			
	// 		that.AddWorksite();
			
	// 		$( this ).dialog( "close" );
		
		 
 //          var bValid = true;
 //          allFields.removeClass( "ui-state-error" );

 //          bValid = bValid && checkLength( name, "username", 3, 16 );
 //          bValid = bValid && checkLength( email, "email", 6, 80 );
 //          bValid = bValid && checkLength( password, "password", 5, 16 );

 //          bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
 //          // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
 //          bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
 //          bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );

 //          if ( bValid ) {
 //            $( "#users tbody" ).append( "<tr>" +
 //              "<td>" + name.val() + "</td>" + 
 //              "<td>" + email.val() + "</td>" + 
 //              "<td>" + password.val() + "</td>" +
 //            "</tr>" ); 
 //            $( this ).dialog( "close" );
 //          }
		
 //        },
 //        Cancel: function() {
 //          $( this ).dialog( "close" );
 //        }
 //      },
 //      close: function() {
 //        allFields.val( "" ).removeClass( "ui-state-error" );
 //      }
 //    });

	// Bind added field to corresponding object
	$(document).on('nested:fieldAdded', function(event){		
  		// this field was just inserted into your form
  		var field = event.field;   	
  		
  		switch(Attribute.Type(field)){
  			case "material":
  				var attr = new Attribute(field, "material");
  				attr.SetID();  				
  				that.CreateMaterial(attr.GetID());

  				break;
  			case "employee":
  				var attr = new Attribute(field, "employee");
  				attr.SetID();  				
  				that.CreateEmployee(attr.GetID());

  				break;
  		}

  		// it's a jQuery object already! Now you can find date input
  		//var dateField = field.find('.date');
  		// and activate datepicker on it
  		//dateField.datepicker();
	});

	$(document).on('nested:fieldRemoved', function(event){
		var field = event.field;   	
  		switch(Attribute.Type(field)){
  			case "material":
  				var id = field.find("tr").attr("id");
  				that.RemoveMaterial(id);
  				break;
  			case "employee":
  				var id = field.find("tr").attr("id");
  				that.RemoveEmployee(id);
  				break;
  		}
	});


	AutoCompleteParser.Activate("input.material_label", '/materials',
		function(a){
			return {
				value: a.id, 
				label: a.name,
				unit_price: a.unit_priceTF,
				category: a.category_id
			}
		},
		function(dom, ui){
			$(dom).val(ui.item.label); 					 						
			$(dom).siblings(".material_value").val(ui.item.value); 	
			$(dom).siblings(".material_unit_price_tf").val(ui.item.unit_price); 	

			var id = Attribute.ID(dom); 			
			that.__materials[id].UnitPrice(ui.item.unit_price);
		});


	$("body").on("change", "input.material_quantity", function(){		
		var id = $(this).closest("tr").attr("id");
		that.__materials[id].Quantity($(this).val());
		that.__materials[id].UpdateTotal(this);

		that.UpdateTotal();
	});

	$("body").on("change", "input.material_tva", function(){
		var id = $(this).closest("tr").attr("id");
		that.__materials[id].Tva($(this).val());
		that.__materials[id].UpdateTotal(this);

		that.UpdateTotal();
	});
	

	AutoCompleteParser.Activate("input.employee_name", '/employees',
		function(a){
			return {
					value: a.id, 
					label: a.first_name + " " + a.last_name,
					price: a.day_price		
			}
		},
		function(dom, ui){
			$(dom).val(ui.item.label); 					 						
			$(dom).siblings(".employee_value").val(ui.item.value); 	
			$(dom).parent("td").next().find("input").val(ui.item.price);

			var id = Attribute.ID(dom); 			
			that.__employees[id].Price(ui.item.price);
		});

	$("body").on("change", "input.employee_nb_jour", function(){
		var id = $(this).closest("tr").attr("id");
		that.__employees[id].NbJour($(this).val());

		that.UpdateTotal();
	});

	$("body").on("click", "input.employee_half_day", function(){		
		var id = $(this).closest("tr").attr("id");				
		that.__employees[id].HalfDay($(this).is(":checked"));

		that.UpdateTotal();
	});


	// Method AddWorksite
	// 		Update an estimate and add a woorksite to it
	this.AddWorksite = function(){	
 		var html = "<p style='text-align: left; font-size: 18px;'>" +
				   "<span style='font-weight: bold; text-decoration: underline;'>Motif: </span>" + that.__reason + "</p>" +
				   "<p style='text-align: left;'><span style='font-weight: bold;'>Description: </span>" + that.__description + "</p>"		
				
				
		$("#Worksite_form").append(html);
	}

	this.CreateMaterial = function(id) {
		this.__materials[id] = new Material();
	}

	this.RemoveMaterial = function(id){
		delete this.__materials[id];
		this.UpdateTotal();
	}	

	this.CreateEmployee = function(id){
		this.__employees[id] = new Employee();		
	}

	this.RemoveEmployee = function(id){
		delete this.__employees[id];
		this.UpdateTotal();
	}

	this.UpdateTotal = function () {
		this.__total = 0;
		for(var m in this.__materials){
			this.__total = this.__total + this.__materials[m].Total();
		}

		for(var e in this.__employees){
			this.__total = this.__total + this.__employees[e].Total();
		}

		$("#worksite_total span.value").text(this.__total.toFixed(2));
	}


	// If an object is given to the construcotr then it is initialized with it
	if(objWorksite)
	{
		this.__reason = objWorksite.reason;
		this.__description = objWorksite.description;
		this.__workSiteStartOn = objWorksite.work_start_on;
		this.__workSiteEndOn = objWorksite.work_end_on;

		for(var w in objWorksite.items){
			this.__materials["material_" + objWorksite.items[w].material_id] = new Material(objWorksite.items[w]);
		}

		for(var e in objWorksite.employee_tasks){			
			this.__employees["employee_" + objWorksite.employee_tasks[e].employee_id] = new Employee(objWorksite.employee_tasks[e]);
		}

		this.UpdateTotal();
	}
}


//------------------------------------------------
//	Class: Material
//------------------------------------------------
Material = function(material){
	var that = this;

	this.__unit_priceTF = 0;
	this.__quantity = 0;
	this.__tva = 0;
	this.__total = 0;	


	this.UnitPrice = function (value) {
		if(value)
			this.__unit_priceTF	= value;
		else
			return this.__unit_priceTF;
	}

	this.Total = function () {
		return this.__total;
	}

	this.Quantity = function (value) {
		if(value)
			this.__quantity = value;
		else
			return this.__quantity;
	}

	this.Tva = function (value){
		if(value)
			this.__tva = value;
		else
			return this.__tva;
	}

	this.UpdateTotal = function(e)
	{
		// Update total price
		this.__total = this.__unit_priceTF * this.__quantity + (((this.__unit_priceTF * this.__quantity) * this.__tva) / 100);
		
		$(e).parent("td").siblings(".material_totalTF").find("input").val(this.__total.toFixed(2));	
	}


	if(material)
	{	
		this.__unit_priceTF = material.material.unit_priceTF;
		this.__quantity = material.quantity;
		this.__tva = material.tva;

		this.UpdateTotal();
	}
}


//------------------------------------------------
//	Class: Employee
//	Constructor:
//
//	Method:
//------------------------------------------------
Employee = function(employee){
	this.__price = 0;
	this.__nb_day = 0;
	this.__half_day = false;

	if(employee)
	{
		this.__price = employee.employee.day_price;
		this.__nb_day = employee.nb_day;
		this.__half_day = employee.half_day;
	}

	this.Price = function (value) {
		if(value)
			this.__price = value;
		else
			return this.__price;
	}

	this.NbJour = function (value) {
		if(value)
			this.__nb_day = value;
		else
			return this.__nb_day;
	}
	
	this.HalfDay = function (value) {
		if(value != undefined)
			this.__half_day = value;
		else
			return this.__half_day;
	}

    this.Total = function () {
    	var nbday = this.__nb_day;
    	if(this.__half_day)
    		nbday = this.__nb_day / 2;

    	return (this.__price * nbday);
    }
/*
	$("body").on("keydown.autocomplete", "input.employee_name", function(){
		$(this).autocomplete({
		            source: function(request, response){
						$.getJSON('/employees', function(data){
								var tags = $.map(data, function(a){ return {
										value: a.id, 
										label: a.first_name + " " + a.last_name,
										price: a.day_price										
									}
								});
						 		var matcher = new RegExp($.ui.autocomplete.escapeRegex( request.term ), "i" );
						        response( $.grep( tags, function( item ){
						                return matcher.test( item.label );
						            }) );

						});
					},
					select: function(event, ui){
							$(this).val(ui.item.label); 					 						
							$(this).siblings(".employee_value").val(ui.item.value); 	
							$(this).parent("td").next().find("input").val(ui.item.price);
							return false;				 
					}
			
			
		});	

	});
*/

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
		$("#customer_name").val(this.__name);
		$("#customer_id").val(this.__id);

		var address = this.__address.AddressLine1() + "<br />" +
					  this.__address.AddressLine2() + "<br />" + 
					  "<b>Téléphone:</b> " + this.__address.Phone() + "<br />" + 
					  "<b>Fax:</b> " + this.__address.Fax() + "<br />" + 
					  "<b>EMail:</b> " + this.__address.EMail();

		$("address:last-child").html(address);

		/*
		this.__address.AddressLine1() != null ? $("address").text(this.__address.AddressLine1()) : $("address").text("");
		this.__address.AddressLine2() != null ? $("#address").text($("#address").text () + " " + this.__address.AddressLine2()) : $("#address").text("");
		this.__address.Phone() != null ? $("#phone").text(this.__address.Phone()) : $("#phone").text("");
		this.__address.Fax() != null ? $("#fax").text(this.__address.Fax()) : $("#fax").text("");
		this.__address.EMail() != null ? $("#email").text(this.__address.EMail()) : $("#email").text("");
		*/
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
		return this.__fax || "";
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


