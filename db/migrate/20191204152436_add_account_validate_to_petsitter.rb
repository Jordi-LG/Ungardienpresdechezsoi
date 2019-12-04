class AddAccountValidateToPetsitter < ActiveRecord::Migration[5.2]
  def change
  	remove_column :petsitters, :account_validate?
    add_column :petsitters, :account_validate, :boolean
  end
end
