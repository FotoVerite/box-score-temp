# == Schema Information
#
# Table name: schools
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  mascot                  :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  assn_id                 :integer
#  address_1               :string(255)
#  address_2               :string(255)
#  athletic_director_name  :string(255)
#  athletic_director_email :string(255)
#  athletic_director_phone :string(255)
#  short_name              :string(255)
#

class School < ActiveRecord::Base


  validates :name, presence: true, uniqueness: true

  belongs_to :assn
  has_many :teams
  has_many :players
  has_many :admins

  scope :ordered, -> { order('name ASC') }

  def games
    Game.with_team(team_ids)
  end

  def unpublished_games
    # only return drafts that I created (team_id is one of my teams)
    Game.unpublished.where(team_id: teams)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def short_name
    if (short = self[:short_name]).present?
      short
    else
      name
    end
  end
end
