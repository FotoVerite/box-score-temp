class AccountRequest < ActiveRecord::Base
  attr_accessible :school_name, :school_address, :school_assn, :school_league, :applicant_name,
    :applicant_email, :applicant_phone, :applicant_position, :message

  validates_presence_of :school_name, :applicant_name, :applicant_email, :applicant_position

  validates :applicant_email, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
