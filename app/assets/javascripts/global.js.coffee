$ ->
  $('#filter-scores input.date, #game_date')
    .datepicker({
      showOn: 'button',
      buttonImage: '/assets/calendar.png',
      buttonImageOnly: true
    })
  $('.chzn-select').chosen({ disable_search_threshold: 10 })
