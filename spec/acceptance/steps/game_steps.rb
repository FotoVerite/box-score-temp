step "I have a team already created" do
  @team = create :team, school_id: @admin.school_id
end

step "I click on my team link" do
  click_link "#{@team.school.name} #{@team.sport}"
end

step "I should be taken to the new box score form" do
  page.should have_content 'Report a new box score'
end

step "I visit the new game page" do
  visit new_game_path
end

step "I enter a point value for each quarter" do
  pending
  #fill_in 'game_game_stats_q1_points', with: '15'
  #fill_in 'game_game_stats_q2_points', with: '11'
  #fill_in 'game_game_stats_q3_points', with: '17'
  #fill_in 'game_game_stats_q4_points', with: '14'
end

step "the team's total score field should update" do
  find('#game_game_stats_final_points').should have_content '60'
end
