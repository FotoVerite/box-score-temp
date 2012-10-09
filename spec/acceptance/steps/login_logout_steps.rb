step 'there is an admin user in the database' do
  @admin = create :admin, email: 'admin@example.com', password: 'testing'
end

step 'I am not logged in' do
end

step 'I am logged in' do
  step "there is an admin user in the database"
  step "I visit the login page"
  step "I enter a valid email address and password into the login form"
end

step 'I visit the home page' do
  visit root_path
end

step 'I should see the "Log in" link' do
  page.should have_css('a#login')
end

step 'I click on the "Log in" link' do
  click_link('login')
end

step 'I should be sent to a login page' do
  page.should have_content('Sign in')
end

step 'I visit the login page' do
  visit new_admin_session_path
end

step 'I enter a valid email address and password into the login form' do
  fill_in('Email', with: 'admin@example.com')
  fill_in('Password', with: 'testing')
  click_button('Sign in')
end

step 'I should see the "Log out" link' do
  page.should have_css('a#logout')
end

step 'I click on the "Log out" link' do
  click_link('logout')
end
