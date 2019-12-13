class ErrorsController < ApplicationController

  def not_found

  	render :action => 'not_found'
  	
  end

  def unacceptable

  	render :action => 'unaceptable'
  	
  end

  def internal_error

  	render :action => 'internal_error'
  	
  end
end
