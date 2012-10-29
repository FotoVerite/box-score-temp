require 'spec_helper'

describe GameObserver do
  it "uses GameMailer to send an email" do
    game = build(:game)

    mock_mailer = mock
    mock_mailer.should_receive(:deliver)
    GameMailer.should_receive(:new_stats).with(game).and_return(mock_mailer)

    game.save!
  end
end
