require 'spec_helper'

describe Game do
  it { is_expected.to validate_presence_of :team_id }
  it { is_expected.to validate_presence_of :opponent_id }
  it { is_expected.to validate_presence_of :home_away }

  it { is_expected.to belong_to :team }
  it { is_expected.to belong_to :opponent }
  it { is_expected.to belong_to :season }

  it { is_expected.to have_many :player_game_stats }
  it { is_expected.to have_many :posts }

  it { is_expected.to accept_nested_attributes_for :player_game_stats }

  it { is_expected.to serialize :game_stats }
end
