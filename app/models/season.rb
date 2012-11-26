class Season < ActiveRecord::Base
  attr_accessible :year, :start_date, :current, :sport_id

  validates_presence_of :year, :start_date

  has_many :teams
  has_many :games

  scope :ordered, order('year DESC')

  def self.by_sport(sport)
    where sport_id: sport.id
  end

  def sport
    Sport.find(sport_id).name
  end

  def to_s
    "#{sport} #{year}"
  end
end
