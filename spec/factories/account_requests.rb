# == Schema Information
#
# Table name: account_requests
#
#  id                 :integer          not null, primary key
#  school_name        :string(255)
#  school_address     :string(255)
#  school_assn        :string(255)
#  school_league      :string(255)
#  applicant_name     :string(255)
#  applicant_email    :string(255)
#  applicant_phone    :string(255)
#  applicant_position :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  message            :text
#

FactoryBot.define do
  factory :account_request do
    school_name { 'New Applicant School' }
    applicant_name { 'John Doe' }
    applicant_email { 'john.doe@example.com' }
    applicant_position { 'Athletic director' }
  end
end
