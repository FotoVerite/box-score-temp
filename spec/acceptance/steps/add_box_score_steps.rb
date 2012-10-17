step "I have a basketball team" do
  @basketball_team = create :team
end

step "I click 'Add Box Score'" do
  # this will fail when the admin  menu is hidden
  pending
  #click_link 'Add Box Score'
end

step "I select my basketball team" do
  pending
  #select("#{@basketball_team.display_name}", from: 'Team')
end

step "the potential opponents list should update" do
end

step "the game stats table should update with basketball fields" do
end

step "the player game stats table should update with basketball player fields" do
end


