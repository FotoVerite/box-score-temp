require 'spec_helper'

feature 'creating a post' do
  scenario 'attempting to create a post without logging in' do
    visit new_post_path
    expect(current_path).to eq root_path
  end

  describe 'creating a post while being an admin' do
    let(:admin) { create(:admin, :superadmin) }

    scenario 'creating a post' do
      game = create(:game)
      login_as admin

      visit new_post_path
      fill_in 'Title', with: 'This is my title'
      fill_in 'Excerpt', with: 'Hello world'
      fill_in 'Body', with: 'This is the body of my post!'
      select game.title, from: 'post_game_id'
      click_on 'Create Post'

      expect(page).to have_content 'This is my title'
      expect(page).to have_content 'This is the body of my post!'
      expect(page).to have_content game.team.school_name
    end

    scenario 'creating a bad post' do
      login_as admin

      visit new_post_path
      fill_in 'Title', with: "This post doesn't have a body"
      click_on 'Create Post'

      expect(page).to have_content "Body can't be blank"
    end
  end

  describe "editing and deleting a post as an admin" do
    let(:admin) { create(:admin, :superadmin) }
    let(:post_1) { create(:post) }

    scenario 'editing a post from the post page' do
      game = create(:game)
      login_as admin

      visit post_path post_1
      click_on 'Edit Post'
      fill_in 'Title', with: 'An edited title'
      fill_in 'Excerpt', with: 'Helllllooooo world'
      fill_in 'Body', with: 'This post is edited'
      select game.title, from: 'post_game_id'
      click_on 'Update Post'

      expect(page).to have_content 'An edited title'
      expect(page).to have_content 'This post is edited'
      expect(page).to have_content game.team.school_name
    end

    scenario 'deleting a post from the post page' do
      login_as admin

      visit post_path post_1
      click_on 'Delete Post'

      expect(page).to_not have_content post_1.title
    end

    scenario 'editing a post from the post index' do
      create(:post)
      login_as admin

      visit root_path

      expect(page).to have_link 'Edit Post'
    end

    scenario 'deleting a post from the post index' do
      create(:post)
      login_as admin

      visit root_path

      expect(page).to have_link 'Delete Post'
    end
  end

  describe 'not having editing privileges' do
    let(:post_1) { create(:post) }

    scenario 'not seeing the edit and link in show page without privileges' do
      visit post_path post_1

      expect(page).to_not have_link 'Edit Post'
      expect(page).to_not have_link 'Delete Post'
    end

    scenario 'not seeing the edit and delete link in post index without privileges' do
      visit root_path

      expect(page).to_not have_link 'Edit Post'
      expect(page).to_not have_link 'Delete Post'
    end

    scenario 'attempting to get to the edit link without privileges' do
      visit edit_post_path post_1

      expect(page.current_path).to eq root_path
    end
  end

  scenario 'creating a post with a box score' do
    admin = create(:admin, :superadmin)
    game = create(:game)
    login_as(admin)

    visit game_path(game)
    click_on 'Write about this game'
    fill_in 'Title', with: 'A post about this game'
    fill_in 'Body', with: 'Hello'
    click_on 'Create Post'

    expect(page).to have_content game.team.school.name
  end

  scenario 'creating a post with a box score from the game index' do
    admin = create(:admin, :superadmin)
    create(:game, :published)
    login_as(admin)

    visit games_path
    click_on 'Write about it'

    expect(page).to have_content 'Post'
  end

  scenario 'not seeing the create a post links from the games' do
    create(:game, :published)

    visit games_path

    expect(page).to_not have_link 'Write about it'
  end

  scenario 'not seeing the create a post link from the game show page' do
    create(:game)

    visit games_path

    expect(page).to_not have_link 'Write about this game'
  end
end
