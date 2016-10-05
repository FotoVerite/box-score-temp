# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  school_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  season_id         :integer
#  league_id         :integer
#  sport_id          :string(255)
#  coach_name        :string(255)
#  coach_email       :string(255)
#  coach_phone       :string(255)
#  competitive_class :string(255)
#

require 'rails_helper'

describe Team do
  it { should validate_presence_of :sport }
  it { should validate_presence_of :season }
  it { should validate_presence_of :school }
  it { should validate_presence_of :league }

  it { should belong_to :school }
  it { should belong_to :league }
  it { should belong_to :season }

  it { should have_many :games }
  it { should have_many :team_players }
  it { should have_many(:players).through(:team_players) }

  describe '#potential_opponents' do
    let(:team_01) { create :team, sport_id: 'girls-softball' }
    let(:team_02) { create :team, sport_id: 'girls-softball' }
    let(:team_03) { create :team, sport_id: 'girls-softball' }

    let(:team_04) { create :team, sport_id: 'girls-softball' }

    it 'lists all teams in the same sport except for the current team' do
      team_04.potential_opponents.should =~ [team_01, team_02]
    end
  end
end
