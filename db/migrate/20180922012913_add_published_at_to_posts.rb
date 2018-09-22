class AddPublishedAtToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :published_at, :datetime
    Post.all.each {|p| p.published_at = p.created_at; p.save}
  end
end
