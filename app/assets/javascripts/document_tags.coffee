# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

embed_url = ""

initializeSelect2 = (element) ->
  $(element).find('.select2').select2({
    placeholder: "Choose a tag",
    allowClear: true
  })
  $(element).on("select2:selecting", (e) ->
    next_page = parseInt($(e.target).parent().parent().find('input').val()) + 1
    $('embed.preview').attr('src', embed_url + '#page=' + next_page)
    $(e.target).parent().parent().next().find('select').select2('open')
  )

$(document).on 'tag:added', (e, name) ->
  newState = new Option(name, name)
  $("body").find('select.select2').append(newState)

$(document).on 'cocoon:after-insert', (e, element) ->
  initializeSelect2(element)

$(document).on "turbolinks:load", ->
  embed_url = $('embed.preview').attr('src')
  initializeSelect2('body')