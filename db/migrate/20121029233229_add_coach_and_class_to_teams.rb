class AddCoachAndClassToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :coach_name, :string
    add_column :teams, :coach_email, :string
    add_column :teams, :coach_phone, :string
    add_column :teams, :competitive_class, :string
  end
end
