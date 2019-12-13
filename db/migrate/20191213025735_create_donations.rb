class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.integer :id_user
      t.boolean :is_po
      t.boolean :is_ps
      t.string :stripe_customer_id
      t.belongs_to :organization, index: true
      t.timestamps

    end
  end
end
