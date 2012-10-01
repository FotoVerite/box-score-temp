require 'spec_helper'

describe School do
  it { should validate_presence_of :name }
  it { should belong_to :assn }
  it { should belong_to :league }
  it { should have_many :teams }

  #describe '#assn_ids' do
    #let(:assn_01) { create :assn }
    #let(:assn_02) { create :assn }
    #before do
      #create :school, assn: assn_01
      #create :school, assn: assn_02
    #end
    #its(:assn_ids) { should =~ [assn_01.id, assn_02.id] }
  #end

  #describe '#league_ids' do
    #let(:league_01) { create :league }
    #let(:league_02) { create :league }
    #before do
      #create :school, league_id: league_01.id
      #create :school, league_id: league_02.id
    #end
    #its(:league_ids) { should =~ [league_01.id, league_02.id] }
  #end
end
