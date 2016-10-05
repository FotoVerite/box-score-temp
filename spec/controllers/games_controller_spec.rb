require 'rails_helper'

describe GamesController do
  context 'Authenticated' do
    let(:admin) { create :admin }

    before { sign_in admin }

    describe "GET 'new'" do
      before { get :new }

      it { should render_template 'new' }

      it 'builds a new game' do
        assigns(:game).team_id.should be_nil
        assigns(:game).opponent_id.should be_nil
        assigns(:game).home_away.should == 'home'
      end
    end

    describe "POST 'create'" do
      let(:team) { create :team, school_id: admin.school_id }
      let(:opponent) { create :team, sport_id: team.sport_id }
      let(:season) { create :season, sport_id: team.sport_id }

      context 'with invalid data' do
        before do
          post :create, params: {
            game: {
              team_id: team.id,
              opponent_id: opponent.id,
              date: '',
              home_away: 'home',
              season_id: season.id
            }
          }
        end

        it { should render_template 'new' }
      end

      context 'with valid data' do
        before do
          post :create, params: {
            game: {
              team_id: team.id,
              opponent_id: opponent.id,
              date: Date.today,
              home_away: 'home',
              season_id: season.id
            }
          }
        end

        it { should redirect_to game_path(assigns(:game)) }
      end
    end

    describe "GET 'edit'" do
      let(:game) { create :game }

      before { get :edit, params: { id: game.id } }

      it { should render_template 'edit' }

      it 'retrieves the game by ID' do
        assigns(:game).should_not be_nil
      end

      it 'should populate the fields that have data' do
      end
    end

    describe "PUT 'update'" do
      let(:game) { create :game }
      let(:a_week_ago) { 8.weeks.ago.to_date }
      let(:mailer_method) { :new_stats }
      let(:valid_data) { { id: game.id, game: { date: a_week_ago } } }

      it 'updates the content' do
        post :update, params: valid_data

        game.reload.date.should == a_week_ago
      end
    end
  end
end
