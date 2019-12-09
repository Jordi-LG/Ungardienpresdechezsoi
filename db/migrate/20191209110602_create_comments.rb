class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :ps_id

      t.belongs_to :petowner, index: true
      t.timestamps
    end
  end
end
