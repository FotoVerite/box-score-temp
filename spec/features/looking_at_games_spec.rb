require 'spec_helper'

feature 'seeing games' do
  scenario 'while on the homepage, I should see the latest box scores' do
    game = create(:game)

    visit root_path

    expect(page).to have_content game.team.school_name
  end
end
