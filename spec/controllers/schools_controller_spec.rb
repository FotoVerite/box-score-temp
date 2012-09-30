require 'spec_helper'

describe SchoolsController do
  before { request.env["HTTP_REFERER"] = request.fullpath }

  context 'Authenticated' do
    let(:admin) { create :admin }
    let(:school) { admin.school }
    let(:other_school) { create :school }

    before { sign_in admin }

    describe "GET 'show'" do
      before { get :show, id: school.id }
      it { should respond_with :success }
    end

    describe "GET 'show' with another school id" do
      before { get :show, id: other_school.id }
      it { should respond_with :success }
    end

    describe "GET 'edit'" do
      before { get :edit, id: school.id }
      it { should assign_to(:school).with(school) }
      it { should respond_with :success }
    end

    describe "GET 'edit' with another school id" do
      before { get :edit, id: other_school.id }
      it { should respond_with :unauthorized }
    end

    describe "PUT 'update'" do
      let(:school) { create :school }
      let(:admin) { create :admin, school_id: school.id }

      before { sign_in admin }

      context 'with valid data' do
        before { put :update, id: school.id, school: { name: 'New Name' } }
        it { should redirect_to school_path(school) }
      end

      context 'with invalid data' do
        before { put :update, id: school.id, school: { name: '' } }
        it { should redirect_to edit_school_path(school) }
      end
    end
  end

  context 'Unauthenticated' do
    let(:school) { create :school }

    describe "GET 'show'" do
      before { get :show, id: school.id }
      it { should respond_with :success }
    end

    describe "GET 'edit'" do
      before { get :edit, id: school.id }
      it { should respond_with :unauthorized }
    end
  end
end
