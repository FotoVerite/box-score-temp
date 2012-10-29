class TeamStats
  def initialize(hash)
    @hash = hash || { periods: {} }
  end

  def periods
    @hash['periods'].keys.map(&:to_i).max
  end

  def points(period)
    p = @hash['periods'][period.to_s]
    p.to_i unless p.blank?
  end

  def final
    @hash['periods'].values.map(&:to_i).sum
  end

  def hits
    @hash['hits'].to_i
  end

  def errors
    @hash['errors'].to_i
  end

  def method_missing(name, *args)
    case name
    when /^period_(\d+)_points$/
      points($1)
    else
      super(name, *args)
    end
  end
end
