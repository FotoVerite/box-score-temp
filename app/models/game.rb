class Game < ActiveRecord::Base
  validates_presence_of :date
  validates_presence_of :sport
  validates_presence_of :competition_id
  validates_presence_of :site
  validates_presence_of :home_away

  belongs_to :team
  belongs_to :school
  belongs_to :season
end
