module GamesHelper
  def winner_class(game, t)
    if game.winner == t
      'winner'
    end
  end

  def twitter_box_score_message(team, opponent, date, url)
    "Box score for #{team.display_name} vs. #{opponent.display_name}, #{date.stamp('11/11/99')} is now posted: #{url}"
  end
end
