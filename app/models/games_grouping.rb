class GamesGrouping
  def initialize(filter)
    @games = filter.games
  end

  def each
    # TODO this entire filter concept is broken and should be using simple sql and scopes not this
    # Ordering is nearly impossible, order commands are not working as expected. The entire thing is over complicated what is basic filters
    @games = @games.sort_by {|g| g.sport.name}
    @games.group_by(&:sport).each do |sport, games|
      yield sport, DateGrouping.new(games)
    end
  end
end
