ActiveAdmin.register Association do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :describe, :date_of_birth, :email, :facebook_url, :donation_url, :validate_association

  action_item :validate, only: :show do
    link_to "Validate", validate_admin_association_path(association), method: :put if association.validate_association == false
  end

  member_action :validate, method: :put do
    association = Association.find(params[:id])
    association.update(validate_association: true)
    AssociationMailer.validation_request_association(association).deliver_now
    redirect_to admin_root_path
  end

    action_item :unvalidate, only: :show do
    link_to "Unvalidate", unvalidate_admin_association_path(association), method: :put if association.validate_association == true
  end

  member_action :unvalidate, method: :put do
    association = Association.find(params[:id])
    association.update(validate_association: false)
    redirect_to admin_root_path
  end
end
