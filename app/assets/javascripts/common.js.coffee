# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(document).ready ->
   if ($("#flash").is(':visible'))
     $("#flash").delay(1000).fadeToggle(2000, "linear")

  #$(document).ajaxSend (event, request, settings) ->
  #          "" if typeof(AUTH_TOKEN) == "undefined"
  #          settings.data = settings.data || "";
  #          settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN)
