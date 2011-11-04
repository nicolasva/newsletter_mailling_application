// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//$(document).ready(function() { 
//	if ($("#flash").is(':visible'))
//		$("#flash").delay(1000).fadeToggle(2000, "linear"); 
//});

$(document).ajaxSend(function(event, request, settings) {
	  if (typeof(AUTH_TOKEN) == "undefined") return;
	    // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
	       settings.data = settings.data || "";
	       settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

function functionlistmail(this_value) {
  $("#newsletter_mail_id").children().each(function(index) {
  	$(this).remove();
  });

  $("#newsletter_subcontact_id").children().each(function(index) {
     if ($(this).children()[0].checked)
     {
	$.ajax({
		url: "/mailslists",
		type: "POST",
	        data: {subcontact_id: $(this).children()[0].id.split("_")[$(this).children()[0].id.split("_").length-1], newsletter_id: $('#id_content').children()[0].id.split("_")[$('#id_content').children()[0].id.split("_").length-1]},
	        dataType: "html",
	        success: function(data) {
			$('#newsletter_mail_id').append(data);
		},
	        failure: function() {
			alert("Problem");
		},
	});
     }
  });
};

function emails_lists(subcontact_id) {
	//alert("nicolas test");
	$.ajax({
		url: "/javascripts/mails_lists",
		type: "POST",
		data: {subcontact_id: subcontact_id, newsletter_id: $('#id_content').children()[0].id.split("_")[$('#id_content').children()[0].id.split("_").length-1]},
		dataType: "html",
		success: function(data) {
			$('#newsletter_mail_id').append(data);
		},
		failure: function(data) {
			alert("Problem");
		},
	});
};

function subcontacts_lists(this_value) {
       $("#newsletter_subcontact_id").children().each(function(index) { 
         $(this).remove();
       });
       $("#newsletter_mail_id").children().each(function(index) {
         $(this).remove();
       });
       $.ajax({
              url: "/subcontactslists",
              type: "POST",
              data: {categoryall_id: this_value, newsletter_id: $('#id_content').children()[0].id.split("_")[$('#id_content').children()[0].id.split("_").length-1]},
              dataType: "html",
              success: function(data) {
                    $('#newsletter_subcontact_id').html(data);
                    $("#newsletter_subcontact_id").children().each(function(index) {
                          $(this).children().each(function(index) {
				if ($(this)[0].checked) {
                                          emails_lists($(this)[0].value);
			        }
		          });
	            });
	      },
	      failure: function() {
                    alert("Problem");
	      },
        }); 
};


        /*$("#mailstarts").sortable({
          items: '.mailstart', 
          containment:'parent', 
          axis:'y',
          update: function(data) {
              $.ajax({
                  url: "/mailstarts/sort",
                  type: "POST",
                  data: { _method: 'put', authenticity_token: AUTH_TOKEN+'&'+$(this).sortable('serialize')},
	          failure: function() {
                        alert("Problem sortable list");
	          };
              })
	   },
        });*/
