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

class AccountRequest < ActiveRecord::Base
  include Rakismet::Model

  validates_presence_of :school_name, :applicant_name, :applicant_email, :applicant_position

  validates :applicant_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  rakismet_attrs  author: :applicant_name,
                  author_email: :applicant_email,
                  content: :askismet_content

  def askismet_content
    content_attributes = (accessible_attrs - [:applicant_name, :applicant_email])
    content_attributes.map { |attr| "#{attr}: #{send(attr)}" }.join("\n")
  end

  def accessible_attrs
    AccountRequest.accessible_attributes.to_a.reject(&:empty?)
  end
end
