class GameMailer < ActionMailer::Base
  default from: Devise.mailer_sender

  def new(game)
    @game = game

    mail to: league_emails(game),
      subject: "Game stats have been posted for #{game.team.display_name} vs #{game.opponent.display_name}"
  end

  private

  def league_emails(game)
    game.team.league.teams(true).map(&:school).map(&:admin).map(&:email)
  end
end
