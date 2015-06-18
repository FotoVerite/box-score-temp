class AddHeaderImageToPost < ActiveRecord::Migration
  def change
    add_attachment :posts, :header_image
  end
end
