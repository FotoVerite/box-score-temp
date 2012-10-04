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
      end
    end

    describe "POST 'create'" do
      context 'with invalid data' do
        pending
      end

      context 'with valid data' do
        pending
      end
    end
  end
end
