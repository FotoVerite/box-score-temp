# == Schema Information
#
# Table name: team_players
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeamPlayer < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :team
  belongs_to :player

  validates_uniqueness_of :team_id, scope: :player_id
end
