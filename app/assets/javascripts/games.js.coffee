class Games
  constructor: (form)->
    $('table.game-stats td.opponent').text($('#game_opponent_id').find('option:selected').text())

    form.on 'blur', 'select#game_opponent_id', ->
      $('table.game-stats td.opponent').text($(this).find('option:selected').text())

    $('tr.team-game-stats').on 'change', 'input:not(.final-points)', ->
      row = $(this).closest('tr.team-game-stats')
      final_points_field = row.find 'td.final-points input'
      unit_scores = row.find('td:not(.final-points) input').map ->
        $(this).val()
      total_score = 0
      $.each unit_scores, ->
        unless isNaN(parseInt(this))
          total_score += parseInt(this)
        final_points_field.val(total_score)

@BoxScore ||= {}
@BoxScore.Games = Games
