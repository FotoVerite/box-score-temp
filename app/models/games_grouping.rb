class GamesGrouping
  def initialize(filter)
    @games = filter.games
  end

  def each
    @games.group_by(&:sport).each do |sport, games|
      yield sport, DateGrouping.new(games)
    end
  end
end
