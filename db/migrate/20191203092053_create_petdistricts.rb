class CreatePetdistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :petdistricts do |t|

      t.timestamps
    end
  end
end
