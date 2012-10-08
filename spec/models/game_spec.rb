require 'spec_helper'

describe Game do
  it { should validate_presence_of :date }
  it { should validate_presence_of :opponent_id }
  it { should validate_presence_of :site }
  it { should validate_presence_of :home_away }
  it { should validate_presence_of :game_stats }

  it { should belong_to :team }
  it { should belong_to :season }

  it { should serialize :game_stats }
end