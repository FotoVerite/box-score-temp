class AccountRequest < ActiveRecord::Base
  include Rakismet::Model
  attr_accessible :school_name, :school_address, :school_assn, :school_league, :applicant_name,
    :applicant_email, :applicant_phone, :applicant_position, :message

  validates_presence_of :school_name, :applicant_name, :applicant_email, :applicant_position

  validates :applicant_email, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  rakismet_attrs  author: :applicant_name,
                  author_email: :applicant_email,
                  content: :askismet_content

  def askismet_content
    content_attributes = (accessible_attrs - [:applicant_name, :applicant_email])
    content_attributes.map{ |attr| "#{attr}: #{send(attr)}" }.join("\n")
  end

  def accessible_attrs
    AccountRequest.accessible_attributes.to_a.reject(&:empty?)
  end
end
