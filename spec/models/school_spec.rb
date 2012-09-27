require 'spec_helper'

describe School do
  it { should validate_presence_of :name }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :organization_type }
  it { should have_many :teams }
end
