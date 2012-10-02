class Season < ActiveRecord::Base
  attr_accessible :end_date, :league_id, :name, :start_date, :sport

  validates_presence_of :name, :start_date, :end_date, :sport

  belongs_to :league

  validates_uniqueness_of :name, scope: [:sport, :league_id]
end
