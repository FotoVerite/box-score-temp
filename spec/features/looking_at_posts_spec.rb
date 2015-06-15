require 'spec_helper'

feature "Looking at posts" do
  scenario "Looking at a single post" do
    @post = create(:post)

    visit post_path(@post)

    expect(page).to have_content @post.title
  end
end
