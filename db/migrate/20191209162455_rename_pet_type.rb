class RenamePetType < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :type, :pet_type
    rename_column :pets, :birthday, :birth_year
    add_column :pets, :sexe, :string
  end
end
