# == Schema Information
#
# Table name: assns
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :assn do
    sequence(:name) { |n| "Association-#{n}" }
  end
end
