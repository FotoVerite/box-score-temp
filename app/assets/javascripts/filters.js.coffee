class Filters
  constructor: (section) ->
    form = $(section).find('form')
    form.on 'change', '#filter_assn', @assnSelected


  assnSelected: (e) =>
    selected_option = $(e.currentTarget)
    assn_id = selected_option.val()

    @loadLeagues(assn_id)


  loadLeagues: (assn_id) =>
    league_select = $('#filter_league')
    league_select.html('')

    if assn_id.length
      $.getJSON "/assns/#{assn_id}/leagues", (leagues) =>
        league_options = ("<option value=\"#{league.id}\">#{league.name}</option>" for league in leagues).join('')
        league_select
          .html('<option value=\"\"></options>' + league_options)
          .trigger('liszt:updated')


@BoxScore ||= {}
@BoxScore.Filters = Filters
