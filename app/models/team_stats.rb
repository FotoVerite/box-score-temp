class TeamStats
  def initialize(hash)
    @hash = hash || { periods: {} }
  end

  def periods
    @hash[:periods].keys.map(&:to_i).max
  end

  def points(period)
    @hash[:periods][period].to_i
  end

  def final
    @hash[:periods].values.map(&:to_i).sum
  end

  def hits
    @hash[:hits].to_i
  end

  def errors
    @hash[:errors].to_i
  end
end
