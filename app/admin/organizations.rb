ActiveAdmin.register Organization do
  permit_params :name, :describe, :date_of_birth, :email, :facebook_url, :donation_url, :validate_association, :image_tag, :describe_short, :actions, :actions_2

action_item :validate, only: :show do
    link_to "Validate", validate_admin_organization_path(organization), method: :put if organization.validate_association == false
  end

  member_action :validate, method: :put do
    association = Organization.find(params[:id])
    association.update(validate_association: true)
    AssociationMailer.validation_request_association(association).deliver_now
    redirect_to admin_root_path
  end

    action_item :unvalidate, only: :show do
    link_to "Unvalidate", unvalidate_admin_organization_path(organization), method: :put if organization.validate_association == true
  end

  member_action :unvalidate, method: :put do
    association = Organization.find(params[:id])
    association.update(validate_association: false)
    redirect_to admin_root_path
  end
end
