require 'spec_helper'

describe Player do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should have_and_belong_to_many :teams }
end
