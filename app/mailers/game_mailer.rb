class GameMailer < ActionMailer::Base
  default from: Devise.mailer_sender

  def new_stats(game)
    @game = game

    mail to: league_emails(game),
      subject: "Game stats have been posted for #{game.team.display_name} vs #{game.opponent.display_name}"
  end

  private

  def league_emails(game)
    game.team.league.teams(true).map(&:school).map(&:admins).flatten.map(&:email)
  end
end
