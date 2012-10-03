require 'spec_helper'

describe School do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should belong_to :league }
  it { should have_many :teams }
end
