# == Schema Information
#
# Table name: player_game_stats
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stats      :text
#  position   :integer
#

class PlayerGameStat < ActiveRecord::Base
  # attr_accessor :stats, :player_id

  belongs_to :player
  belongs_to :game

  has_many :stat_records, -> { order('position') }

  validates :player_id, presence: true

  serialize :stats

  def method_missing(name, *args)
    return stat(name) if args.empty?

    super(name, *args)
  end

  def stat(name)
    self.stats ||= {}
    self.stats[name.to_s]
  end
end
