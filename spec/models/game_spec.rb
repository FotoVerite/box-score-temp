require 'spec_helper'

describe Game do
  it { should validate_presence_of :date }
  it { should validate_presence_of :team_id }
  it { should validate_presence_of :opponent_id }
  it { should validate_presence_of :home_away }

  it { should belong_to :team }
  it { should belong_to :opponent }
  it { should belong_to :season }

  it { should have_many :player_game_stats }

  it { should accept_nested_attributes_for :player_game_stats }

  it { should serialize :game_stats }
end
