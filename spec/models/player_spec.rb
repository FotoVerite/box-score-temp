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

require 'rails_helper'

describe Player do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it { should belong_to :school }

  it { should have_many :team_players }
  it { should have_many :player_game_stats }

  it { should have_many(:teams).through(:team_players) }
end
