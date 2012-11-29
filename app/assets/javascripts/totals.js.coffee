class Totals
  constructor: (@section) ->
    @tables = @section.find('tfoot tr.totals').parents('table')
    @tables.each @sumStats


  sumStats: ->
    table = $(this)
    stat_rows = table.find('tbody tr')
    totals_cells = table.find('tfoot tr.totals td.stat')
    totals_cells.each (index, elem) ->
      total = 0
      stat_rows.each ->
        cell = $(this).find("td:eq(#{index})")
        cell.text('0') if cell.text() == ''
        cell_data = cell.text()
        cell_value = parseInt(cell_data)
        total += cell_value
      $(this).text(total) unless isNaN(total)


@BoxScore ||= {}
@BoxScore.Totals = Totals
