# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
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
 
