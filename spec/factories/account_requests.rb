FactoryGirl.define do
  factory :account_request do
    school_name { 'New Applicant School' }
    applicant_name { 'John Doe' }
    applicant_email { 'john.doe@example.com' }
    applicant_position { 'Athletic director' }
  end
end

