ActiveAdmin.register Pet do
  permit_params :name, :birthday, :type, :sterilized, :petowner_id

    index as: :grid, columns: 5 do |product|
      resource_selection_cell product
      a (product.name), :href => admin_pet_path(product)
    div do
      a :href => admin_pet_path(product) do
        image_tag(product.avatar,width:100,height:80)
      end
    end
    a (product.petowner.email), :href => admin_petowner_path(product.petowner.id)
  end
end
