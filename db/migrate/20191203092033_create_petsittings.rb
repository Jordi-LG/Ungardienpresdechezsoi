class CreatePetsittings < ActiveRecord::Migration[5.2]
  def change
    create_table :petsittings do |t|
      t.boolean :validate_petsitter
      t.boolean :validate_petowner

      t.timestamps
    end
  end
end
