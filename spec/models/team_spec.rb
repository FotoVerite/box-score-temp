require 'spec_helper'

describe Team do
  it { should validate_presence_of :sport }
  it { should validate_presence_of :season }
  it { should belong_to :school }
  it { should belong_to :season }
  it { should have_many :player_stats }
  it { should have_and_belong_to_many :players }

  describe '#team_with_school_name' do
    let(:team) { create :team }
    subject(:team_with_school_name) { team.team_with_school_name }

    pending
    #it { should == "fart" }
  end
end
