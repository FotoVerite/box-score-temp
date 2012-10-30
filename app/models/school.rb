class School < ActiveRecord::Base
  attr_accessible :mascot, :name, :athletic_director_name,
    :athletic_director_email, :athletic_director_phone, :address_1,
    :address_2, :assn_id

  validates :name, presence: true, uniqueness: true

  belongs_to :assn
  has_many :teams
  has_many :players
  has_many :admins

  def games
    Game.with_team(self.teams)
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
