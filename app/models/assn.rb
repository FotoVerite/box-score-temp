# == Schema Information
#
# Table name: assns
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assn < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :leagues
  has_many :schools
  has_many :teams, through: :leagues

  scope :ordered, -> { order('name') }

  def to_s
    name
  end
end
