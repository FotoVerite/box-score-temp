step "a season exists in the database" do
  pending
  @season = create :season
end

step "I visit my teams page" do
  visit teams_path
end

step "I enter data in the required fields" do
  page.select 'Boys Basketball', from: 'Sport'
  save_and_open_page
  page.select 'Boys Basketball 2011-2012', from: 'Season'
end

step "I click on the 'Create team' button" do
  click_link('Create New Team')
end

step "I am taken to the new team page" do
  page.should have_content('Create a new team')
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
