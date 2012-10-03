require 'spec_helper'

describe GamesController do
  context 'Authenticated' do
    let(:admin) { create :admin }

    before { sign_in admin }

    describe "GET 'new'" do
      before { get :new }
      it { should respond_with :success }
    end
  end
end
