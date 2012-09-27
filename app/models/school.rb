class School < ActiveRecord::Base
  attr_accessible :city, :mascot, :name, :state, :organization_type

  validates_presence_of [:name, :city, :state, :organization_type]

  has_many :teams
end
