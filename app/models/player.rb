class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates_presence_of :first_name, :last_name

  has_and_belongs_to_many :teams

  scope :matching, lambda { |name| where("first_name ilike :name or last_name ilike :name", name: "%#{name}%") }
end
