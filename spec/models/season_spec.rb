require 'spec_helper'

describe Season do
  it { should validate_presence_of :year }
  it { should validate_presence_of :start_date }

  it { should have_many :teams }
  it { should have_many :games }

  describe '.by_sport' do
    let(:sport_01) { create :sport, id: 'boys-basketball' }
    let(:sport_02) { create :sport, id: 'girls-softball' }
    let(:season_01) { create :season, sport_id: sport_01.id }
    let(:season_02) { create :season }

    it 'returns the season with the correct sport id' do
      Season.by_sport(sport_01).should == [season_01]
    end
  end
end
