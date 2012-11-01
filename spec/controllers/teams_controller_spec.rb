require 'spec_helper'

describe TeamsController do
  context 'Unauthenticated' do
    describe "GET 'index'" do
      before { get :index }

      it 'returns a sign in message' do
        response.should redirect_to new_admin_session_path
      end
    end
  end

  context 'Authenticated' do
    let(:school) { create :school }
    let(:other_school) { create :school }
    let(:admin) { create :admin, school: school }
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
      context 'with invalid data' do
        before do
          post :create, team: {}
        end

        it 'renders new template' do
          response.should render_template('new')
        end
      end

      context 'with valid data' do
        let(:league) { create :league }
        let(:season) { create :season }
        let(:player_01) { create :player }
        let(:player_02) { create :player }
        before do
          post :create, team: {
                league_id: league.id,
                school_id: school.id,
                season_id: season.id,
                sport_id: 'boys-basketball'
              }
        end

        it "creates a team for the admin's school" do
          assigns(:team).school_id.should == admin.school_id
        end

        it "creates a team for the provided season" do
          assigns(:team).season_id.should == season.id
        end

        it "redirects to the team edit page" do
          response.should redirect_to edit_team_path(assigns(:team))
        end
      end
    end
  end
end
