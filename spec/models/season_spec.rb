require 'spec_helper'

describe Season do
  it { should validate_presence_of :name }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :end_date }
  it { should validate_presence_of :sport }

  it { should belong_to :league }

  it { should validate_uniqueness_of(:name), scope: :sport }
end
