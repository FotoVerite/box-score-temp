require 'spec_helper'

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
          post :create, game: {
                          team_id: team.id,
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
          mock_mailer = mock
          mock_mailer.should_receive(:deliver)
          GameMailer.should_receive(:new_stats).and_return(mock_mailer)

          post :create, game: {
                          team_id: team.id,
                          opponent_id: opponent.id,
                          date: Date.today,
                          site: 'home',
                          home_away: 'home',
                          season_id: season.id
                        }
        end

        it { should redirect_to game_path(assigns(:game)) }
      end
    end

    describe "GET 'edit'" do
      let(:game) { create :game }

      before { get :edit, id: game.id }

      it { should render_template 'edit' }

      it 'retrieves the game by ID' do
        assigns(:game).should_not be_nil
      end

      it 'should populate the fields that have data' do
      end
    end
  end
end
