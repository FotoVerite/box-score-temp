require 'spec_helper'

describe TeamsController do
  context 'Authenticated' do
    let(:admin) { create :admin }
    let(:school) { admin.school }

    describe "GET 'index'" do
      let!(:team_01) { create :team, school_id: school.id }
      let!(:team_02) { create :team, school_id: school.id }

      before do
        sign_in admin
        get :index, school_id: school.id
      end

      it "returns the teams that belong to the current admin's school" do
          assigns(:teams).should =~ [team_01, team_02]
      end
    end
  end
end
