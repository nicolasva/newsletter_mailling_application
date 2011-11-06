# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(document).ready ->
        $("#mailstarts").sortable({
          items: '.mailstart', 
          #containment:'parent', 
          #axis:'y',
          update: ->
               #alert("nicolas")
              $.ajax({
                  url: "/mailstarts/sort",
                  type: "GET",
                  data: 'authenticity_token='+AUTH_TOKEN+'&'+$(this).sortable('serialize'),
                  failure: ->
                        alert("Problem sortable list")
              })
        })
