step "There exists many games" do
  @game_1 = create(:game, date: Date.today - 2)
  @game_2 = create(:game, date: Date.yesterday)
  @game_3 = create(:game, date: Date.today)
end

step "I go to see the games" do
  visit games_path
end

step "I can see the games" do
  expect(page).to have_content @game_1.team.school.name
  expect(page).to have_content @game_2.team.school.name
  expect(page).to have_content @game_3.team.school.name
end
