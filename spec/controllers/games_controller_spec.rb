require 'spec_helper'

describe GamesController do
  context 'Authenticated' do
    let(:admin) { create :admin }

    before { sign_in admin }

    describe "GET 'new'" do
      before do
        get :new
      end

      it { should render_template 'new' }

      it 'assigns teams' do
        assigns(:teams).should_not be_nil
      end

      it 'builds a new game' do
        assigns(:game).team_id.should be_nil
        assigns(:game).opponent_id.should be_nil
        assigns(:game).date.should == Date.current
        assigns(:game).home_away.should == 'home'
      end
    end

    describe "POST 'create'" do
      let(:team) { create :team, school_id: admin.school_id }
      let(:opponent) { create :team, sport: team.sport }
      let(:season) { create :season, sport: team.sport }

      context 'with invalid data' do
        before do
          post :create, team_id: team.id,
                        game: {
                          opponent_id: opponent.id,
                          date: '',
                          site: 'home',
                          home_away: 'home',
                          season_id: season.id
                        }
        end

        it { should render_template 'new' }
      end

      context 'with valid data' do
        before do
          post :create, team_id: team.id,
                        game: {
                          opponent_id: opponent.id,
                          date: Date.today,
                          site: 'home',
                          home_away: 'home',
                          season_id: season.id
                        }
        end

        it { should redirect_to games_path }
      end
    end
  end
end
