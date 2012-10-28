class GameObserver < ActiveRecord::Observer
  def after_create(game)
    GameMailer.new(game).deliver
  end
end
