class AssociationsController < ApplicationController
  before_action :signed_in , only: [:show]

  def index
    @associations = Association.all
  end

  def show
    @association = Association.find(params[:id])
  end

  def signed_in
    if current_petsitter.nil? & current_petowner.nil?
      redirect_to new_petowner_session_path
    end
  end

  def new
  end

  def create
    @association = Association.create(name: association_form_params['name'], describe: association_form_params['describe'], date_of_birth: association_form_params['date_of_birth'], email: association_form_params['email'], facebook_url: association_form_params['facebook_url'], donation_url: association_form_params['donation_url'])

    puts "*" * 60
    puts @association.errors.messages

    if @association.save
      flash[:success] = "Votre dossier Association a bien été enregistrée !"
      redirect_to associations_path
    else
      flash[:warning] = @association.errors.messages
    end
  end

  private

  def association_form_params
    params.require(:association).permit(:name, :date_of_birth, :describe, :email, :facebook_url, :donation_url)
  end
end
