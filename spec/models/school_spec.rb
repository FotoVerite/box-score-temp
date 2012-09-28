require 'spec_helper'

describe School do
  it { should validate_presence_of :name }
  it { should validate_presence_of :association }
  it { should have_many :teams }
end
