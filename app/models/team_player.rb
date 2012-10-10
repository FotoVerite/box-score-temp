class TeamPlayer < ActiveRecord::Base
  validates_presence_of :team_id, :player_id

  validates_uniqueness_of :team_id, scope: :player_id
end
