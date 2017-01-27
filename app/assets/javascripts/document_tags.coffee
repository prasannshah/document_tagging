# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initializeSelect2 = (element) ->
  $(element).find('.select2').select2({
    placeholder: "Choose a tag",
    allowClear: true
  })

$(document).on 'tag:added', (e, name) ->
  newState = new Option(name, name)
  $("body").find('select.select2').append(newState)

$(document).on 'cocoon:after-insert', (e, element) ->
  initializeSelect2(element)

$(document).on "turbolinks:load", ->
  initializeSelect2('body')