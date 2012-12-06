class Totals
  constructor: (@section) ->
    @tables = @section.find('tfoot tr.totals').parents('table')
    @tables.each @sumStats


  sumStats: ->
    table = $(this)
    stat_rows = table.find('tbody tr')
    totals_cells = table.find('tfoot tr.totals td')

    totals_cells.each (index, elem) ->
      if $(elem).hasClass('stat')
        total = 0
        stat_rows.each ->
          cell = $(this).find("td:eq(#{index})")
          cell.text('0') if $.trim(cell.text()) is ''
          total += parseInt(cell.text())

        $(this).text(total) unless isNaN(total)


@BoxScore ||= {}
@BoxScore.Totals = Totals
