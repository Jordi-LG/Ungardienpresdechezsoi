class ErrorsController < ApplicationController

  def not_found

  	render :action => 'not_found.html.erb'
  	
  end

  def unaceptable

  	render :action => 'unaceptable.html.erb'
  	
  end

  def internal_error

  	render :action => 'internal_error.html.erb'
  	
  end
end
