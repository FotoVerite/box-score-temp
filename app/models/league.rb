class League < ActiveRecord::Base
  attr_accessible :name, :classification, :assn_id

  validates :name, presence: true, uniqueness: true

  belongs_to :assn

  has_many :schools

  def self.names_with_assns_for_select
    names_with_assns = []

    League.all.each do |league|
      names_with_assns << ["#{league.name} (#{league.assn.name})", league.id]
    end

    names_with_assns
  end
end
