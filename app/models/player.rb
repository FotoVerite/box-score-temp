# == Schema Information
#
# Table name: players
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  last_name      :string(255)
#  school_id      :integer
#  middle_initial :string(255)
#

class Player < ActiveRecord::Base
  # attr_accessor :first_name, :last_name, :middle_initial

  validates_presence_of :first_name, :last_name

  belongs_to :school

  has_many :player_game_stats
  has_many :team_players
  has_many :teams, through: :team_players

  scope :matching, ->(name) { where('first_name ilike :name or last_name ilike :name', name: "%#{name}%") }

  def name
    [last_name, first_name].reject(&:blank?).join(', ')
  end
end
