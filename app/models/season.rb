# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  year       :string(255)
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sport_id   :string(255)
#  current    :boolean          default(FALSE)
#

class Season < ActiveRecord::Base
  # attr_accessor :year, :start_date, :current, :sport_id

  validates_presence_of :year, :start_date

  has_many :teams
  has_many :games

  scope :ordered, -> { order('year DESC') }

  def self.by_sport(sport)
    where sport_id: sport.id
  end

  def sport
    Sport.find(sport_id).name
  end

  def to_s
    "#{sport} #{year}"
  end
end
