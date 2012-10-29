class Filter
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_writer :assn_id, :league_id, :team_id, :sports, :earliest_date, :latest_date

  def initialize(hash)
    if hash
      hash = hash.symbolize_keys
      self.assn_id = hash[:assn_id]
      self.league_id = hash[:league_id]
      self.team_id = hash[:team_id]
      self.earliest_date = hash[:earliest_date]
      self.latest_date = hash[:latest_date]
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
    end
  end

  def team_options
    Team.scoped
  end

  #def team_options
    #if league.present?
      #league.teams
    #elsif assn.present?
      #assn.teams
    #else
      #Team.where('1 = 1')
    #end
  #end

  def games
    Game.where('(team_id in (:teams) or opponent_id in (:teams))
      and (date between (:earliest_date) and (:latest_date))',
      teams: teams, earliest_date: earliest_date, latest_date: latest_date)
  end

  private

  def assn_id
    assn.id if assn
  end

  def assn
    Assn.find_by_id(@assn_id)
  end

  def league_id
    league.id if league
  end

  def league
    League.find_by_id(@league_id)
  end

  def team_id
    team.id if team
  end

  def team
    team_options.find_by_id(@team_id)
  end

  def teams
    if team.present?
      Team.where(id: team_id)
    elsif league.present?
      league.teams
    elsif assn.present?
      assn.teams
    else
      Team.all
    end
  end

  def sports
    if @sports
      [@sports]
    else
      Sport.all.map(&:name)
    end
  end

  def earliest_date
    @earliest_date || 1.year.ago.to_date.stamp("01/31/1999")
  end

  def latest_date
    @latest_date || Date.current.stamp("01/31/1999")
  end
end
