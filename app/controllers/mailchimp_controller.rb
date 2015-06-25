class MailchimpController < ApplicationController
  def feed
    @posts = Post.where(email: true)

    respond_to do |format|
      format.rss { render layout: false }
    end
  end
end
