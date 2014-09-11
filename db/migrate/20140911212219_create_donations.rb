class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.text    "amount"
      t.text    "description"
      t.integer "user_id"
    end
  end
end
