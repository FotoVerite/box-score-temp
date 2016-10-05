# == Schema Information
#
# Table name: player_game_stats
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stats      :text
#  position   :integer
#

require 'rails_helper'

describe PlayerGameStat do
  it { should validate_presence_of :player_id }
  it { should_not validate_presence_of :game_id }

  it { should belong_to :player }
  it { should belong_to :game }

  it { should serialize :stats }
end
