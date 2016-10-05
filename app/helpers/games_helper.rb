module GamesHelper
  def winner_class(game, t)
    'winner' if game.winner == t
  end

  def twitter_box_score_message(game)
    CGI.escape <<EOT.squish
Box score for #{game.team.school_name} vs. #{game.opponent.school_name}
 #{game.team.sport.name} #{game.date.stamp('11/11/99')} #{game_url(game)}
EOT
  end

  def box_score_email_link(game)
    CGI.escape "Box score posted: #{game.team.display_name} vs. #{game.opponent.display_name} #{game.date}: #{game_url(game)}"
  end

  def twitter_post_message(post)
    CGI.escape "#{post.title} #{post_url(post)}"
  end
end
