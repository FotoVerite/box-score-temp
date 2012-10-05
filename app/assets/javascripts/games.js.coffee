class Games
  constructor: (form)->
    $('table.game-stats td.opponent').text($('#game_opponent_id').find('option:selected').text())

    form.on 'blur', 'select#game_opponent_id', ->
      $('table.game-stats td.opponent').text($(this).find('option:selected').text())

@BoxScore ||= {}
@BoxScore.Games = Games
