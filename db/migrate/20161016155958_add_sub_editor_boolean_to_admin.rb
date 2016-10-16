class AddSubEditorBooleanToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :sub_editor, :boolean, default: false
  end
end
