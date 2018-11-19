class AddHeaderImageToPost < ActiveRecord::Migration[5.2]
  def change
    add_attachment :posts, :header_image
  end
end
