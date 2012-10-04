require 'spec_helper'

describe Game do
  it { should validate_presence_of :date }
  it { should validate_presence_of :sport }
  it { should validate_presence_of :opponent_id }
  it { should validate_presence_of :site }
  it { should validate_presence_of :home_away }

  it { should belong_to :team }
  it { should belong_to :school }
  it { should belong_to :season }
end
