class PlayerGameStat < ActiveRecord::Base
  attr_accessible :stats, :player_id

  belongs_to :player
  belongs_to :game

  has_many :stat_records, order: 'position'

  validates :player_id, presence: true

  serialize :stats

  def method_missing(name, *args)
    if args.empty?
      return stat(name)
    end

    super(name, *args)
  end

  def stat(name)
    self.stats ||= {}
    self.stats[name.to_s]
  end
end
