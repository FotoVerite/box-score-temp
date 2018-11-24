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
#  slug                      :string
#

class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :game
  belongs_to :admin
  validates :body, presence: true
  validates :title, presence: true
  has_attached_file :header_image,
                    default_url: "missing_post_header.png",
                    styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/

  scope :published?, -> {where("published_at < ?", Time.zone.now )}
  scope :unpublished, -> {where("published_at IS NULL")}

  def excerpt
    !super.blank? ? super : stripped_body.try(:truncate, 200)
  end

  private

  def stripped_body
    ActionController::Base.helpers.strip_tags(body)
  end
end
