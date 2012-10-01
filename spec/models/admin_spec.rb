require 'spec_helper'

describe Admin do
  it { should belong_to :school }

  describe '#name' do
    subject(:admin) { create :admin, first_name: 'Bob', last_name: 'Loblaw' }

    it 'concatinates the first and last names' do
      admin.name.should == 'Bob Loblaw'
    end
  end
end
