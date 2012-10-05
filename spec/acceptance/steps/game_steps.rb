step "I have a team already created" do
  @team = create :team, school_id: @admin.school_id
end

step "I click on my team link" do
  click_link "#{@team.school.name} #{@team.sport}"
end

step "I should be taken to the new team form" do
  page.should have_content 'Create New Game'
end

step "I visit the new game page" do
  visit new_game_path
end

step "I enter a point value for a quarter" do
  fill_in('Q1', with: '15')
  find('#game_game_stats_q1_points').trigger('blur')
end

step "the team's total score field should update" do
end
