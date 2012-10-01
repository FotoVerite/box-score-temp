require 'spec_helper'

describe School do
  it { should validate_presence_of :name }
  it { should validate_presence_of :assn }
  it { should have_many :teams }

  describe '.assns' do
    before do
      create :school, assn: 'AAA'
      create :school, assn: 'BBB'
    end
    its(:assns) { should =~ ['AAA', 'BBB'] }
  end
end
