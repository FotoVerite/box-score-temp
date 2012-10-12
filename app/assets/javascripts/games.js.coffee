class Games
  constructor: (@form)->

    @form
      .on('change', 'select#game_team_id', @teamSelected)
      .on('change', 'select#game_opponent_id', @opponentSelected)
      .on('change', 'tbody input', @updateGameStats)


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


@BoxScore ||= {}
@BoxScore.Games = Games
