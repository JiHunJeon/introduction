# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  right_height = $("#right").height()
  left_height = $("#left").height()

  height_flag =  right_height unless left_height is true

  if height_flag
    if right_height > left_height
      $("#left").height(right_height)
    else if left_height > right_height
      $("#right").height(left_height)
  else
  event.preventDefault()

 $(document).on 'click', 'form .add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')

  $(this).before($(this).data('fields').replace(regexp, time))
  right_height = $("#right").height()
  left_height = $("#left").height()

  height_flag =  right_height unless left_height is true

  if height_flag
    if right_height > left_height
      $("#left").height(right_height)
    else if left_height > right_height
      $("#right").height(left_height)
  else
  event.preventDefault()



$(document).ready ->
  right_height = $("#right").height()
  left_height = $("#left").height()

  height_flag =  right_height unless left_height is true

  if height_flag
    if right_height > left_height
      $("#left").height(right_height)
    else if left_height > right_height
      $("#right").height(left_height)
  else



reSize = () ->
  right_height = $("#right").height()
  left_height = $("#left").height()

  height_flag =  right_height unless left_height is true

  if height_flag
    if right_height > left_height
      $("#left").height(right_height)
    else if left_height > right_height
      $("#right").height(left_height)
  else