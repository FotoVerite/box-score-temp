require 'spec_helper'

describe TeamsController do
  context 'Authenticated' do
    let(:admin) { create :admin }
    let(:school) { admin.school }
    before do
      5.times { create :team, school_id: school.id }
      sign_in admin
    end

    describe "GET 'index'" do
      before { get :index, school_id: school.id }
      it "lists only teams that belong to the current admin's school" do

      end
    end
  end
end
