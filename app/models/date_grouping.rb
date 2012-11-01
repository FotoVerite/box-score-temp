class DateGrouping
  def initialize(games)
    @games = games
  end

  def each
    @games.group_by(&:date).sort_by(&:first).reverse.each do |date, games|
      yield date, games
    end
  end
end
