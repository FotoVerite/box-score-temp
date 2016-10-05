class GameStats
  def initialize(hash)
    @hash = hash || {}
  end

  def team_stats(team_id)
    team_id = team_id.id if team_id.is_a? Team
    TeamStats.new(@hash[team_id.to_s])
  end

  def team_ids
    @hash.keys
  end

  def periods
    team_ids.map { |team_id| team_stats(team_id).periods }.flatten.uniq
  end
end
