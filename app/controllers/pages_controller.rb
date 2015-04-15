class PagesController < ApplicationController
  before_filter :find_and_render_page

  def about
  end

  def contact
  end

  def terms_of_service
  end

  def privacy_policy
  end

  def faq
  end

  private

  def find_and_render_page
    @page = Page.find_by_slug(params['action'])
    if @page
      render '_page'
    else
      redirect_to root_path
    end
  end
end
