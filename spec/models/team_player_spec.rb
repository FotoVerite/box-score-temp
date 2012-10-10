require 'spec_helper'

describe TeamPlayer do
  it { should validate_presence_of :team_id }
  it { should validate_presence_of :player_id }

  it { should validate_uniqueness_of(:team_id).scoped_to(:player_id) }
end
