class CreatePetsittings < ActiveRecord::Migration[5.2]
  def change
    create_table :petsittings do |t|
      t.boolean :validate_petsitter
      t.boolean :validate_petowner

      t.belongs_to :petowner, index: true
      t.belongs_to :petsitter, index: true
      
      t.timestamps
    end
  end
end
