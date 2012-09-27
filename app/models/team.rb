class Team < ActiveRecord::Base
  attr_accessible :gender, :league_id, :level, :school_id, :sport

  validates_presence_of [:gender, :sport]

  belongs_to :league
  belongs_to :school
end
