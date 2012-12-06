class Sport < ActiveHash::Base

  class PlayerStatGroup
    attr_reader :id, :name, :player_stat_fields

    def self.default(player_stats)
      new(id: 'default', name: nil, player_stats: player_stats)
    end

    def initialize(options)
      @id = options[:id]
      @name = options[:name]
      @player_stat_fields = options[:player_stats]
    end
  end

  BASKETBALL_PLAYER_STATS = {
    starter:      { abbr: 'Starter', type: :checkbox },
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

  BASKETBALL_SUMMARY_STATS = {
    period_1_points:   { abbr: '1' },
    period_2_points:   { abbr: '2' },
    period_3_points:   { abbr: '3' },
    period_4_points:   { abbr: '4' },
    period_OT1_points: { abbr: 'OT1' },
    period_OT2_points: { abbr: 'OT2' },
    period_OT3_points: { abbr: 'OT3' },
    final:             { abbr: 'F' }
  }

  BASEBALL_BATTING_PLAYER_STATS = {
    pos:          { abbr: 'Pos', total: false, type: :select, collection: %w{P C 1B 2B 3B SS LF CF RF} },
    at_bats:      { abbr: 'AB' },
    hits:         { abbr: 'H' },
    homeruns:     { abbr: 'HR' },
    rbi:          { abbr: 'RBI' },
    runs:         { abbr: 'R' },
    errs:         { abbr: 'E' },
  }

  BASEBALL_PITCHING_PLAYER_STATS = {
    innings:      { abbr: 'IP' },
    hits:         { abbr: 'H' },
    runs:         { abbr: 'R' },
    earned_runs:  { abbr: 'ER' },
    walks:        { abbr: 'BB' },
    strikeouts:   { abbr: 'SO' },
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

  BASEBALL_PLAYER_STAT_GROUPS = [
    PlayerStatGroup.new(id: 'batting', name: 'Batting', player_stats: BASEBALL_BATTING_PLAYER_STATS),
    PlayerStatGroup.new(id: 'pitching', name: 'Pitching', player_stats: BASEBALL_PITCHING_PLAYER_STATS)
  ]

  SPORT_TYPES = {
    'basketball' => {
      periods:       %w{1 2 3 4},
      overtime_periods: %w{OT1 OT2 OT3},
      player_stats:  BASKETBALL_PLAYER_STATS,
      summary_stats: BASKETBALL_SUMMARY_STATS
    },
    'baseball' => {
      score_abbr:         'R', # Runs
      periods:            (1..7).map(&:to_s),
      overtime_periods:   (8..15).map(&:to_s),
      game_stats:         BASEBALL_GAME_STATS,
      summary_stats:      BASEBALL_SUMMARY_STATS,
      player_stat_groups: BASEBALL_PLAYER_STAT_GROUPS
    }
  }

  self.data = [
    { id: 'boys-basketball', sport_type: 'basketball', name: "Boys Basketball", gender: 'boys'},
    { id: 'girls-basketball', sport_type: 'basketball', name: "Girls Basketball", gender: 'girls'},
    { id: 'girls-softball', sport_type: 'baseball', name: "Girls Softball", gender: 'girls'},
    { id: 'boys-baseball', sport_type: 'baseball', name: "Boys Baseball", gender: 'boys'}
  ]

  def sport_type_options
    @_sport_type_options ||= OpenStruct.new(SPORT_TYPES[sport_type.to_s])
  end

  def player_stat_groups
    sport_type_options.player_stat_groups || [PlayerStatGroup.default(sport_type_options.player_stats)]
  end

  def score_abbr
    sport_type_options.score_abbr || 'Final'
  end

  def periods
    sport_type_options.periods
  end

  def overtime_periods
    sport_type_options.overtime_periods
  end

  def summary_stats
    sport_type_options.summary_stats
  end

  def game_stats
    sport_type_options.game_stats || {}
  end
end
