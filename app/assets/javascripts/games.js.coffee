class Games
  constructor: (@form)->

    @form
      .on('change', 'select#game_team_id', @teamSelected)
      .on('change', 'select#game_opponent_id', @opponentSelected)
      .on('change', 'tbody input', @updateGameStats)
      .on('click', 'th.add-period a', @addPeriod)


  opponentSelected: (e) =>
    teamId = $('select#game_team_id').val()
    opponentId = $('select#game_opponent_id').val()

    if opponentId.length
      @loadGameStatsForm teamId, opponentId, (html) =>
        @form.find('#sport_fields').html(html)
    else
      @removeGameStatsForm()


  teamSelected: (e) =>
    teamSelect = $(e.currentTarget)
    teamId = teamSelect.val()

    @loadOpponents(teamId)

    unless teamId.length
      @removeGameStatsForm()


  loadOpponents: (teamId) =>
    opponentSelect = @form.find('select#game_opponent_id')
    opponentSelect.html('')

    if teamId.length
      $.getJSON "/teams/#{teamId}/opponents", (teams) =>
        teamOptions = ("<option value=\"#{team.id}\">#{team.display_name}</option>" for team in teams).join('')
        opponentSelect.html("<option value=\"\"></options>" + teamOptions)


  updateGameStats: (e) =>
    input = $(e.currentTarget)
    row = input.closest('tr')

    unit_scores = row.find('input').map ->
      $(this).val()

    total_score = 0
    $.each unit_scores, ->
      total_score += parseInt(this) unless isNaN(parseInt(this))

    row.find('td.final-points').html(total_score)


  removeGameStatsForm: =>
    @form.find('#sport_fields').empty()


  loadGameStatsForm: (teamId, opponentId, callback) =>
    $.ajax "/games/new.json"
      data:
        team_id: teamId
        opponent_id: opponentId
      success: (json, textStatus, jqXHR) ->
        callback(json.form_content)

  addPeriod: (e) ->
    e.preventDefault()

    table = $(this).closest('table')
    last_period = $(this).parent().prev('th').index()

    new_header_cell = $("<th>#{last_period + 1}</th>")
    $(table.find('th').get(last_period)).after(new_header_cell)

    score_rows = table.find('tr.period-scores')
    score_rows.each ->
      last_score_cell = $(this).find('td').get(last_period)
      last_score_input_name = $(last_score_cell).find('input').attr('name')
      new_score_input_name = last_score_input_name.replace("[periods][#{last_period}]", "[periods][#{last_period + 1 }]")
      new_cell = $("<td class='#{last_period + 1}'><input name='#{new_score_input_name}' type='text' /></td>")
      $(last_score_cell).after new_cell


@BoxScore ||= {}
@BoxScore.Games = Games
