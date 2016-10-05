require 'rails_helper'

describe SchoolsController do
  context 'Authenticated' do
    let(:admin) { create :admin }
    let(:school) { admin.school }
    let(:other_school) { create :school }

    before { sign_in admin }

    describe "GET 'show'" do
      before { get :show, params: { id: school.id } }
      it { should respond_with :success }
    end

    describe "GET 'show' with another school id" do
      before { get :show, params: { id: other_school.id } }
      it { should respond_with :success }
    end

    describe "GET 'edit'" do
      before { get :edit, params: { id: school.id } }
      it { expect(assigns(:school)).to eq(school) }
      it { should respond_with :success }
    end

    describe "GET 'edit' with another school id" do
      before { get :edit, params: { id: other_school.id } }
      it { should respond_with :unauthorized }
    end

    describe "PUT 'update'" do
      let(:school) { create :school }
      let(:admin) { create :admin, school_id: school.id }

      before { sign_in admin }

      context 'with valid data' do
        before do
          put :update, params: {
            id: school.id,
            school: { name: 'New Name' }
          }
        end
        it { should render_template :show }
      end

      context 'with invalid data' do
        before { put :update, params: { id: school.id, school: { name: '' } } }
        it { should render_template :edit }
      end
    end
  end

  context 'Unauthenticated' do
    let(:school) { create :school }

    describe "GET 'index'" do
      before { get :index }
      it { should respond_with :redirect }
    end

    describe "GET 'show'" do
      before { get :show, params: { id: school.id } }
      it { should respond_with :redirect }
    end

    describe "GET 'edit'" do
      before { get :edit, params: { id: school.id } }
      it { should respond_with :redirect }
    end
  end
end
