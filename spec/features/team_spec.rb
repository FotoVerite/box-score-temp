require 'rails_helper'

feature 'creating and editing a team' do
  let(:admin) { create(:admin) }

  scenario 'creating a new team' do
    login_as(admin)

    visit teams_path
    click_on('Create New Team')

    expect(page).to have_content('Create a New Team')
  end

  scenario 'saving a team with valid data' do
    create(:season)
    create(:league)
    login_as(admin)

    visit new_team_path(admin.school)
    page.select 'Boys Basketball', from: 'Sport'
    page.select '2012-2013', from: 'Season'
    click_on('Create Team')

    expect(page).to have_css('a.delete-team')
  end
end
