require "spec_helper"

describe GameMailer do
  include Rails.application.routes.url_helpers

  describe "new" do
    let(:game) { create(:game) }
    let(:mail) { GameMailer.new(game) }

    it "has the proper subject" do
      mail.subject.should eq("Game stats have been posted for #{game.team.display_name} vs #{game.opponent.display_name}")
    end

    it "sends it to everyone in the league" do
      other_team_in_league = create(:team, league: game.team.league)

      expected_emails = [
        game.team.school.admin.email,
        game.opponent.school.admin.email,
        other_team_in_league.school.admin.email
      ]

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
