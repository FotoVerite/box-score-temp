require "spec_helper"

describe GameMailer do
  include Rails.application.routes.url_helpers

  describe "new_stats" do
    let(:opponent) { create(:team) }
    let(:game) { create(:game, opponent: opponent) }
    let(:mail) { GameMailer.new_stats(game) }

    it "has the proper subject" do
      mail.subject.should eq("Game stats have been posted for #{game.team.display_name} vs #{game.opponent.display_name}")
    end

    it "sends it to everyone in both leagues" do
      game.opponent.league.should_not eq(game.team.league)

      other_team_in_league = create(:team, league: game.team.league)

      expected_emails = [
        game.team.school.admins.map(&:email),
        game.opponent.school.admins.map(&:email),
        other_team_in_league.school.admins.map(&:email)
      ].flatten

      mail.to.sort.should eq(expected_emails.sort)
    end

    it "has the proper from address" do
      mail.from.should eq([Devise.mailer_sender])
    end

    it "links to the game page" do
      mail.body.encoded.should match(game_url(game))
    end
  end
end
