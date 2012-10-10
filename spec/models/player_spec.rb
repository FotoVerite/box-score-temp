require 'spec_helper'

describe Player do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it { should belong_to :school }

  it { should have_many :team_players }
  it { should have_many :player_game_stats }

  it { should have_many(:teams).through(:team_players) }
end
