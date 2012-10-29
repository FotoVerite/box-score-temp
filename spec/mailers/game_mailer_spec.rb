require "spec_helper"

describe GameMailer do
  include Rails.application.routes.url_helpers

  describe "new_stats" do
    let(:game) { create(:game) }
    let(:mail) { GameMailer.new_stats(game) }

    it "has the proper subject" do
      mail.subject.should eq("Game stats have been posted for #{game.team.display_name} vs #{game.opponent.display_name}")
    end

    it "sends it to everyone in the league" do
      other_team_in_league = create(:team, league: game.team.league)

      expected_emails = [
        game.team.school.admins.map(&:email),
        game.opponent.school.admins.map(&:email),
        other_team_in_league.school.admin.email
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
