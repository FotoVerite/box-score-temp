require 'spec_helper'

describe Season do
  it { should validate_presence_of :year }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :sport }

  it { should have_many :teams }
  it { should have_many :games }
end
