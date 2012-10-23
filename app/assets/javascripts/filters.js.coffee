class Filters
  constructor: (section) ->
    form = $(section).find('form#new_filter')
    form
      .on('change', '#filter_assn_id', @assnSelected)
      .on('change', '#filter_league_id', @leagueSelected)


  assnSelected: (e) =>
    selected_option = $(e.currentTarget)
    assn_id = selected_option.val()

    @loadLeagues(assn_id)


  leagueSelected: (e) =>
    selected_option = $(e.currentTarget)
    league_id = selected_option.val()

    @loadTeams(league_id)


  loadLeagues: (assn_id) =>
    league_select = $('#filter_league_id')
    league_select.html('')

    if assn_id.length
      $.getJSON "/assns/#{assn_id}/leagues", (leagues) =>
        league_options = ("<option value=\"#{league.id}\">#{league.name}</option>" for league in leagues).join('')
        league_select
          .html('<option value=\"\"></options>' + league_options)
          .trigger('liszt:updated')


  loadTeams: (league_id) =>
    team_select = $('#filter_team_id')
    team_select.html('')

    if league_id.length
      $.getJSON "/leagues/#{league_id}/teams", (teams) =>
        team_options = ("<option value=\"#{team.id}\">#{team.display_name}</option>" for team in teams).join('')
        team_select
          .html('<option value=\"\"></options>' + team_options)
          .trigger('liszt:updated')


@BoxScore ||= {}
@BoxScore.Filters = Filters
