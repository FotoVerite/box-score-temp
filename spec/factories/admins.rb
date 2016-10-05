# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  school_id              :integer
#  sub_admin              :boolean          default(TRUE)
#

FactoryGirl.define do
  factory :admin do
    school
    email { FactoryGirl.generate(:email) }
    first_name { FactoryGirl.generate(:first_name) }
    last_name { FactoryGirl.generate(:last_name) }
    password 'password'

    trait :superadmin do
      sequence(:email) { |n| "user-#{n}@wizarddevelopment.com" }
    end
  end
end
