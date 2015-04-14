class Page < ActiveRecord::Base
  attr_accessible :content, :title, :slug

  def show_last_updated?
    true if slug == 'privacy_policy' || slug == 'terms_of_service'
  end
end
