class Teams
  constructor: (main) ->
    @main = $(main)
    @main
      .on('click', 'table.roster .remove', @removeRow)
      .on('click', '.player-results .add', @movePlayerToRoster)
      .on('change', 'select#team_sport_id', @sportSelected)


  removeRow: ->
    $(this).closest('tr').remove()

  movePlayerToRoster: ->
    event.preventDefault()
    link = $(this)
    row = link.closest('tr').remove()
    row.find('a.add')
      .removeClass('add')
      .addClass('remove')
      .text('Remove')
      .prepend('<i class="icon-trash">&nbsp;')
      .end().css('backgroundColor', '#FFFFD0')
    $('table.roster').append row
    $('.player-results').empty()


  sportSelected: (e) =>
    sport_select = $(e.currentTarget)
    sport_id = sport_select.val()

    @loadSeasons(sport_id)


  loadSeasons: (sport_id) =>
    season_select = @main.find('select#team_season_id')
    season_select.html('')

    if sport_id.length
      $.getJSON "/sports/#{sport_id}/seasons", (seasons) =>
        season_options = ("<option value=\"#{season.id}\">#{season.year}</option>" for season in seasons).join('')
        season_select
          .html(season_options)
          .trigger('chosen:updated')


@BoxScore ||= {}
@BoxScore.Teams = Teams
