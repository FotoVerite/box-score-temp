require 'spec_helper'

describe PlayerGameStat do
  it { should validate_presence_of :player_id }
  it { should_not validate_presence_of :game_id }

  it { should belong_to :player }
  it { should belong_to :game }

  it { should serialize :stats }
end
