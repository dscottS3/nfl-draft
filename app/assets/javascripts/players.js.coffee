# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#position_filter').on 'change', ->
    selected = $('#position_filter option').filter(':selected')
    window.location.replace(selected.data('target'))