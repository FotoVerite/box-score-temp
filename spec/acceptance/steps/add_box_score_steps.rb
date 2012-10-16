step "I have a basketball team" do
  @basketball_team = create :team, sport: 'Boys Basketball'
end

step "I click 'Add Box Score'" do
  click_link 'Add Box Score'
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


