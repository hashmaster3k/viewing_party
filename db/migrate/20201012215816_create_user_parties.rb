class CreateUserParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parties do |t|
      t.references :party, foreign_key: true
      t.integer :host_id
      t.integer :invitee_id
    end
  end
end
