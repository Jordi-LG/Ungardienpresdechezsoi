class OrganizationsController < ApplicationController
	  before_action :signed_in , only: [:show]

  def index
    @associations = Organization.all
  end

  def show
    @association = Organization.find(params[:id])
  end

  def signed_in
    if current_petsitter.nil? & current_petowner.nil?
      redirect_to new_petowner_session_path
    end
  end

  def new
  end

  def create
    @association = Organization.new(name: association_form_params['name'], describe: association_form_params['describe'], date_of_birth: association_form_params['date_of_birth'], email: association_form_params['email'], facebook_url: association_form_params['facebook_url'], donation_url: association_form_params['donation_url'], validate_association: false)



    if @association.save
      flash.now[:success] = "Votre dossier Association a bien été enregistrée !"
      redirect_to organizations_path
    else
      flash.now[:warning] = @association.errors.messages
      redirect_to organizations_path
    end
  end

  private

  def association_form_params
    params.require(:organization).permit(:name, :date_of_birth, :describe, :email, :facebook_url, :donation_url, :validate_association)
  end
end
