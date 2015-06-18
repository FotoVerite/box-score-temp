class Post < ActiveRecord::Base
  attr_accessible :body, :title, :excerpt, :game_id

  belongs_to :game

  validates :body, presence: true
  validates :title, presence: true

  def excerpt
    super || stripped_body.truncate(200)
  end

  private

  def stripped_body
    ActionController::Base.helpers.strip_tags(body)
  end
end
