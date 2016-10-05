# == Schema Information
#
# Table name: posts
#
#  id                        :integer          not null, primary key
#  title                     :string(255)
#  body                      :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  excerpt                   :text
#  game_id                   :integer
#  header_image_file_name    :string(255)
#  header_image_content_type :string(255)
#  header_image_file_size    :integer
#  header_image_updated_at   :datetime
#  email                     :boolean          default(FALSE), not null
#  admin_id                  :integer
#

class Post < ActiveRecord::Base
  belongs_to :game
  validates :body, presence: true
  validates :title, presence: true
  has_attached_file :header_image,
                    styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/

  paginates_per 5

  def excerpt
    super || stripped_body.try(:truncate, 200)
  end

  private

  def stripped_body
    ActionController::Base.helpers.strip_tags(body)
  end
end
