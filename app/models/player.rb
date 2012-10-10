class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates_presence_of :first_name, :last_name

  belongs_to :school

  has_many :player_game_stats
  has_many :team_players
  has_many :teams, through: :team_players

  scope :matching, lambda { |name| where("first_name ilike :name or last_name ilike :name", name: "%#{name}%") }
end
