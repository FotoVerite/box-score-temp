require 'spec_helper'

describe Filter do
  describe '#league_options' do
    before(:each) do
      @filter = Filter.new({})
    end

    context 'with an association selected' do
      before(:each) do
        @assn = create :assn
        @league = create :league, assn_id: @assn.id
        @other_league = create :league
      end

      it 'returns all leagues within the association' do
        @filter.league_options.should == [@league]
      end
    end

    it 'returns all leagues if no association is selected'
  end

  describe '#team_options' do
    it 'returns all teams within the league if a league is selected'
    it 'returns all teams within the association if an association is selected'
    it 'returns all teams if no league or association is selected'
  end
end
