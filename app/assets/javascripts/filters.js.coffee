class Filters
  constructor: (section, @filter) ->
    form = $(section).find('form#new_filter')
    form
      .on('change', '#filter_assn_id', @assnSelected)
      .on('change', '#filter_league_id', @leagueSelected)


  assnSelected: (e) =>
    selected_option = $(e.currentTarget)
    assn_id = selected_option.val()

    if assn_id.length
      @loadLeagues(assn_id)
      @loadAssnTeams(assn_id)


  leagueSelected: (e) =>
    selected_option = $(e.currentTarget)
    league_id = selected_option.val()

    @loadTeams(league_id) if league_id.length


  loadLeagues: (assn_id) =>
    @updateOptions $('#filter_league_id'), "/assns/#{assn_id}/leagues"


  loadTeams: (league_id) =>
    @updateOptions $('#filter_team_id'), "/leagues/#{league_id}/teams"


  loadAssnTeams: (assn_id) =>
    @updateOptions $('#filter_team_id'), "/assns/#{assn_id}/teams"


  updateOptions: (element, url) =>
    element.html('')

    $.ajax url,
      dataType: 'html',
      data: @filter.filter,
      success: (html) =>
        element
          .html($(html).find('select').html())
          .trigger('chosen:updated')


@BoxScore ||= {}
@BoxScore.Filters = Filters
