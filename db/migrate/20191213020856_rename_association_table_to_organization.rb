class RenameAssociationTableToOrganization < ActiveRecord::Migration[5.2]
  def change
     rename_table :associations, :organizations
  
  end
end
