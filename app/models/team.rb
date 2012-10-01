class Team < ActiveRecord::Base
  attr_accessible :gender, :level, :school_id, :sport

  validates_presence_of [:gender, :sport]

  belongs_to :school
end
