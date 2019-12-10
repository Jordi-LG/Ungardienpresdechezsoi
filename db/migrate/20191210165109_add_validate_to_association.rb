class AddValidateToAssociation < ActiveRecord::Migration[5.2]
  def change
    add_column :associations, :validate_association, :boolean
  end
end
