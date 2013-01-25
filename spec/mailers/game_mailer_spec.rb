require "spec_helper"

describe GameMailer do
  include Rails.application.routes.url_helpers

  describe "new_stats" do
    let(:opponent) { create(:team) }
    let(:game) { create(:game, opponent: opponent) }
    let(:mail) { GameMailer.new_stats(game) }

    it "has the proper subject" do
      mail.subject.should eq("A final box score has been posted for #{game.team.display_name} vs #{game.opponent.display_name}")
    end

    it "sends it to everyone in both leagues" do
      game.opponent.league.should_not eq(game.team.league)

      other_team_in_league = create(:team, league: game.team.league)

      expected_emails = [
        game.team.school.admins.map(&:email),
        game.opponent.school.admins.map(&:email),
        other_team_in_league.school.admins.map(&:email)
      ].flatten

      mail.to.should eq(['info@hsboxscoresnyc.com'])
      mail.bcc.sort.should eq(expected_emails.sort)
    end

    it "has the proper from address" do
      mail.from.should eq(['info@hsboxscoresnyc.com'])
    end

    it "links to the game page" do
      mail.body.encoded.should match(game_url(game))
    end

    it 'has the word "advertisement" in the body' do
      mail.text_part.body.raw_source.downcase.should include('advertisement')
      mail.html_part.body.raw_source.downcase.should include('advertisement')
    end

    it 'has the word "unsubscribe" in the body' do
      mail.text_part.body.raw_source.downcase.should include('unsubscribe')
      mail.html_part.body.raw_source.downcase.should include('unsubscribe')
    end
  end
end
