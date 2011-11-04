# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(document).ready ->
         $("#categoryalls").sortable({
             items: '.categoryall'
             update: ->
                $.ajax({
                   url: "/mailstarts/categoryalls/sort",
                   type: "GET",
                   data: $(this).sortable('serialize'),
                   failure: ->
                        alert("Problem sortable list")
                })
         })
           
