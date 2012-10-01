class School < ActiveRecord::Base
  attr_accessible :mascot, :name, :assn

  validates_presence_of :name, :assn

  has_many :teams

  def assns
    School.uniq.pluck(:assn)
  end
end
