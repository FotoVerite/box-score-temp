require 'spec_helper'

describe Admin do
  it { should belong_to :school }

  #describe '#name' do
    #let(:admin) { create :admin }
    #it { should == "#{admin.first_name} #{admin.last_name}" }
  #end
end
