class Season < ActiveRecord::Base
  attr_accessible :end_date, :year, :start_date, :current, :sport_id

  validates_presence_of :year, :start_date

  has_many :teams
  has_many :games

  def self.by_sport(sport)
    where sport_id: sport.id
  end
end
