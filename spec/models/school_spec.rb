require 'spec_helper'

describe School do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :teams }
  it { should have_many :players }
end
