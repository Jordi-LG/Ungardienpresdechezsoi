ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
    end

     columns do
       column do
         panel "Petsitters unvalidate" do
           ul do
             Petsitter.where(account_validate: false).each do |post|
               li link_to(post.email, admin_petsitter_path(post))
             end
           end
           if Petsitter.where(account_validate: false) == []
            para "Pas de nouvelles demande de validation"
        end
         end
       end
   end
     columns do
       column do
         panel "Association unvalidate" do
           ul do
             Organization.where(validate_association: false).each do |post|
               li link_to(post.name, admin_organization_path(post))
             end
           end
           if Organization.where(validate_association: false) == []
            para "Pas de nouvelles demande de validation"
        end
         end
       end
   end
  end
end
