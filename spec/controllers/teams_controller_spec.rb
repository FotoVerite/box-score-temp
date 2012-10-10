require 'spec_helper'

describe TeamsController do
  context 'Authenticated' do
    let(:admin) { create :admin }
    let(:school) { admin.school }
    let(:other_school) { create :school }
    let!(:team_01) { create :team, school: school }
    let!(:team_02) { create :team, school: school }

    before { sign_in admin }

    describe "GET 'index'" do
      before { get :index, school_id: school.id }

      it "returns the teams that belong to the current admin's school" do
          assigns(:teams).should =~ [team_01, team_02]
      end
    end

    describe "GET 'new'" do
      before { get :new }
      it 'should render a page' do
        response.should be_ok
      end
    end

    describe "POST 'create'" do
      context 'with valid data' do
        let(:season) { create :season }
        let(:player_01) { create :player }
        let(:player_02) { create :player }
        before { post :create, team: { season_id: season.id, sport: season.sport } }

        it "creates a team for the admin's school" do
          assigns(:team).school_id.should == admin.school_id
        end

        it "creates a team for the provided season" do
          assigns(:team).season_id.should == season.id
        end

        it "creates a team for the provided sport" do
          assigns(:team).sport.should == season.sport
        end

        it "redirects to the show page" do
          response.should redirect_to edit_team_path(assigns(:team))
        end
      end
    end
  end
end
