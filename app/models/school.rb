class School < ActiveRecord::Base
  attr_accessible :mascot, :name, :athletic_director_name,
    :athletic_director_email, :athletic_director_phone, :address_1,
    :address_2, :assn_id, :short_name

  validates :name, presence: true, uniqueness: true

  belongs_to :assn
  has_many :teams
  has_many :players
  has_many :admins

  scope :ordered, order('name ASC')

  def games
    Game.with_team(self.teams)
  end

  def unpublished_games
    # only return drafts that I created (team_id is one of my teams)
    Game.unpublished.where(team_id: teams)
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end

  def short_name
    if (short = read_attribute(:short_name)).present?
      short
    else
      name
    end
  end
end
