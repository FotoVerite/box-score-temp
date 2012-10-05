class Games
  constructor: (form)->
    form.on 'blur', 'select#game_opponent_id', ->
      $('table.game-stats td.opponent').text($(this).find('option:selected').text())

@BoxScore ||= {}
@BoxScore.Games = Games
