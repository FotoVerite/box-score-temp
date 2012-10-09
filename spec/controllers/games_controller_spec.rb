require 'spec_helper'

describe GamesController do
  context 'Authenticated' do
    let(:admin) { create :admin }

    before { sign_in admin }

    describe "GET 'new'" do
      context 'without a team' do
        before { get :new }
        it { should render_template('choose_team')}
      end

      context 'with a team' do
        let(:team) { create :team, school_id: admin.school_id }
        before { get :new, team_id: team.id }

        it { should render_template 'new' }
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
