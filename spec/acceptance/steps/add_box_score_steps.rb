step "I have a basketball team" do
  @basketball_team = create :team, sport: 'Boys Basketball'
end

step "I click 'Add Box Score'" do
  click_link 'Add Box Score'
end
