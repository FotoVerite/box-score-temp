require 'spec_helper'

describe League do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should belong_to :assn }

  it { should have_many :schools }

  describe '.names_with_assns_for_select' do
    pending
    #let(:assn) { create :assn }
    #let(:league_01) { create :league, assn_id: assn.id }
    #let(:league_02) { create :league, assn_id: assn.id }

    #it 'should return an array of arrays containing league, assn, and league id' do
      #League.names_with_assns_for_select.should =~ [ ["#{league_01.name} (#{assn.name})", league_01.id], ["#{league_02.name} (#{assn.name})", league_02.id] ]
    #end
  end
end
