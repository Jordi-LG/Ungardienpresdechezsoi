ActiveAdmin.register Comment, as: "PetownerComment" do
  permit_params :title, :content, :ps_id, :petowner_id
index do
	selectable_column
  id_column
	column :title
	column :content
  column("Petowner", :petowner, :sortable => :petowner_id)
  column "Petsitter" do |m|
		link_to "#{Petsitter.find(m.ps_id).email} ", admin_petsitter_path(m.ps_id)
 	end
 	actions
 end
end
