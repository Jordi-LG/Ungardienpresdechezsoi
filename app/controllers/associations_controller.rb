class AssociationsController < ApplicationController

  def index
    @associations = Association.all
  end

  def show
    @association = Association.find(params[:id])
  end
end
