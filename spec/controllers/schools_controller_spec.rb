require 'spec_helper'

describe SchoolsController do
  context 'Authenticated' do
    before { sign_in admin }
    let(:admin) { create :admin }
    let(:school) { admin.school }
    let(:other_school) { create :school }

    describe "GET 'show'" do
      before { get :edit, id: school.id }
      it { should assign_to(:school).with(school) }
      it { should respond_with :success }
    end

    describe "GET 'show' with another school id" do
      before { get :edit, id: other_school.id }
      it { should respond_with :found }
    end

    describe "GET 'edit'" do
      before { get :edit, id: school.id }
      it { should assign_to(:school).with(school) }
      it { should respond_with :success }
    end

    describe "GET 'edit' with another school id" do
      before { get :edit, id: other_school.id }
      it { should respond_with :redirect }
    end
  end
end
