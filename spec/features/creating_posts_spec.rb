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

  scenario 'editing a post from the post page' do
    admin = create(:admin, :superadmin)
    post_1 = create(:post)
    login_as admin

    visit post_path post_1
    click_on 'Edit Post'
    fill_in 'Title', with: 'An edited title'
    fill_in 'Excerpt', with: 'Helllllooooo world'
    fill_in 'Body', with: 'This post is edited'
    click_on 'Update Post'

    expect(page).to have_content 'An edited title'
    expect(page).to have_content 'Helllllooooo world'
    expect(page).to have_content 'This post is edited'
  end

  scenario 'deleting a post from the post page' do
    admin = create(:admin, :superadmin)
    post_1 = create(:post)
    login_as admin

    visit post_path post_1
    click_on 'Delete Post'

    expect(page).to_not have_content post_1.title
  end

  scenario 'editing a post from the post index' do
    admin = create(:admin, :superadmin)
    create(:post)
    login_as admin

    visit root_path

    expect(page).to have_link 'Edit Post'
  end

  scenario 'deleting a post from the post index' do
    admin = create(:admin, :superadmin)
    create(:post)
    login_as admin

    visit root_path

    expect(page).to have_link 'Delete Post'
  end

  scenario 'not seeing the edit and link in show page without privileges' do
    post_1 = create(:post)

    visit post_path post_1

    expect(page).to_not have_link 'Edit Post'
    expect(page).to_not have_link 'Delete Post'
  end

  scenario 'not seeing the edit and delete link in post index without privileges' do
    create(:post)

    visit root_path

    expect(page).to_not have_link 'Edit Post'
    expect(page).to_not have_link 'Delete Post'
  end

  scenario 'attempting to get to the edit link without privileges' do
    post_1 = create(:post)

    visit edit_post_path post_1

    expect(page.current_path).to eq root_path
  end
end
