class Season < ActiveRecord::Base
  attr_accessible :end_date, :year, :start_date, :sport

  validates_presence_of :year, :start_date, :sport

  has_many :teams
  has_many :games
end
