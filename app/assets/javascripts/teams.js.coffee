class Teams
  constructor: ->
    $('table.roster').on 'click', '.remove', ->
      $(this).closest('tr').remove()

    $('.player-results').on 'click', '.add', =>
      @movePlayerToRoster(this)


  movePlayerToRoster: (link) ->
    link = $(link)
    row = link.closest('tr').remove()
    row.find('a.add')
      .removeClass('add')
      .addClass('remove')
      .text('Remove')
      .prepend('<i class="icon-trash">&nbsp;')
      .end().css('backgroundColor', '#FFFFD0')
    $('table.roster').append row
    $('.player-results').empty()


@BoxScore ||= {}
@BoxScore.Teams = Teams
