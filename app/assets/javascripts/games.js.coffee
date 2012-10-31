class Games
  constructor: (@form) ->
    @form
      .on('change', 'select#game_team_id', @teamSelected)
      .on('change', 'select#game_opponent_id', @opponentSelected)
      .on('change', 'tbody input', @updateGameStats)
      .on('click', 'th.add-period a', @addPeriod)
      .on('change', 'select.player', @playerSelected)


  playerSelected: (e) =>
    select = $(e.currentTarget)
    row = select.closest('tr')
    tbody = row.closest('tbody')

    if row[0] is tbody.find('tr:last-child')[0]
      newIndex = new Date().getTime()
      clone = row.clone()

      row.html(row.html().replace(/CHILD/g, newIndex))
      row.find('select.player').val(select.val())

      tbody.append(clone)


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
        opponentSelect
          .html("<option value=\"\"></options>" + teamOptions)
          .trigger('liszt:updated')

  updateGameStats: (e) =>
    input = $(e.currentTarget)
    row = input.closest('tr')

    unit_scores = row.find('td.period input').map ->
      $(this).val()

    total_score = 0
    $.each unit_scores, ->
      total_score += parseInt(this) unless isNaN(parseInt(this))

    row.find('td.final-points').html(total_score)


  removeGameStatsForm: =>
    @form.find('#sport_fields').empty()


  loadGameStatsForm: (teamId, opponentId, callback) =>
    $.ajax "/game_stats/new"
      data:
        team_id: teamId
        opponent_id: opponentId
      success: (form_content, textStatus, jqXHR) ->
        callback(form_content)

  addPeriod: (e) ->
    e.preventDefault()

    table = $(this).closest('table')
    last_period = $(this).parent().prev('th').index()

    new_header_cell = $("<th>#{last_period + 1}</th>")
    $(table.find('th').get(last_period)).after(new_header_cell)

    table.find('tbody tr').each ->
      last_score_cell       = $(this).find('td.period').get(last_period - 1)
      last_score_input_name = $(last_score_cell).find('input').attr('name')
      new_score_input_name  = last_score_input_name.replace("[periods][#{last_period}]", "[periods][#{last_period + 1 }]")
      new_cell = $("<td class='period'><input name='#{new_score_input_name}' type='text' /></td>")
      $(last_score_cell).after new_cell


@BoxScore ||= {}
@BoxScore.Games = Games
