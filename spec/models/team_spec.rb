require 'spec_helper'

describe Team do
  it { should validate_presence_of :sport }
  it { should validate_presence_of :season }
  it { should belong_to :school }
  it { should belong_to :season }
  it { should have_many :player_stats }
  it { should have_many :games }
  it { should have_and_belong_to_many :players }

  describe '#potential_opponents' do
    let(:team_01) { create :team, sport: 'Girls Softball' }
    let(:team_02) { create :team, sport: 'Girls Softball' }
    let(:team_03) { create :team, sport: 'Girls Basketball' }

    let(:team_04) { create :team, sport: 'Girls Softball' }

    it 'lists all teams in the same sport except for the current team' do
      team_04.potential_opponents.should =~ [team_01, team_02]
    end
  end
end
