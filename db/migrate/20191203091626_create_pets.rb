class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :birthday
      t.string :type
      t.boolean :sterilized

      t.timestamps
    end
  end
end
