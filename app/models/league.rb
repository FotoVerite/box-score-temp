class League < ActiveRecord::Base
  attr_accessible :name, :classification, :assn_id

  validates :name, presence: true, uniqueness: true

  belongs_to :assn
  has_many :teams

  scope :ordered, order('name')

  def to_s
    name
  end

  def name_with_assn
    "#{self.name} (#{self.assn.name})"
  end

  def self.names_with_assns_for_select
    League.ordered.includes(:assn).map do |league|
      [league.name_with_assn, league.id]
    end
  end
end
