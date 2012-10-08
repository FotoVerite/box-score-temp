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
        it { should render_template('new')}

        describe "POST 'create'" do
          let(:opponent) { create :team }
          let(:season) { create :season }

          context 'with invalid data' do
            before do
              post :create, team_id: team.id,
                            game: {
                              opponent_id: opponent.id,
                              date: '',
                              site: 'home',
                              home_away: 'home',
                              season_id: season.id,
                              game_stats: {
                                q1_points: rand(20).to_s,
                                q2_points: rand(20).to_s,
                                q3_points: rand(20).to_s,
                                q4_points: rand(20).to_s,
                                final_points: rand(20).to_s,
                                opponent_q1_points: rand(20).to_s,
                                opponent_q2_points: rand(20).to_s,
                                opponent_q3_points: rand(20).to_s,
                                opponent_q4_points: rand(20).to_s,
                                opponent_final_points: rand(20).to_s
                              }
                            }
            end

            it { should render_template 'edit' }
          end

          context 'with valid data' do
            before do
              post :create, team_id: team.id,
                            game: {
                              opponent_id: opponent.id,
                              date: Date.today,
                              site: 'home',
                              home_away: 'home',
                              season_id: season.id,
                              game_stats: {
                                q1_points: rand(20).to_s,
                                q2_points: rand(20).to_s,
                                q3_points: rand(20).to_s,
                                q4_points: rand(20).to_s,
                                final_points: rand(20).to_s,
                                opponent_q1_points: rand(20).to_s,
                                opponent_q2_points: rand(20).to_s,
                                opponent_q3_points: rand(20).to_s,
                                opponent_q4_points: rand(20).to_s,
                                opponent_final_points: rand(20).to_s
                              }
                            }
            end

            it { should render_template 'index' }
          end
        end
      end
    end
  end
end
