require 'spec_helper'

describe PlayerGameStat do
  it { should belong_to :player }
  it { should belong_to :game }
end
