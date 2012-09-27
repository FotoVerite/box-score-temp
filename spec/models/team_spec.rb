require 'spec_helper'

describe Team do
  it { should validate_presence_of :gender }
  it { should validate_presence_of :sport }
  it { should belong_to :league }
  it { should belong_to :school }
end
