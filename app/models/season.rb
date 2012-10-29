class Season < ActiveRecord::Base
  attr_accessible :end_date, :year, :start_date, :sport, :current

  validates_presence_of :year, :start_date

  has_many :teams
  has_many :games

  def year_and_sport
    "#{sport} #{year}"
  end
end
