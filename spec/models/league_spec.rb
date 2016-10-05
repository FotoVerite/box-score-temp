# == Schema Information
#
# Table name: leagues
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  assn_id        :integer
#  classification :string(255)
#

require 'rails_helper'

describe League do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should belong_to :assn }
  it { should have_many :teams }

  describe '#name_with_assn' do
    let(:assn) { build :assn, name: 'NYSCLSL' }
    subject(:league) { build :league, assn: assn, name: 'Brooklyn AA' }

    it 'returns the league and assn name' do
      league.name_with_assn.should == 'Brooklyn AA (NYSCLSL)'
    end
  end

  describe '.names_with_assns_for_select' do
    let(:assn) { create :assn, name: 'NYSCLSL' }
    let!(:league_01) { create :league, assn_id: assn.id, name: 'Brooklyn AA' }
    let!(:league_02) { create :league, assn_id: assn.id, name: 'Queens AA' }

    it 'returns an array of arrays containing league, assn, and league id' do

      expect(League.names_with_assns_for_select).to eq [
        ['Brooklyn AA (NYSCLSL)', league_01.id],
        ['Queens AA (NYSCLSL)', league_02.id]
      ]
    end
  end
end
