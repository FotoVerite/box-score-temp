class AddEmailBooleanToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :email, :boolean, default: false

    Post.connection.execute(
      'UPDATE posts SET email = false'
    )

    change_column :posts, :email, :boolean, null: false
  end
end
