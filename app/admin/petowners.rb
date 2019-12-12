ActiveAdmin.register Petowner do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :describe, :age, :phone_number, :district_id, :district_name

  index do
    selectable_column
    id_column
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
      f.input :district_id
    end
    f.actions
  end
end
