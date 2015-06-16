require 'spec_helper'

feature 'creating a post' do
  scenario 'attempting to create a post without logging in' do
    visit new_post_path
    expect(current_path).to eq root_path
  end

  scenario 'creating a post' do
    @admin = create(:admin, email: "elijah@wizarddevelopment.com")
    login_as @admin

    visit root_path
    click_on 'New Post'
    fill_in 'Title', with: 'This is my title'
    fill_in 'Excerpt', with: 'Hello world'
    fill_in 'Body', with: 'This is the body of my post!'
    click_on 'Create Post'

    expect(page).to have_content 'This is my title'
    expect(page).to have_content 'Hello world'
    expect(page).to have_content 'This is the body of my post!'
  end

  scenario 'creating a bad post' do
    @admin = create(:admin, email: "elijah@wizarddevelopment.com")
    login_as @admin

    visit new_post_path
    fill_in 'Title', with: "This post doesn't have a body"
    click_on 'Create Post'

    expect(page).to have_content "Body can't be blank"
    expect(page).to have_content "Excerpt can't be blank"
  end
end
