require 'spec_helper'

describe League do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should belong_to :assn }

  it { should have_many :schools }
end
