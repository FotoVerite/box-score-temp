class GameMailer < ActionMailer::Base
  default from: Devise.mailer_sender

  def new_stats(game)
    @game = game

    mail to: 'info@hsboxscoresnyc.com',
      bcc: league_emails(game),
      subject: "A final box score has been posted for #{game.team.display_name} vs #{game.opponent.display_name}"
  end

  private

  def league_emails(game)
    [game.team.league, game.opponent.league].uniq.map do |league|
      league.teams(true).map(&:school).map(&:admins).flatten.map(&:email)
    end.flatten.uniq
  end
end
