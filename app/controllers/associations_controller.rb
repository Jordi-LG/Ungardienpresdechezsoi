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

end
