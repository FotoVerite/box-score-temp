step 'there is an admin user in the database' do
  @admin = create(:admin)
end

step 'I am not logged in' do
  pending
end

step 'I am logged in' do
  pending
end

step 'I visit the home page' do
  visit '/'
end

step 'I should see the "Log in" link' do
  page.should have_css('a#login')
end

step 'I click on the "Log in" link' do
  click_link('login')
end

step 'I should be sent to a log in page' do
  pending
end

step 'I enter a valid email address and password on the log in page' do
  pending
end

step 'I should be taken to the landing page for my school\'s teams' do
  pending
end
