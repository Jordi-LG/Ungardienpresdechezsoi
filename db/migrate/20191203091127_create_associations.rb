class CreateAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :associations do |t|
      t.string :name
      t.text :describe
      t.date :date_of_birth
      t.string :email
      t.string :facebook_url
      t.string :donation_url

      t.timestamps
    end
  end
end
