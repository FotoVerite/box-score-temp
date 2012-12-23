require 'spec_helper'

describe School do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :teams }
  it { should have_many :players }
  it { should have_many :admins }

  it "has a valid fixture" do
    build(:school)
  end

  describe '#short_name' do
    it 'returns full name if short_name is blank' do
      school = build :school, name: 'Oakmont Regional HS', short_name: ''
      school.short_name.should eq('Oakmont Regional HS')
    end

    it 'returns short_name attribute if present' do
      school = build :school, name: 'Long name', short_name: 'Shorty'
      school.short_name.should eq('Shorty')
    end
  end
end
