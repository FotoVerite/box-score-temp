class Post < ActiveRecord::Base
  belongs_to :game
  attr_accessible :body, :title, :excerpt, :header_image, :game_id

  validates :body, presence: true
  validates :title, presence: true
  has_attached_file :header_image,
    styles: { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/

  def excerpt
    super || stripped_body.truncate(200)
  end

  private

  def stripped_body
    ActionController::Base.helpers.strip_tags(body)
  end
end
