ActiveAdmin.register Petsitter do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :describe, :age, :phone_number, :garden, :living_space, :price, :account_validate

  action_item :validate, only: :show do
    link_to "Validate", validate_admin_petsitter_path(petsitter), method: :put if petsitter.account_validate == false
  end

  member_action :validate, method: :put do
    petsitter = Petsitter.find(params[:id])
    petsitter.update(account_validate: true)
    PetsitterMailer.validation_request(petsitter).deliver_now
    redirect_to admin_petsitter_path(petsitter)
  end

  action_item :unvalidate, only: :show do
    link_to "Unvalidate", unvalidate_admin_petsitter_path(petsitter), method: :put if petsitter.account_validate == true
  end

    member_action :unvalidate, method: :put do
    petsitter = Petsitter.find(params[:id])
    petsitter.update(account_validate: false)
    redirect_to admin_petsitter_path(petsitter)
  end

  index do
    selectable_column
    id_column
    column :account_validate
    column :first_name
    column :last_name
    column :email
    column :created_at
    actions
  end

    form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :describe
      f.input :age
      f.input :phone_number
      f.input :garden
      f.input :living_space
      f.input :price
      f.input :account_validate
    end
    f.actions
  end
  
end
