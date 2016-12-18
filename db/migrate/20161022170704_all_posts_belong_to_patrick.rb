class AllPostsBelongToPatrick < ActiveRecord::Migration[5.0]
  def up
    admin_id = Admin.where(email: 'patrick@hsboxscoresnyc.com').first.try(:id)
    Post.update_all(:admin_id => admin_id)
  end
end
