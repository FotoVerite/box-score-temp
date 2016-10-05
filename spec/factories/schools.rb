# == Schema Information
#
# Table name: schools
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  mascot                  :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  assn_id                 :integer
#  address_1               :string(255)
#  address_2               :string(255)
#  athletic_director_name  :string(255)
#  athletic_director_email :string(255)
#  athletic_director_phone :string(255)
#  short_name              :string(255)
#

FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "school-#{n}" }
    sequence(:mascot) { |n| "mascot-#{n}" }

    after(:build) do |school, _evaluator|
      unless school.admins.any?
        school.admins << FactoryGirl.build(:admin, school: school)
      end
    end
  end
end
