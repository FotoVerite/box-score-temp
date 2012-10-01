class School < ActiveRecord::Base
  attr_accessible :mascot, :name, :assn, :league_id, :league, :assn_id, :assn

  validates_presence_of :name

  belongs_to :league
  belongs_to :assn

  has_many :teams

  #def assn_ids
    #School.uniq.pluck(:assn_id)
  #end

  #def league_ids
    #School.uniq.pluck(:league_id)
  #end

end
