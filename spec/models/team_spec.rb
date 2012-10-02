require 'spec_helper'

describe Team do
  it { should validate_presence_of :sport }
  it { should validate_presence_of :season }
  it { should belong_to :school }
  it { should belong_to :season }
  it { should have_many :player_stats }
  it { should have_and_belong_to_many :players }
end
