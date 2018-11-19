class CreateAccountRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :account_requests do |t|
      t.string :school_name
      t.string :school_address
      t.string :school_assn
      t.string :school_league
      t.string :applicant_name
      t.string :applicant_email
      t.string :applicant_phone
      t.string :applicant_position

      t.timestamps
    end
  end
end
