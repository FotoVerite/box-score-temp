class School < ActiveRecord::Base
  attr_accessible :mascot, :name, :league_id

  validates :name, presence: true, uniqueness: true

  belongs_to :league

  has_many :teams
  has_many :players
end
