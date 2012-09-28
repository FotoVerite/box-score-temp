class School < ActiveRecord::Base
  attr_accessible :mascot, :name, :association

  validates_presence_of [:name, :association]

  has_many :teams
end
