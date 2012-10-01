require 'spec_helper'

describe PlayerStat do
  it { should belong_to :player }
  it { should belong_to :team }
  it { should belong_to :game }
end
