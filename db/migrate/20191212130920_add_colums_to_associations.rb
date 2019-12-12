class AddColumsToAssociations < ActiveRecord::Migration[5.2]
  def change
    add_column :associations, :image_tag, :string
    add_column :associations, :describe_short, :text
    add_column :associations, :actions, :text
    add_column :associations, :actions_2, :text
  end
end
