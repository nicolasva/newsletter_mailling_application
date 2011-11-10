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

jQuery ->   
   $("#categoryalls").children().each (index) ->
     $(this).droppable({
        drop: (event, ui) ->
            categoryall_id_source = $('#categoryall_id').attr("value")
            subcontact_id = ui.draggable.attr('id').split("_")[1]
            categoryall_id = $(event.target).attr("id").split("_")[1]
            ThinBox.open("/choosesubcontacts_to_categoryalls/"+subcontact_id+"/"+categoryall_id+"/"+categoryall_id_source, {'width':'1270px','height':'230px'})
     })

list_menu = (choose_ul_id) ->
            compteur = 0
            params_id_menu = ""
            longeur_ul_li = $('#'+choose_ul_id).children().length
            $('#'+choose_ul_id).children().each (index) ->
                                                   id = $(this).attr("id").split('_')[1]
                                                   params_id_menu += choose_ul_id+"[]="+id
                                                   compteur = compteur + 1
                                                   if compteur < longeur_ul_li
                                                          params_id_menu += "&"
            params_id_menu

recup_id_source = (menu_ul) ->
            hash_id_source = {'subcontacts': 'categoryall_id', 'mails': 'mail_id'}
            hash_id_source[menu_ul]

remove_ul_subcontact = (menu_ul,menu_ul_li) ->
            hash_li = {'subcontacts': 'subcontact', 'mails': 'mail'}
            $('#'+hash_li[menu_ul]+'_'+menu_ul_li).remove()
           
periodical_updater_ul = (menu_ul) ->
    if $('#'+menu_ul).length > 0
        source_value = $('#'+recup_id_source(menu_ul)).attr("value") 
        source_value = "no_id" if !source_value
        $.PeriodicalUpdater({
             url: "/"+menu_ul+"remove?"+list_menu(menu_ul)+"&"+recup_id_source(menu_ul)+"_source="+source_value,
             method: 'GET',
             dataType: 'json',
             maxTimeout: 6000,
        },
             (data) ->
                  remove_ul_subcontact menu_ul,menu_ul_li for menu_ul_li in data.split("-")
                  periodical_updater_ul menu_ul for menu_ul in ["subcontacts", "mails"]

        )

jQuery ->
  $(document).ready ->
       periodical_updater_ul menu_ul for menu_ul in ["subcontacts", "mails"]
