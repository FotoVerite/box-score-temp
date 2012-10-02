require 'spec_helper'

describe Team do
  it { should validate_presence_of :sport }
  it { should belong_to :school }
  it { should belong_to :season }
  it { should have_many :player_stats }
end
