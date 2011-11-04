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
