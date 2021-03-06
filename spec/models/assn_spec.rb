# == Schema Information
#
# Table name: assns
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Assn do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should have_many :leagues }
  it { should have_many :schools }
end
