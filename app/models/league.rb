class League < ActiveRecord::Base
  attr_accessible :name, :assn_id

  validates :name, presence: true, uniqueness: true

  belongs_to :assn
end
