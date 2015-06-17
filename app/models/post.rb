class Post < ActiveRecord::Base
  attr_accessible :body, :title, :excerpt

  validates :body, presence: true
  validates :title, presence: true

  def excerpt
    super || ActionController::Base.helpers.strip_tags(body)[0..200] + "..."
  end
end
