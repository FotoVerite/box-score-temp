# == Schema Information
#
# Table name: leagues
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  assn_id        :integer
#  classification :string(255)
#

FactoryGirl.define do
  factory :league do
    sequence(:name) { |n| "League-#{n}" }
    assn
  end
end
