class TeamStats
  def initialize(hash)
    @hash = hash || { periods: {} }
  end

  def periods
    @hash[:periods].keys.map(&:to_i).max
  end

  def points(period)
    @hash[:periods][period]
  end

  def final
    @hash[:periods].values.map(&:to_i).sum
  end
end