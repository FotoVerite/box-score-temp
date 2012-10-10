class TeamPlayer < ActiveRecord::Base
  belongs_to :team
  belongs_to :player

  validates_uniqueness_of :team_id, scope: :player_id
end
