module GamesHelper
  def winner_class(game, t)
    if game.winner == t
      'winner'
    end
  end
end
