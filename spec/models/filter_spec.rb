require 'spec_helper'

describe Filter do
  describe '#league_options' do
    context 'with an association selected' do
      let(:assn)       { create :assn }
      subject(:filter) { Filter.new assn_id: assn.id }

      before do
        @league = create :league, assn: assn
        create :league
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
        @league2 = create :league
      end

      it 'returns all leagues' do
        filter.league_options.should == [@league1, @league2]
      end
    end
  end

  describe '#team_options' do
    context 'with a league selected' do
      let(:league) { create :league }
      let(:team) { create :team, league: league }
      let(:other_team) { create :team }
      subject(:filter) { Filter.new league: league }

      it 'returns all teams within the league' do
        filter.team_options.should == [team]
      end
    end

    context 'with an association selected' do
      let(:assn) { create :assn }
      let(:league) { create :league, assn: assn }
      let(:team) { create :team, league: league }
      let(:other_team) { create :team }
      subject(:filter) { Filter.new assn: assn }

      it 'returns all teams within the association' do
        filter.team_options.should == [team]
      end
    end
  end
end
