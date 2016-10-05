require 'rails_helper'

feature 'Looking at posts' do
  scenario 'Looking at the posts index' do
    @posts = create_list(:post, 4)

    visit root_path

    @posts.map(&:title).each do |title|
      expect(page).to have_content title
    end
  end

  scenario 'Looking at a single post' do
    @post = create(:post)

    visit post_path(@post)

    expect(page).to have_content @post.title
  end

  scenario 'Sharing posts through social media' do
    @post = create(:post)

    visit post_path(@post)

    expect(page).to have_content 'Share on Facebook'
    expect(page).to have_content 'Share on Twitter'
  end
end
