class School < ActiveRecord::Base
  attr_accessible :mascot, :name

  validates :name, presence: true, uniqueness: true

  has_many :teams
  has_many :players
  has_many :admins
end
