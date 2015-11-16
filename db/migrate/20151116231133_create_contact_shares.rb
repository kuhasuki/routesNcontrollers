class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |q|
      q.integer :contact_id, null: false
      q.integer :user_id, null: false

      q.timestamps
    end
    add_index :contact_shares, :contact_id
    add_index :contact_shares, [:user_id, :contact_id], unique: true
  end
end
