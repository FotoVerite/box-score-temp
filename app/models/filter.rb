class Filter
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_reader :params
  attr_writer :assn_id, :league_id, :team_id, :sport_id, :earliest_date, :latest_date

  def initialize(hash)
    if hash
      hash = hash.symbolize_keys
      @params = hash
      self.sport_id = hash[:sport_id]
      self.assn_id = hash[:assn_id]
      self.league_id = hash[:league_id]
      self.team_id = hash[:team_id]
      self.earliest_date = hash[:earliest_date].presence
      self.latest_date = hash[:latest_date].presence
    end
  end

  def persisted?
    false
  end

  def assn_options
    Assn.ordered
  end

  def league_options
    if assn.present?
      assn.leagues
    else
      League.scoped
    end.ordered
  end

  def gendered_league_options
    league_options.map do |league|
      league.genders.map { |gender| GenderedLeague.new(league, gender) }
    end.flatten
  end

  def team_options
    teams.includes(:school).ordered
  end

  def games
    filtered_teams = teams

    scope = Game.published.latest.includes(
        { team: :school },
        { opponent: :school }
      )

    scope = scope.where('team_id in (:teams) or opponent_id in (:teams)', teams: filtered_teams)
    scope = scope.where('date between :earliest and :latest', earliest: earliest_date, latest: latest_date)

    scope
  end

  def sport
    Sport.find(@sport_id) if @sport_id.present?
  end

  private

  def assn_id
    assn.id if assn
  end

  def assn
    Assn.find(@assn_id) if @assn_id.present?
  end

  def league_id
    league.id if league
  end

  def league
    League.find(@league_id) if @league_id.present?
  end

  def team_id
    team.id if team
  end

  def team
    Team.find(@team_id) if @team_id.present?
  end

  def teams
    scope = if team.present?
        Team.where(id: team_id)
      elsif league.present?
        league.teams
      elsif assn.present?
        assn.teams
      else
        Team.scoped
      end

    scope = scope.where(sport_id: @sport_id) if @sport_id.present?
    scope
  end

  def sports
    if @sports
      [@sports]
    else
      Sport.all.map(&:name)
    end
  end

  def earliest_date
    @earliest_date || 1.week.ago.to_date.stamp("01/31/1999")
  end

  def latest_date
    @latest_date || Date.current.stamp("01/31/1999")
  end
end
