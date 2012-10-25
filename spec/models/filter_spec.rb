require 'spec_helper'

describe Filter do
  describe '#league_options' do

    context 'with an association selected' do
      let(:assn)       { create :assn }
      subject(:filter) { Filter.new(assn_id: assn.id) }

      before do
        @league = create :league, assn: assn
        create :league # not in the same assn
      end

      it 'returns only leagues within the association' do
        filter.league_options.should == [@league]
      end
    end

    context 'with no association selected' do
      let(:assn)       { create :assn }
      subject(:filter) { Filter.new({}) }

      before do
        @league1 = create :league, assn: assn
        @league2 = create :league # not in the same assn
      end

      it 'returns all leagues' do
        filter.league_options.should == [@league1, @league2]
      end
    end
  end

  describe '#team_options' do
    it 'returns all teams within the league if a league is selected'
    it 'returns all teams within the association if an association is selected'
    it 'returns all teams if no league or association is selected'
  end
end
