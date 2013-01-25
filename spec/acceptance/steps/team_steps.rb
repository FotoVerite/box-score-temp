step "a season exists in the database" do
  @season = create :season
end

step "a league exists in the database" do
  @league = create :league
end

step "I visit my teams page" do
  visit teams_path
end

step "I enter data in the required fields" do
  page.select 'Boys Basketball', from: 'Sport'
  page.select '2012-2013', from: 'Season'
end

step "I click on the 'Create team' button" do
  click_link('Create New Team')
end

step "I am taken to the new team page" do
  page.should have_content('Create a New Team')
end

step "I visit the new team page" do
  visit new_team_path(@admin.school_id)
end

step "I click the 'Create team' button" do
  click_button('Create Team')
end

step "I should see the 'Delete team' button" do
  page.should have_css('a.delete-team')
end
