step "I have created a basketball team" do
  @basketball_team = create :team, sport: 'Boys Basketball', school_id: @admin.school_id
end

step "I have created a baseball team" do
  @baseball_team = create :team, sport: 'Boys Baseball', school_id: @admin.school_id
end

step "I visit the new game page" do
  visit new_game_path
end

step "I select my basketball team" do
  select('Boys Basketball', from: 'Team')
end

step "the potential opponents list should update" do
end

step "the game stats table should update with basketball fields" do
end

step "the player game stats table should update with basketball player fields" do
end
