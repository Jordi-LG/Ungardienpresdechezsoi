class CreatePetdistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :petdistricts do |t|
      t.belongs_to :district, index: true
      t.belongs_to :petsitter, index: true

      t.timestamps
    end
  end
end
