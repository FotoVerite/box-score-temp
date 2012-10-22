class Assn < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  has_many :leagues

  def to_s
    name
  end

  def leagues
    League.where(assn_id: id)
  end
end
