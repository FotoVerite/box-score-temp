class Team < ActiveRecord::Base
  attr_accessible :level, :school_id, :sport

  validates_presence_of :sport

  belongs_to :school

  has_many :player_stats
end
