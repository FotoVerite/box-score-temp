require 'spec_helper'

describe TeamPlayer do
  it { should belong_to :team }
  it { should belong_to :player }

  it { should validate_uniqueness_of(:team_id).scoped_to(:player_id) }
end
