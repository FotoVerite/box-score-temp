# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  date         :date
#  opponent_id  :integer
#  home_away    :string(255)
#  team_id      :integer
#  season_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  game_stats   :text
#  published_at :datetime
#  neutral_site :boolean          default(FALSE)
#  admin_id     :integer
#

require 'rails_helper'

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
