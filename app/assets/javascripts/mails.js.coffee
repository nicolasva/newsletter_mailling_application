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
              ThinBox.open("/choosemails_to_subcontacts/"+mail_id+"/"+subcontact_id+"/"+subcontact_id_source)
       })
