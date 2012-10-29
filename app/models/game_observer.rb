class GameObserver < ActiveRecord::Observer
  def after_create(game)
    GameMailer.new_stats(game).deliver
  end
end
