class Sport < ActiveHash::Base

  BASKETBALL_PLAYER_STATS = {
    pos:          { abbr: 'Pos', input_html: { maxlength: 10 } },
    points:       { abbr: 'Pts', input_html: { maxlength: 3 } },
    fg:           { abbr: 'FG', input_html: { maxlength: 2 } },
    fga:          { abbr: 'FGA', input_html: { maxlength: 2 } },
    three_pt_fg:  { abbr: '3pt FG', input_html: { maxlength: 2 } },
    three_pt_fga: { abbr: '3pt FGA', input_html: { maxlength: 2 } },
    ft:           { abbr: 'FT', input_html: { maxlength: 2 } },
    fta:          { abbr: 'FTA', input_html: { maxlength: 2 } },
    rebounds:     { abbr: 'Reb', input_html: { maxlength: 2 } },
    assists:      { abbr: 'A', input_html: { maxlength: 2 } }
  }

  BASEBALL_PLAYER_STATS = {
    pos:          { abbr: 'Pos' },
    at_bats:      { abbr: 'AB' },
    hits:         { abbr: 'H' },
  }

  BASKETBALL_SUMMARY_STATS = {
    period_1_points: { abbr: '1' },
    period_2_points: { abbr: '2' },
    period_3_points: { abbr: '3' },
    period_4_points: { abbr: '4' },
    final:           { abbr: 'F' }
  }

  BASEBALL_SUMMARY_STATS = {
    final:           { abbr: 'R' },
    hits:            { abbr: 'H' },
    errors:          { abbr: 'E' },
  }

  BASEBALL_GAME_STATS = {
    hits:     { abbr: 'H' },
    errors:   { abbr: 'E' }
  }

  SPORT_TYPES = {
    'basketball' => {
      periods:       %w{1 2 3 4},
      player_stats:  BASKETBALL_PLAYER_STATS,
      summary_stats: BASKETBALL_SUMMARY_STATS
    },
    'baseball' => {
      periods:       %w{1 2 3 4 5 6 7},
      game_stats:    BASEBALL_GAME_STATS,
      player_stats:  BASEBALL_PLAYER_STATS,
      summary_stats: BASEBALL_SUMMARY_STATS
    }
  }

  self.data = [
    { id: 'boys-basketball', sport_type: 'basketball', name: "Boys Basketball"},
    { id: 'girls-basketball', sport_type: 'basketball', name: "Girls Basketball"},

    { id: 'girls-softball', sport_type: 'baseball', name: "Girls Softball"},
    { id: 'boys-baseball', sport_type: 'baseball', name: "Boys Baseball"}
  ]

  def sport_type_options
    @_sport_type_options ||= OpenStruct.new(SPORT_TYPES[sport_type.to_s])
  end

  def player_stat_fields
    sport_type_options.player_stats
  end

  def periods
    sport_type_options.periods
  end

  def summary_stats
    sport_type_options.summary_stats
  end

  def game_stats
    sport_type_options.game_stats || {}
  end
end
