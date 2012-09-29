class School < ActiveRecord::Base
  attr_accessible :mascot, :name, :assn

  validates_presence_of [:name, :assn]

  has_many :teams
end
