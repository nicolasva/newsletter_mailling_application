# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
   $(document).ready ->
       $("#subcontacts").sortable({
           items: '.subcontact'
           update: ->
              $.ajax({
                 url: "/mailstarts/categoryalls/subcontacts/sort",
                 type: "GET",
                 data: $(this).sortable('serialize')
                 failure: ->
                      alert("Problem sortable list")
              })
       })

jQuery ->
   $("#subcontacts").children().each (index) ->
       $(this).draggable({
           revert: true,
       })
   
   $("#categoryalls").children().each (index) ->
     $(this).droppable({
        drop: (event, ui) ->
        #$("#id_content").children().each(function(index) { $(this).children().each(function(index){ $(this).children().each(function(index) { $(this).children().each(function(index) { console.log($(this)[0].id)}) }) }) })
            categoryall_id_source = $('#categoryall_id').attr("value")
            #cpt = 0
            #$("#id_content").children().each (index) ->
            #              $(this).children().each (index) ->
            #                   $(this).children().each (index) ->
            #                         $(this).children().each (index) ->
                                           #alert(index)
            #                               if $(this)[0].id.length > 0 && index == 4 && cpt == 0
            #                                          categoryall_id_source = $(this)[0].id.split("_")[6]
            #                                          cpt = index
                  
            #alert(categoryall_id_source) 
            subcontact_id = ui.draggable.attr('id').split("_")[1]
            categoryall_id = $(event.target).attr("id").split("_")[1]
            #$.ajax({
            #      url: "/dragdropsubcontacts_to_categoryalls",
            #      type: "POST",
            #      data: {subcontact_id: subcontact_id, categoryall_id: categoryall_id, categoryall_id_source: categoryall_id_source},
            #      success: (data) ->
            #             $(this).remove()
            #})
            ThinBox.open("/choosesubcontacts_to_categoryalls/"+subcontact_id+"/"+categoryall_id+"/"+categoryall_id_source)
     })
