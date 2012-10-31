class AddMessageToAccountRequests < ActiveRecord::Migration
  def change
    add_column :account_requests, :message, :text
  end
end
