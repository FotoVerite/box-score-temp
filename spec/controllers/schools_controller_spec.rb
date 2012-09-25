require 'spec_helper'

describe SchoolsController do
  context 'Authenticated' do
    before { sign_in admin }
    let(:admin) { create :admin, school_id: 8 }
    let(:school) { create :school, id: 8 }

    describe "GET 'show'" do
      subject { get :show }
      it { should respond_with(:success) }
    end
  end

  context 'Unauthenticated' do
    before { sign_in admin }
    let(:admin) { create :admin, school_id: 8 }
    let(:school) { create :school, id: 12 }

    describe "GET 'show'" do
      subject { get :show }
      it { should respond_with(:missing) }
    end
  end
end
