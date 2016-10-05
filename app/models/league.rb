# == Schema Information
#
# Table name: leagues
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  assn_id        :integer
#  classification :string(255)
#

class League < ActiveRecord::Base

  validates :name, presence: true, uniqueness: { case_sensitive: true }

  belongs_to :assn
  has_many :teams

  scope :ordered, -> { order('name') }

  def to_s
    name
  end

  def name_with_assn
    "#{name} (#{assn.name})"
  end

  def self.names_with_assns_for_select
    League.ordered.includes(:assn).map do |league|
      [league.name_with_assn, league.id]
    end
  end

  def genders
    genders = []
    genders << 'boys' if teams.any?(&:boys?)
    genders << 'girls' if teams.any?(&:girls?)
    genders
  end
end
