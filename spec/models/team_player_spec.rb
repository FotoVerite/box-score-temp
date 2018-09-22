# == Schema Information
#
# Table name: team_players
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#

require 'rails_helper'

describe TeamPlayer do
  it { should belong_to :team }
  it { should belong_to :player }

  it { should validate_uniqueness_of(:team_id).scoped_to(:player_id) }
end
