class AddAccountValidateToPetsitter < ActiveRecord::Migration[5.2]
  def change
  	remove_column :petsitters, :account_validate?, :boolean
    add_column :petsitters, :account_validate, :boolean
  end
end
