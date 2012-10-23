class Assn < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  has_many :leagues
  has_many :teams, through: :leagues

  def to_s
    name
  end
end
