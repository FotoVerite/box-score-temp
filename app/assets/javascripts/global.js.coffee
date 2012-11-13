$ ->
  $('#filter-scores input.date, #game_date').datepicker()

  $('.chzn-select').chosen
    disable_search_threshold: 10

  $('header.global').on 'click', 'a.account-request', ->
    $('#account-request-form').reveal({ animation: 'none' })

  $('#account-request-form').delegate 'form', 'ajax:complete', (event, data) ->
    $('#account-request-form .content').html data.responseText

  $('.reveal-modal').on 'click', 'a.close-modal', ->
    $('.reveal-modal').trigger('reveal:close')

  $('#scores-nav').on 'click', 'a.disabled', (e) ->
    e.preventDefault()
    $('#coming-soon-message').reveal({ animation: 'none' })
