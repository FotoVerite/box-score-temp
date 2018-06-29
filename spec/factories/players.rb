# == Schema Information
#
# Table name: players
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  last_name      :string(255)
#  school_id      :integer
#  middle_initial :string(255)
#

FactoryBot.define do
  factory :player do
    sequence(:first_name) { |n| "first-name-#{n}" }
    sequence(:last_name) { |n| "last-name-#{n}" }
  end
end
