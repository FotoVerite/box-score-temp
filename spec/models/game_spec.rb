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

  describe '#player_stats' do
    let(:game) { create :game }
    let(:team) { create :team }
    let(:player_01) { create :player }
    let(:player_02) { create :player }
    let(:team_player_01) { create :team_player, team: team.id, player: player_01 }

    it 'returns player stats for the selected team' do
      game.player_stats(team).players.should include player_01
      game.player_stats(team).players.should_not include player_02
    end
  end
end
