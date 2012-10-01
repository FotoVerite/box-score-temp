class School < ActiveRecord::Base
  attr_accessible :mascot, :name, :league_id

  validates :name, presence: true, uniqueness: true

  belongs_to :league

  has_many :teams

  #def assn_ids
    #School.uniq.pluck(:assn_id)
  #end

  #def league_ids
    #School.uniq.pluck(:league_id)
  #end

end
