require 'spec_helper'

feature 'rss feed for mailchimp' do
  scenario 'getting the feed' do
    posts = create_list(:post, 5, :with_image, email: true)
    post_1 = create(:post, title: 'this should not be here')

    visit '/mailchimp/feed.rss'

    expect(page).to have_content posts.first.title
    expect(page).to have_content posts.first.excerpt
    expect(page).to have_content posts.last.title
    expect(page).to have_content posts.last.excerpt
    expect(page).to_not have_content post_1.title
  end

  scenario 'selecting a post for a feed' do
    admin = create(:admin, :superadmin)
    post_1 = create(:post)
    post_2 = create(:post, title: "this shouldnt be here")
    login_as admin

    visit edit_post_path(post_1)
    check 'post_email'
    click_on 'Update Post'
    visit '/mailchimp/feed.rss'

    expect(page).to have_content post_1.title
    expect(page).to_not have_content post_2.title
  end
end
