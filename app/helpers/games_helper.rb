module GamesHelper
  def winner_class(game, t)
    if game.winner == t
      'winner'
    end
  end

  def twitter_box_score_message(team, opponent, date, url)
    "Box score for #{team.school.name} vs. #{opponent.school.name} #{team.sport.name} #{date.stamp('11/11/99')} #{url}"
  end

  def box_score_email_link(game)
    CGI::escape "Box score posted: #{game.team.display_name} vs. #{game.opponent.display_name} #{game.date}: #{game_url(game)}"
  end
end
