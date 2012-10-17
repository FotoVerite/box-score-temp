require 'spec_helper'

describe Game do
  it { should validate_presence_of :date }
  it { should validate_presence_of :team_id }
  it { should validate_presence_of :opponent_id }
  it { should validate_presence_of :site }
  it { should validate_presence_of :home_away }

  it { should belong_to :team }
  it { should belong_to :opponent }
  it { should belong_to :season }

  it { should have_many :player_game_stats }

  it { should accept_nested_attributes_for :player_game_stats }

  it { should serialize :game_stats }

  describe '#team_player_stats' do
    let(:game) { create :game }

    let(:team_player) { create :player }
    let(:opponent_player) { create :player }

    let(:team_player_stat) { create :player_game_stat, player: team_player }
    let(:opponent_player_stat) { create :player_game_stat, player: opponent_player }

    it 'returns only stats that belong to the host team' do
      game.team_player_stats.should include team_player_stat
      game.team_player_stats.should_not include opponent_player_stat
    end
  end
end
