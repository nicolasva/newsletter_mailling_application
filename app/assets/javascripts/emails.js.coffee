# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#functionlistmail = -> 
#   alert("nicolas")
jQuery ->
  $(document).ready ->
        $("#mails").sortable({
          items: '.mail', 
          #containment:'parent', 
          #axis:'y',
          update: ->
               #alert("nicolas")
              $.ajax({
                  url: "/mailstarts/categoryalls/subcontacts/mails/sort",
                  type: "GET",
                  data: $(this).sortable('serialize'),
                  failure: ->
                        alert("Problem sortable list")
              })
        })

jQuery ->
  $("#email_copy_cut_mail_cut").click ->
    email_id = $(this).parent().parent().parent()[0].id.split("_")[$(this).parent().parent().parent()[0].id.split("_").length-1]
    email_id = "mail_"+email_id
    $.ajax({
       url: "/set_cookies_drag_and_drop_cut_email",
       type: "POST",
       data: { id_li_email_id: email_id }
       failure: ->
            alert("Ajax set cookies mail_id error")
    })

jQuery ->
  $("#email_copy_cut_mail_copy").click ->
    $.ajax({
       url: "/set_cookies_drag_and_drop_cut_email",
       type: "POST",
       data: { id_li_email_id: "copy"}
       failure: ->
            alert("Ajax set cookies copy email_id error")
    })
    #code review

jQuery ->
  $("body").click ->
    if $("#email_copy_cut_mail_copy").length > 0 || $("#email_copy_cut_mail_cut").length > 0
      $.ajax({
         url: "/copy_or_cut_email",
         type: "POST",
         success: (data) ->
              if data == "copy"
                  $('#'+data).show()
              else
                  $('#'+data).hide()
         failure: ->
              alert("Problem")
      })
    # code review
    if $("#mails").length > 0
      $.ajax({
        url: "/verif_copy_or_cut_email",
        type: "POST",
        datatype: "json"
        data: { subcontact_id: $("#subcontact_id").attr("value") },
        success: (data) ->
             if data["result"]
               $('#'+data["email_id"]).remove()
             else
               $('#'+data["email_id"]).show()
      })
    # code review

jQuery ->
   $("#mails").children().each (index) ->
        $(this).draggable({
            revert: true,
        })

jQuery ->
   $("#subcontacts").children().each (index) ->
       $(this).droppable({
          drop: (event, ui) ->
              subcontact_id_source = $('#subcontact_id').attr("value")
              mail_id = ui.draggable.attr('id').split("_")[1]
              subcontact_id = $(event.target).attr("id").split("_")[1]
              ThinBox.open("/choosemails_to_subcontacts/"+mail_id+"/"+subcontact_id+"/"+subcontact_id_source, {'width':'1270px','height':'230px'})
       })
