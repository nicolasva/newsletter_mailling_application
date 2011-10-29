# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
subcontacts_lists = (categoryall_id, newsletter_id) ->
        $.ajax({
             url: "/javascripts/subcontacts_lists",
             type: "POST",
             data: {categoryall_id: categoryall_id, newsletter_id: newsletter_id},
             dataType: "html",
             success: (data) ->
                   $('#newsletter_subcontact_id').html(data) 
                   $('#newsletter_subcontact_id').children().each (index) ->
                         $(this).children().each (index) ->
                               emails_lists($(this)[0].value, newsletter_id) if $(this)[0].checked
             failure: ->
                   alert("Problem")
        })

jQuery ->
 $('#newsletter_mailstart_id').children().click ->
       $("#newsletter_subcontact_id").children().each (index) -> 
         $(this).remove()
       $("#newsletter_mail_id").children().each (index) ->
         $(this).remove()
       $.ajax({
              url: "/javascripts/categoryalls_lists",
              type: "POST",
              data: {mailstart_id: this.value, newsletter_id: $('#id_content').children()[0].id.split("_")[$('#id_content').children()[0].id.split("_").length-1]},
              dataType: "html",
              success: (data) ->
                    #alert(data)
                    $('#newsletter_categoryall_id').html(data)
                    $("#newsletter_categoryall_id").children().each (index) ->
                             subcontacts_lists($(this)[0].value, $('#id_content').children()[0].id.split("_")[$('#id_content').children()[0].id.split("_").length-1]) if $(this)[0].selected
              failure: ->
                    alert("Problem")
        }) 

jQuery ->
 $('#newsletter_categoryall_id').children().click ->
       subcontacts_lists(this.value, $('#id_content').children()[0].id.split("_")[$('#id_content').children()[0].id.split("_").length-1])

jQuery ->
  $(document).ready ->
      if $('#newsletter_date_specification')[0].checked 
          $(".date_select_create_on").show()
      else
          $(".date_select_create_on").hide()
  
jQuery ->
 $('#newsletter_date_specification').click ->
      if this.checked
          $(".date_select_create_on").show()
      else
          $(".date_select_create_on").hide()
 
#fin jquery

